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
namespace app\admin\validate;
use think\Validate;
class Category extends Validate
{
    protected $rule = [
        'name'  =>  'require|min:2|unique:category',
       
    ];

    protected $message = [
        'name.require'  =>  '分类名必填',
        'name.min'  =>  '分类名不能小于两个字',     
        'name.unique'  =>  '分类名已存在', 
       
    ];

	
}
?>