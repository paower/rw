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
 * 后台新增会员
 */
 
namespace app\member\validate;
use think\Validate;
class Member extends Validate
{
    protected $rule = [
        'username'  =>  'require|min:2|unique:member',
        'password'=>'require|min:6',
        'email'  =>  'unique:member',
        'telephone'  =>  'unique:member',
    ];

    protected $message = [
        'username.require'  =>  '用户名必填',
        'username.min'  =>  '用户名不能小于两个字',     
        'username.unique'  =>  '用户名已经存在',
        
		'password.require'  =>  '密码必填',
		'password.min'  =>  '密码不能小于6位',  	
			
		'email.unique'  =>  '邮箱已经存在',
		'telephone.unique'  =>  '手机号码已经存在',
    ];
	
	protected $scene = [
        'edit'  =>  ['password','email','telephone'],
    ];
	
}
?>