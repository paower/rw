<?php
namespace app\member\controller;
use app\common\controller\AdminBase;
use think\Db;
class MemberBackend extends AdminBase{
	
	protected function _initialize(){
		parent::_initialize();
		$this->assign('breadcrumb1','会员');
		$this->assign('breadcrumb2','会员管理');
	}
	
     public function index(){     	

		$param=input('param.');
		
		$query=[];
		
		if(isset($param['user_name'])){		
			$map['u.user_name']=['like',"%".$param['user_name']."%"];
			$query['u.user_name']=urlencode($param['user_name']);
		}else{
			$map['u.user_id']=['gt',0];
		}
		
		$list=[];
		
		$list=Db::name('user')->alias('u')->where($map)->order('u.user_id desc')->paginate(config('page_num'),false,$query);		
		
		$this->assign('list',$list);
				
		$this->assign('empty','<tr><td colspan="20">没有数据~</td></tr>');
		
    	return $this->fetch();
	 }
	 public function add(){
	 	
		if(request()->isPost()){
			$date=input('post.');
			$res=Db::name('user')->where('user_phone='.$date['user_phone'])->find();	
			if(!empty($res)){
				return ['error'=>'该手机号码已被注册'];
			}
			$member['user_name']=$date['user_name'];
			$member['password']=md5($date['password']);
			$member['pay_password']=md5($date['pay_password']);
			$member['user_retime']=time();
			$member['user_phone']=$date['user_phone'];
			$member['user_photo']=$date['image'];
			
			$uid=Db::name('user')->insert($member,false,true);
			
			if($uid){
				
				storage_user_action(UID,session('user_auth.username'),config('BACKEND_USER'),'新增了会员');
			
				return ['success'=>'新增成功','action'=>'add'];
			}else{
				return ['error'=>'新增失败'];
				
			}
			
		}
		$this->assign('crumbs','新增');
	 	return $this->fetch();
	 }
 	 public function edit(){
	 	
		if(request()->isPost()){
			$date=input('post.');		
			if($date['password'] == '000000'){
				$member['password']=$date['password1'];
			}else{
				$member['password']=md5($date['password']);
			}
			if($date['pay_password'] == '000000'){
				$member['pay_password']=$date['pay_password1'];
			}else{
				$member['pay_password']=md5($date['pay_password']);		
			}
			$member['status']=$date['status'];
			$member['user_phone']=$date['user_phone'];
			$member['user_name']=$date['user_name'];
			$member['user_photo'] = $date['image'];
			
			if(Db::name('user')->where('user_id',$date['user_id'])->update($member)){
				
				storage_user_action(UID,session('user_auth.username'),config('BACKEND_USER'),'编辑了会员');
				return ['success'=>'修改成功','action'=>'edit'];
			}else{
				return ['error'=>'修改失败'];
			}
		}
		
		$list=[
			'info'=>Db::name('user')->find(input('param.id')),
			'address'=>Db::name('address')->where('uid',input('param.id'))->select()
		];
		$this->assign('data',$list);
		$this->assign('group',Db::name('member_auth_group')->field('id,title')->select());
		$this->assign('crumbs','会员资料');
		
		$province = Db::name('area')->where('area_deep',1)->select();
		$city = Db::name('area')->where('area_deep',2)->select();
		$country = Db::name('area')->where('area_deep',3)->select();
		$wallet =Db::name('wallet')->where('uid',input('param.id'))->find();
		
		$this->assign([
			'province'=>$province,
			'city'=>$city,
			'country'=>$country,
			'json_city'=>json_encode($city),
			'json_country'=>json_encode($country),
			'wallet'=>$wallet
		]);
	 	return $this->fetch('info');
	 }
 	
 	
 	public function addAddress()
 	{
 		if(request()->isPost()){
			$date=input('post.');
			$res=Db::name('user')->where('user_id='.$date['uid'])->find();	
			if(empty($res)){
				return ['error'=>'该会员账号不存在'];
			}
			$address['uid']=$date['uid'];
			$address['name']=$date['name'];
			$address['telephone']=$date['telephone'];
			$address['address']=$date['address'];
			$address['city_id']=$date['city'];
			$address['country_id']=$date['country'];
			$address['province_id']=$date['province'];
			$address['default']=$date['default'];
			
			if($address['default']==2){
				Db::name('address')->where(['uid'=>$date['uid'],'default'=>2])->update(['default'=>1]);
			}
			
			$uid=Db::name('address')->insert($address,false,true);
			
			if($uid){
				storage_user_action(UID,session('user_auth.username'),config('BACKEND_USER'),'添加了会员的收货地址');
				return ['success'=>'添加成功','action'=>'add'];
			}else{
				return ['error'=>'添加失败'];
			}
			
		}
 	}
 	
 	
 	public function editAddress()
 	{
 		if(request()->isPost()){
 			$date=input('post.');
			$address['name']=$date['name'];
			$address['telephone']=$date['telephone'];
			$address['address']=$date['address'];
			$address['city_id']=$date['city'];
			if($date['country']=='change'){
				$date['country'] = 0;
			}
			$address['country_id']=$date['country'];
			$address['province_id']=$date['province'];
			$address['default']=$date['default'];
			if($address['default']==2){
				Db::name('address')->where(['uid'=>$date['uid'],'default'=>2])->update(['default'=>1]);
			}
			if(Db::name('address')->where('address_id',$date['address_id'])->update($address)){
				
				storage_user_action(UID,session('user_auth.username'),config('BACKEND_USER'),'修改了会员的收货地址');
				return ['success'=>'修改成功','action'=>'edit'];
			}else{
				return ['error'=>'修改失败'];
			}
		}
		$data = Db::name('address')->where('address_id',input('param.id'))->find();	
		
		$province = Db::name('area')->where('area_deep',1)->select();
		$city = Db::name('area')->where('area_deep',2)->select();
		$country = Db::name('area')->where('area_deep',3)->select();
		
		$this->assign('crumbs','会员资料');
		$this->assign([
			'province'=>$province,
			'city'=>$city,
			'country'=>$country,
			'json_city'=>json_encode($city),
			'json_country'=>json_encode($country),
			'data'=>$data
		]);
	 	return $this->fetch('address');
 	}
 	
 	
 	public function remove()
 	{
 		$res = Db::name('address')->where('address_id',input('param.id'))->delete();
 		if($res){
 			storage_user_action(UID,session('user_auth.username'),config('BACKEND_USER'),'删除了会员收货地址');	
			$this->redirect('MemberBackend/edit');
 		}else{
			$this->redirect('MemberBackend/edit');
 		}
 	}
 	
 	public function setWallet()
 	{
 		if(request()->isPost()){
 			$date=input('post.');
 			$wallet['principal'] = $date['principal'];
 			$wallet['interest'] = $date['interest'];
 			
 			if(Db::name('wallet')->where('uid',$date['uid'])->update($wallet)){
 				storage_user_action(UID,session('user_auth.username'),config('BACKEND_USER'),'修改了会员的钱包资产');
				return ['success'=>'修改成功','action'=>'edit'];
 			}else{
 				return ['error'=>'修改失败'];
 			}
 		}
 	}
}
?>