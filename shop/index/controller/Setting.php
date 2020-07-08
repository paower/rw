<?php
namespace app\index\controller;
use app\common\controller\HomeBase;
use think\Session;
use think\Db;

class Setting extends HomeBase
{
	public function index()
	{
		
	}
	//修改个人资料
	public function setPersonal()
	{
		if(!Session::has('user_id')){
			$this->redirect('Login/login');
		}
		
		return $this->fetch();
	}
	
	//	修改手機號
	public function setPhone()
	{
		if(!Session::has('user_id')){
			$this->redirect('Login/login');
		}
		
		if(request()->isPost()){
			$old_phone = input('post.old_phone');
			$new_phone = input('post.new_phone');
			$captcha = input('post.captcha');
			if(!captcha_check($captcha)){
				return ['error'=>false,'text'=>'验证码不正确'];
			};
			$user_phone = Db::name('user')->where('user_id',Session::get('user_id'))->value('user_phone');
			if($old_phone != $user_phone){
				return ['error'=>false,'text'=>'当前手机号码不正确'];
			}
			$user = Db::name('user')->where('user_phone',$new_phone)->find();
			if(empty($user)){
				if(Db::name('user')->where('user_id',Session::get('user_id'))->update(['user_phone'=>$new_phone])){
					return ['success'=>true,'text'=>'修改成功'];
					//$this->redirect('Login/logout');
				};
			}else{
				return ['error'=>false,'text'=>'该手机号已被注册'];
			}
		}
		
		return $this->fetch();
	}
	
	//登录密码
	public function setLogin()
	{
		if(!Session::has('user_id')){
			$this->redirect('Login/login');
		}
		if(request()->isPost()){
			$old_password = md5(input('post.old_password'));
			$new_password = md5(input('post.new_password'));
			$new_password2 = md5(input('post.new_password2'));
			if($new_password != $new_password2){
				return ['error'=>false,'text'=>'两次密码不一致'];
			}
			$password = Db::name('user')->where('user_id',Session::get('user_id'))->value('password');
			if($password == $old_password){
				if(Db::name('user')->where('user_id',Session::get('user_id'))->update(['password'=>$new_password])){
					return ['success'=>true,'text'=>'修改成功'];
					//$this->redirect('Login/logout');
				}
			}else{
				return ['error'=>false,'text'=>'旧密码不正确'];
			}
		}
		
		return $this->fetch();
	}
	
	//安全密码
	public function setSecurity()
	{
		if(!Session::has('user_id')){
			$this->redirect('Login/login');
		}
		
		if(request()->isPost()){
			$new_password = md5(input('post.new_password'));
			$new_password2 = md5(input('post.new_password2'));
			if($new_password != $new_password2){
				return ['error'=>false,'text'=>'两次密码不一致'];
			}
			$password = Db::name('user')->where('user_id',Session::get('user_id'))->value('pay_password');
			if(!empty($password)){
				$old_password = md5(input('post.old_password'));
				if($password == $old_password){
					if(Db::name('user')->where('user_id',Session::get('user_id'))->update(['pay_password'=>$new_password])){
						return ['success'=>true,'text'=>'修改成功'];
					}
				}else{
					return ['error'=>false,'text'=>'旧密码不正确'];
				}
			}else{
				if(Db::name('user')->where('user_id',Session::get('user_id'))->update(['pay_password'=>$new_password])){
					return ['success'=>true,'text'=>'设置成功'];
				}
				
			}
			
		}
		$password = Db::name('user')->where('user_id',Session::get('user_id'))->value('pay_password');
		if(!empty($password)){
			$boolean = true;
		}else{
			$boolean = false;
		}
		$this->assign('boolean',$boolean);
		return $this->fetch();
	}
	
	//收款账号
	public function bankcard()
	{
		if(!Session::has('user_id')){
			$this->redirect('Login/login');
		}
		$user_bank = Db::name('user_bank')->where('uid',Session::get('user_id'))->select();
		$this->assign([
			'user_bank'=>$user_bank
		]);
		
		if(request()->isPost()){
			$data = input('post.');
			$bankdata = [
				'bank_name'=>$data['bank_name'],
				'bank_name2'=>$data['bank_name2'],
				'bank_num'=>$data['bank_num'],
				'bank_user'=>$data['bank_user'],
				'default'=>$data['Default'],
				'uid'=>Session::get('user_id')
			];
			
			if($data['Default'] == 1){
				Db::name('user_bank')->where('uid',Session::get('user_id'))->update(['default'=>0]);
			}
			if(Db::name('user_bank')->insert($bankdata)){
				return ['success'=>true,'text'=>'添加成功'];
			}
		}
		
		return $this->fetch();
	}
}
?>