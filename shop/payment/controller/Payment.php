<?php
/**
 * #shop#
 *
 * ==========================================================================
 * @link      #shop#
 * @copyright Copyright (c) 2020 *. 
 * @shop    
 * ==========================================================================
 *
 * @author    ##
 *
 * 电脑版本
 */
 
namespace app\payment\controller;
use app\common\controller\Base;
use think\Db;
class Payment extends Base{

	
	function pay_api(){
		if(request()->isPost()){
		
			$type=session('payment_method');
			
			$class = '\\app\\payment\\controller\\' . ucwords($type);
				
			$payment= new $class();
			
			storage_user_action(member('uid'),member('username'),config('FRONTEND_USER'),'下了订单，未支付');	
			
			$url=$payment->process();
			
			return $url;
		
		}
	}
	
	function choice_payment_type(){
		
		$map['order_id']=['eq',(int)input('param.order_id')];
		$map['uid']=['eq',member('uid')];
		
		if(!$order=Db::name('order')->where($map)->find()){
			$this->error('订单不存在！！');
		}
		
		session('re_pay_order_id',$order['order_id']);
		
		$this->assign('list',osc_service('payment','service')->get_available_payment_list());
		
		return $this->fetch('payment_list'); 
	}
	function re_pay(){
		if(request()->isPost()){
		
			$type=input('param.type');
			
			$class = '\\app\\payment\\controller\\' . ucwords($type);
				
			$payment= new $class();
			
			$return=$payment->re_pay((int)session('re_pay_order_id'));
			
			storage_user_action(member('uid'),member('username'),config('FRONTEND_USER'),'点击了去支付');
			
			return ['type'=>$return['type'],'pay_url'=>$return['pay_url']];
		
		}
	}
}
