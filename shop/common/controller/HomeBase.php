<?php
namespace app\common\controller;
use think\Db;
class HomeBase extends Base{	
	
	protected function _initialize() {
		parent::_initialize();		
		
//		if(request()->isMobile()&&('mobile'!=request()->module())){
//			header('Location:'.request()->domain().'/mobile/');
//			die();
//		}
		
		$this->assign('top_nav',osc_goods()->get_goods_category());   
		
	}



	
}
