<?php
namespace app\index\controller;
use app\common\controller\HomeBase;
use think\Session;
use think\Db;
class Pay extends HomeBase
{
    public function pay_success()
    {    	
		return $this->fetch();
    }
    
    //支付订单
    public function payment()
    {
    	if(!Session::has('user_id')){
			$this->redirect('Login/login');
		}
		
		$order = Db::name('order')->where('order_id',input('param.id'))->find();
		$this->assign([
			'order'=>$order,
		]);
		
    	return $this->fetch();
    }
    
    //确认支付
    public function pay()
    {
    	if(!Session::has('user_id')){
			$this->redirect('Login/login');
		}
		if(request()->isPost()){
			$pay_password = md5(input('post.pay_password'));
			$user = Db::name('user')->where('user_id',Session::get('user_id'))->find();
			if($user['pay_password'] == ''){
				return ['error'=>false,'text'=>'您还没有设置安全密码，请设置'];
			}
			if($pay_password != $user['pay_password']){
				return ['error'=>false,'text'=>'密码错误'];
			}
			$order_id = input('post.order_id');
			$order = Db::name('order')->where('order_id',$order_id)->find();
			$wallet = Db::name('wallet')->where('uid',Session::get('user_id'))->find();
			if($wallet['principal'] < $order['price'] + $order['freight']){
				return ['error'=>false,'text'=>'余额不足，请充值'];
			}
			if(Db::name('order')->where('order_id',$order_id)->update(['order_status_id'=>1])){
				Db::name('wallet')->where('uid',Session::get('user_id'))->setDec('principal',$order['price']+$order['freight']);
				Db::name('wallet')->where('uid',Session::get('user_id'))->setInc('interest',$order['return_points']);
				$reward = [
					'uid'=>Session::get('user_id'),
					'interest'=>$order['return_points'],
					'generate_time'=>time(),
					'status'=>2,
					'order_id'=>$order_id,
				];
				$reward_id = Db::name('reward')->insertGetId($reward);
				$finance = [
					'uid'=>Session::get('user_id'),
					'type'=>3,
					'price'=>$order['price']+$order['freight'],
					'creation_time'=>time(),
					'state'=>2,
					'complete_time'=>time(),
				];
				Db::name('finance')->insert($finance);
				$finance2 = [
					'uid' => Session::get('user_id'),
					'type' => 5,
					'price' => $order['return_points'],
					'creation_time' => time(),
					'state' => 1,
					'reward_id' => $reward_id
				];
				Db::name('finance')->insert($finance2);
				
				return ['success'=>true,'text'=>'支付成功'];
			}
		}
    }
	
	//支付成功
	public function payOk()
	{
		if(!Session::has('user_id')){
			$this->redirect('Login/login');
		}
		$order = Db::name('order')->where('order_id',input('param.id'))->find();
		$this->assign([
			'order'=>$order
		]);
		return $this->fetch();
	}
}
