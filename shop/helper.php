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
 * 
 */
use \app\common\service\Goods;
use \app\common\service\System;
use \app\common\service\Transport;
use \app\common\service\Order;
use \oscshop\Hashids;
use think\exception\ClassNotFoundException;
use \oscshop\Weight;

if (!function_exists('osc_goods')) {
    /**
     * 商品相关数据助手函数
     */
    function osc_goods()
    {
        return Goods::getInstance();
    }
}

if (!function_exists('osc_system')) {
    /**
     * 系统相关数据助手函数
     */
    function osc_system()
    {
        return System::getInstance();
    }
}
if (!function_exists('osc_model')) {
    /**
     * osc模型实例化助手函数
	 * 
     */
    function osc_model($module_name,$controller_name)
    {
    	$class = '\\app\\'.$module_name.'\\model\\' . ucwords($controller_name);	
        
		if (class_exists($class)) {
               return new $class();
        } else {
                throw new ClassNotFoundException('class not exists:' . $class, $class);
        }
    }
}
if (!function_exists('osc_service')) {
    /**
     * osc service助手函数
	 * 
     */
    function osc_service($module_name,$service_name)
    {
    	$class = '\\app\\'.$module_name.'\\service\\' . ucwords($service_name);	
        
		if (class_exists($class)) {
               return new $class();
        } else {
                throw new ClassNotFoundException('class not exists:' . $class, $class);
        }
    }
}
if (!function_exists('osc_cart')) {
    /**
     * osc购物车助手函数
	 * 
     */
    function osc_cart()
    {    	
        return new \oscshop\Cart();        
    }
}
if (!function_exists('osc_weight')) {
    /**
     * osc重量相关助手函数
	 * 
     */
    function osc_weight()
    {    	
        return Weight::getInstance();       
    }
}
if (!function_exists('osc_transport')) {
    /**
     * osc运费相关助手函数
	 * 
     */
    function osc_transport()
    {    	
        return Transport::getInstance();       
    }
}
if (!function_exists('osc_order')) {
    /**
     * osc订单相关助手函数
	 * 
     */
    function osc_order()
    {    	
        return new Order();       
    }
}
if (!function_exists('hashids')) {
    /**
     * 数字id加密
     */
    function hashids()
    {
    	return new Hashids(config('PWD_KEY'),10);
    }
}
?>