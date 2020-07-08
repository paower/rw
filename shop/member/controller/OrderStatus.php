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
namespace app\member\controller;
use app\common\controller\AdminBase;
use think\Db;
class OrderStatus extends AdminBase{
	
	protected function _initialize(){
		parent::_initialize();
		$this->assign('breadcrumb1','会员');
		$this->assign('breadcrumb2','订单状态');
	}
	
    public function index(){     	
		
		$list = Db::name('order_status')->paginate(config('page_num'));
		$this->assign('empty', '<tr><td colspan="20">~~暂无数据</td></tr>');
		$this->assign('list', $list);
	
		return $this->fetch();

	 }
	 public	function add(){
		if(request()->isPost()){	
			return $this->single_table_insert('OrderStatus','添加了订单状态');
		}
		$this->assign('crumbs', '新增');
		$this->assign('action', url('OrderStatus/add'));
		return $this->fetch('edit');
	}
	 public	function edit(){
		if(request()->isPost()){	
			return $this->single_table_update('OrderStatus','修改了订单状态');
		}
		$this->assign('crumbs', '修改');
		$this->assign('action', url('OrderStatus/edit'));		
		$this->assign('d',Db::name('OrderStatus')->find(input('id')));		
		return $this->fetch('edit');
	}
	public	function del(){
		if(request()->isGet()){	
			$r= $this->single_table_delete('OrderStatus','删除了订单状态');
			if($r){
				$this->redirect('OrderStatus/index');
			}
		}
	}
	 
}
?>