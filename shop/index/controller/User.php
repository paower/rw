<?php
namespace app\index\controller;
use app\common\controller\HomeBase;
use think\Session;
use think\Db;
use think\Request;
class User extends HomeBase
{
	public function index()
	{
		return $this->fetch();
	}
	
	//	设置
	public function setting()
	{
		if(!Session::has('user_id')){
			$this->redirect('Login/login');
		}
		
		return $this->fetch();
	}
	
	//邀请好友
	public function invitation()
	{
		if(!Session::has('user_id')){
			$this->redirect('Login/login');
		}
		$user = Db::name('user')->where('user_id',Session::get('user_id'))->find();
		$user['invitation_user'] = Db::name('user')->where('invitation_id',Session::get('user_id'))->select();
		$user['invitation_num'] = Db::name('user')->where('invitation_id',Session::get('user_id'))->count();
		
		$request = Request::instance();
        $domain=$request->domain();

		$savePath = APP_PATH . '/../Public/qrcode/';
		$webPath = 'public/qrcode/';
		$qrData = $domain . '/index/login/register?id=' . Session::get('user_id');
		$qrLevel = 'H';
		$qrSize = '8';
		$savePrefix = 'NickBai';
	
		if($filename = createQRcode($savePath, $qrData, $qrLevel, $qrSize, $savePrefix)){
			$pic = $webPath . $filename;
		}
		//dump($user);die;
		$this->assign([
			'user'=>$user,
			'pic'=>$pic,
			'qrData' =>$qrData,
		]);
		return $this->fetch();
	}
	
	//	钱包
	public function wallet()
	{
		if(!Session::has('user_id')){
			$this->redirect('Login/login');
		}
		$wallet = Db::name('wallet')->where('uid',Session::get('user_id'))->find();
		//dump($wallet);die;
		$total = $wallet['principal'] + $wallet['interest'];
		$this->assign([
			'wallet'=>$wallet,
			'total'=>$total,
		]);
		return $this->fetch();
	}
	
	//账单
	public function bill()
	{
		if(!Session::has('user_id')){
			$this->redirect('Login/login');
		}
		$list = Db::name('finance')->where(array('uid'=>Session::get('user_id'),'type'=>['in','1,2,3,4']))->order('creation_time desc')->select();
		$this->assign([
			'list' => $list,
		]);
		return $this->fetch();
	}
	
	//收益
	public function profit()
	{
		if(!Session::has('user_id')){
			$this->redirect('Login/login');
		}
		$list = Db::name('finance')->where(array('uid'=>Session::get('user_id'),'type'=>5))->order('creation_time desc')->select();
		$this->assign([
			'list' => $list,
		]);
		return $this->fetch();
	}
	
	//提现
	public function withdrawal()
	{
		if(!Session::has('user_id')){
			$this->redirect('Login/login');
		}
		if(request()->isPost()){
			$price = input('post.price');
			$wallet = Db::name('wallet')->where('uid',Session::get('user_id'))->find();
			if($price > $wallet['principal']){
				return ['error'=>false,'text'=>'可提现余额不足'];
			}
			$pay_password = md5(input('post.pay_password'));
			$user = Db::name('user')->where('user_id',Session::get('user_id'))->find();
			if($pay_password != $user['pay_password']){
				return ['error'=>false,'text'=>'安全密码不正确'];
			}
			$captcha = input('post.captcha');
			if(!captcha_check($captcha)){
				return ['error'=>false,'text'=>'验证码不正确'];
			};
			$user_bank_id = Db::name('user_bank')->where(array('uid'=>Session::get('user_id'),'default'=>1))->value('user_bank_id');
			if(empty($user_bank_id)){
				return ['error'=>false,'text'=>'请设置默认银行卡'];
			}
			$data = [
    			'price'=>$price,
    			'uid'=>Session::get('user_id'),
    			'user_bank_id'=>$user_bank_id,
    			'type'=>2,
    			'creation_time'=>time(),
    			'state'=>1
    		];
    		if(Db::name('finance')->insert($data)){
    			Db::name('wallet')->where('uid',Session::get('user_id'))->setDec('principal',$price);
    			return ['success'=>true,'text'=>'提交成功，请耐心等待平台审核'];
    		}else{
    			return ['error'=>false,'text'=>'提交失败'];
    		}
		}
		
		return $this->fetch();
	}
	
	//充值
	public function recharge()
	{
		if(!Session::has('user_id')){
			$this->redirect('Login/login');
		}
		$this->assign('bank_name',Db::name('config')->where('name','bank_name')->value('value'));
		$this->assign('bank_name2',Db::name('config')->where('name','bank_name2')->value('value'));
		$this->assign('bank_user',Db::name('config')->where('name','bank_user')->value('value'));
		$this->assign('bank_num',Db::name('config')->where('name','bank_num')->value('value'));
		
		if(request()->isPost()){
			$price = input('post.price');
			$pay_password = md5(input('post.pay_password'));
			$user = Db::name('user')->where('user_id',Session::get('user_id'))->find();
			if($pay_password != $user['pay_password']){
				return ['error'=>false,'text'=>'安全密码不正确'];
			}
			$file = $this->request->file('img');
			//dump($file);die;
	        $info = $file->validate(['ext'=>'jpg,png,gif'])->move(ROOT_PATH . 'public' . DS . 'uploads'. DS . 'user');
	        if($info){
	            $filePath = 'user/'.$info->getSaveName();
	            
	            $user_bank_id = Db::name('user_bank')->where(array('uid'=>Session::get('user_id'),'default'=>1))->value('user_bank_id');
	            if(empty($user_bank_id)){
	            	return ['error'=>false,'text'=>'请设置默认银行卡'];
	            }
	    		$data = [
	    			'price'=>$price,
	    			'voucher'=>$filePath,
	    			'uid'=>Session::get('user_id'),
	    			'user_bank_id'=>$user_bank_id,
	    			'type'=>1,
	    			'creation_time'=>time(),
	    			'state'=>1
	    		];
	    		if(Db::name('finance')->insert($data)){
	    			return ['success'=>true,'text'=>'提交成功，请耐心等待平台审核'];
	    		}else{
	    			return ['error'=>false,'text'=>'提交失败'];
	    		}
	        }else{
	            return ['error'=>false,'text'=>'图片上传出错'];
	        }
		}
		
		return $this->fetch();
	}
	
	//	优惠券
	public function coupon()
	{
		if(!Session::has('user_id')){
			$this->redirect('Login/login');
		}
		$user_coupon = Db::name('user_coupon')
		->alias('uc')
		->join('coupon c','c.coupon_id = uc.coupon_id')
		->where('uc.uid',Session::get('user_id'))
		->select();
		foreach($user_coupon as $key => $value){
			if($value['expire_time'] <= time()){
				Db::name('user_coupon')->where('user_coupon_id',$value['user_coupon_id'])->update(['state'=>3]);
			}
		}
		
		$user_coupon1 = Db::name('user_coupon')
		->alias('uc')
		->join('coupon c','c.coupon_id = uc.coupon_id')
		->where(['uc.uid'=>Session::get('user_id'),'uc.state'=>1])
		->select();
		
		$user_coupon2 = Db::name('user_coupon')
		->alias('uc')
		->join('coupon c','c.coupon_id = uc.coupon_id')
		->where(['uc.uid'=>Session::get('user_id'),'uc.state'=>2])
		->select();
		
		$user_coupon3 = Db::name('user_coupon')
		->alias('uc')
		->join('coupon c','c.coupon_id = uc.coupon_id')
		->where(['uc.uid'=>Session::get('user_id'),'uc.state'=>3])
		->select();
		
		$this->assign([
			'user_coupon1' => $user_coupon1,
			'user_coupon2' => $user_coupon2,
			'user_coupon3' => $user_coupon3,
		]);
		
		return $this->fetch();
	}
	
	//	地址
	public function address()
	{
		if(!Session::has('user_id')){
			$this->redirect('Login/login');
		}
		$address = Db::name('address')->where('uid',Session::get('user_id'))->select();
		$this->assign([
			'address'=>$address
		]);
		return $this->fetch();
	}
	
	//修改地址
	public function setaddress()
	{
		if(!Session::has('user_id')){
			$this->redirect('Login/login');
		}
		if(request()->isPost()){
			$addressData['name'] = input('post.name');
			$addressData['telephone'] = input('post.telephone');
			$addressData['address'] = input('post.address');
			$addressData['default'] = input('post.Default');
			$addressData['province_id'] = input('post.province_id');
			$addressData['city_id'] = input('post.city_id');
			$addressData['country_id'] = input('post.country_id');
			if(input('post.Default') == 2){
				Db::name('address')->where('uid',Session::get('user_id'))->update(['default'=>1]);
			}
			if(Db::name('address')->where(['uid'=>Session::get('user_id'),'address_id'=>input('post.address_id')])->update($addressData)){
				return ['success'=>true,'text'=>'修改成功'];
			}else{
				return ['success'=>false,'text'=>'修改失败'];
			}
		}
		
		$address = Db::name('address')->where('address_id',input('param.id'))->find();
		$area = [];
		$area_province = Db::name('area')->where(array('area_parent_id'=>0,'area_deep'=>1))->select();
		foreach($area_province as $area_province_key => $area_province_value){
			$area[$area_province_key]['name'] = $area_province_value['area_name'];
			$area[$area_province_key]['id'] = $area_province_value['area_id'];
			$area_city = Db::name('area')->where(array('area_parent_id'=>$area_province_value['area_id'],'area_deep'=>2))->select();
			foreach($area_city as $area_city_key => $area_city_value){
				$area[$area_province_key]['sub'][$area_city_key]['name'] = $area_city_value['area_name'];
				$area[$area_province_key]['sub'][$area_city_key]['id'] = $area_city_value['area_id'];
				$area_country = Db::name('area')->where(array('area_parent_id'=>$area_city_value['area_id'],'area_deep'=>3))->select();
				foreach($area_country as $area_country_key => $area_country_value){
					$area[$area_province_key]['sub'][$area_city_key]['sub'][$area_country_key]['name'] = $area_country_value['area_name'];
					$area[$area_province_key]['sub'][$area_city_key]['sub'][$area_country_key]['id'] = $area_country_value['area_id'];
				}
			}
		}
		//dump($area);die;
		$this->assign([
			'address'=>$address,
			'area'=>$area
		]);
		return $this->fetch();
	}
	
	//添加地址
	public function addaddress()
	{
		if(!Session::has('user_id')){
			$this->redirect('Login/login');
		}
		if(request()->isPost()){
			$addressData['name'] = input('post.name');
			$addressData['telephone'] = input('post.telephone');
			$addressData['address'] = input('post.address');
			$addressData['default'] = input('post.Default');
			$addressData['province_id'] = input('post.province_id');
			$addressData['city_id'] = input('post.city_id');
			$addressData['country_id'] = input('post.country_id');
			$addressData['uid'] = Session::get('user_id');
			if(input('post.Default') == 2){
				Db::name('address')->where('uid',Session::get('user_id'))->update(['default'=>1]);
			}
			if(Db::name('address')->insert($addressData)){
				return ['success'=>true,'text'=>'添加成功'];
			}else{
				return ['success'=>false,'text'=>'添加失败'];
			}
		}
	}
	
	//删除地址
	public function deladdress(){
		if(request()->isPost()){
			if(!Session::has('user_id')){
				$this->redirect('Login/login');
			}
			$address_id = input('post.address_id');
			if(Db::name('address')->where('address_id',$address_id)->delete()){
				return ['success'=>true,'text'=>'删除成功'];
			}else{
				return ['success'=>false,'text'=>'删除失败'];
			}
		}
	}
	
	//	售后服务
	public function service()
	{
		if(!Session::has('user_id')){
			$this->redirect('Login/login');
		}
		return $this->fetch();
	}
	
	//常见问题
	public function logistics()
	{
		if(!Session::has('user_id')){
			$this->redirect('Login/login');
		}
		return $this->fetch();
	}
	
}

?>