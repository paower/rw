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
namespace app\admin\controller;
use app\common\controller\AdminBase;
use think\Db;
class UserAction extends AdminBase{
	
	protected function _initialize(){
		parent::_initialize();
		$this->assign('breadcrumb1','系统');
		$this->assign('breadcrumb2','用户行为');
	}
	
    public function index()
    {
    	
    	$list = Db::name('user_action')->order('ua_id desc')->paginate(config('page_num'));
		$this->assign('empty', '<tr><td colspan="20">~~暂无数据</td></tr>');
		$this->assign('list',$list);
		    
		return $this->fetch();   
    }

	
}
