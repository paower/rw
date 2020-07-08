<?php
namespace app\index\controller;
use app\common\controller\Base;
use app\index\model\Login as Log;
use think\Db;
use think\Session;
class Login extends Base{
	
	//登录
	public function login(){
		if(request()->isPost()){
			$Log=new Log();
			$user_phone = trim(input('post.user_phone'));
			$user_pass = trim(input('post.user_pass'));
			$captcha = input('post.captcha');
			if(!captcha_check($captcha)){
				return ['success'=>false,'text'=>'验证码不正确'];
			};	
			if(!empty($user_phone)&&!empty($user_pass)){
				$status = Db::name('user')->where('user_phone',$user_phone)->value('status');
				if($status == 2){
					return ['success'=>false,'text'=>'该账户已被冻结'];
				}else if(empty($status)){
					return ['success'=>false,'text'=>'该账户不存在'];
				}
				$map=[
					'user_phone'=>$user_phone,
					'password'=>md5($user_pass)
				];
				if($Log->verify($map)){
					
						$this->setReward();
						// $this->redirect('index/pcenter');
						return ['success'=>true,'text'=>'登录成功'];
				}else{
					return ['success'=>false,'text'=>'密码错误'];
				}
			}else{
				return ['success'=>false,'text'=>'请输入正确的账号或密码'];
			}
		}
		return $this->fetch();	
	}
	//更新积分
	public function setReward()
	{
		$reward = Db::name('reward')->where(['uid'=>Session::get('user_id'),'status'=>1])->select();
		$return_day = Db::name('config')->where('name','return_day')->value('value');
		
		$nowTime = time();
		foreach($reward as $key => $value){
			$disparityStr = $nowTime - $value['generate_time'];
			$disparityDay = intval($disparityStr / 86400);
			if($disparityDay >= $return_day){
				if(Db::name('wallet')->where('uid',$value['uid'])->setInc('principal',$value['interest'])){
					Db::name('wallet')->where('uid',$value['uid'])->setDec('interest',$value['interest']);
					$finance = [
						'state' => 2,
						'complete_time' => $nowTime
					];
					Db::name('finance')->where(['reward_id'=>$value['reward_id'],'state'=>1])->update($finance);
					Db::name('reward')->where('reward_id',$value['reward_id'])->delete();
				};
			}
		}
	}
	
	//注册
	public function register(){
		if(request()->isPost()){
			$Log=new Log();
			$user_phone = trim(input('post.user_phone'));
			$user_pass = trim(input('post.user_pass'));
			$user_pass2 = trim(input('post.user_pass2'));
			$invitation_phone = trim(input('post.invitation'));
			$captcha = input('post.captcha');
			if(!captcha_check($captcha)){
				return ['success'=>false,'text'=>'验证码不正确'];
			};
			if(empty($invitation_phone) || $invitation_phone == 0){
				$invitation_id = 0;
			}else{
				$invitation_id = Db::name('user')->where('user_phone',$invitation_phone)->value('user_id');
				if(empty($invitation_id)){
					return ['success'=>false,'text'=>'邀请人账户不存在'];
				}
			}
			if($user_pass == $user_pass2){
				if(!empty($user_phone)&&!empty($user_pass)){
					$map=[
						'user_phone'=>$user_phone
					];
					if($Log->m_one($map)){
						return ['success'=>false,'text'=>'该手机号码已被注册'];
					}else{
						$data=[
							'user_phone'=>$user_phone,
							'password'=>md5($user_pass),
							'user_retime'=>time(),
							'invitation_id'=>$invitation_id
						];
						
						$user_id = Db::name('user')->insertGetId($data);
						$wallet = [
							'uid'=>$user_id,
							'principal'=>0,
							'interest'=>0
						];
						if(Db::name('wallet')->insert($wallet)){
							$Log->verify(['user_id'=>$user_id]);
							return ['success'=>true,'text'=>'注册成功'];
							//$this->redirect('index/pcenter');
						}else{
							return ['success'=>false,'text'=>'注册失败'];
						}
					}
				}
			}else{
				return ['success'=>false,'text'=>'两次密码不一致'];
			}
		}
		$user_id = input('param.id');
		if(isset($user_id)){
			$invitation_phone = Db::name('user')->where('user_id',$user_id)->value('user_phone');
		}else{
			$invitation_phone = 0;
		}
		
		$this->assign([
			'invitation_phone' => $invitation_phone
		]);
		return $this->fetch();
	}
	
	//找回
	public function retrieve()
	{
		if(request()->isPost()){
			$Log=new Log();
			$user_phone = trim(input('post.user_phone'));
			$user_pass = trim(input('post.user_pass'));
			$user_pass2 = trim(input('post.user_pass2'));
			$captcha = input('post.captcha');
			if(!captcha_check($captcha)){
				return ['success'=>false,'text'=>'验证码不正确'];
			};
			if($user_pass == $user_pass2){
				if(!empty($user_phone)&&!empty($user_pass)){
					$map=[
						'user_phone'=>$user_phone
					];
					$user = $Log->m_one($map);
					if(!empty($user)){
						$where=[
							'user_phone'=>$user_phone,
						];
						$data=[
							'password'=>md5($user_pass),
						];
						if($Log->m_edit($where,$data)){
							return ['success'=>true,'text'=>'找回成功'];
							//$this->redirect('login/login');
						}else{
							return ['success'=>false,'text'=>'找回失败'];
						}
					}else{
						return ['success'=>false,'text'=>'该账号不存在'];
					}
					
				}
			}else{
				return ['success'=>false,'text'=>'两次密码不一致'];
			}
		}
		return $this->fetch();
	}
	
	//退出
	public function logout(){
		Session::delete("user_phone");
		Session::delete("user_id");
		$this->redirect('Login/login');
	}
	
}
