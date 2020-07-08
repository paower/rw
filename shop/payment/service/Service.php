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
 */
namespace app\payment\service;
use think\Db;
//支付模块数据获取
class Service{
	
	//取得所有支付分组列表
	public function get_payment_code_list($param=array()){
	 	
		$sql='select DISTINCT extend_value as code, extend_value as name,status from '.config('database.prefix')."config where use_for='payment'";
		
		if(isset($param['enabled'])){
			$sql.=" and status=".$param['enabled'];
		}
		
		$payment_code=Db::query($sql);
		
		foreach ($payment_code as $k => $v) {
			switch ($v['name']) {
				case 'alipay':
					$payment_code[$k]['name']='支付宝';
				break;
				
				case 'weixin':
					$payment_code[$k]['name']='微信支付';
				break;
			}
		}
		
		return $payment_code;		
	}
	//取得激活的支付分组列表
	public function get_available_payment_list(){	 	
		$param['enabled']=1;
		return $this->get_payment_code_list($param);		
	}

 
	
}
?>