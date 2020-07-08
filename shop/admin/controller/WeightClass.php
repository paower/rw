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
class WeightClass extends AdminBase{
	
	protected function _initialize(){
		parent::_initialize();
		$this->assign('breadcrumb1','商品');
		$this->assign('breadcrumb2','重量单位');
	}
	
    public function index(){     	
		
		$list = Db::name('weight_class')->paginate(config('page_num'));
		$this->assign('empty', '<tr><td colspan="20">~~暂无数据</td></tr>');
		$this->assign('list', $list);
	
		return $this->fetch();

	 }
	 public	function add(){
		if(request()->isPost()){	
			return $this->single_table_insert('WeightClass','添加了重量单位');
		}
		$this->assign('crumbs', '新增');
		$this->assign('action', url('WeightClass/add'));
		return $this->fetch('edit');
	}
	 public	function edit(){
		if(request()->isPost()){	
			return $this->single_table_update('WeightClass','修改了重量单位');
		}
		$this->assign('crumbs', '修改');
		$this->assign('action', url('WeightClass/edit'));		
		$this->assign('d',Db::name('WeightClass')->find(input('id')));		
		return $this->fetch('edit');
	}
	public	function del(){
		if(request()->isGet()){	
			$r= $this->single_table_delete('WeightClass','删除了重量单位');
			if($r){
				$this->redirect('WeightClass/index');
			}
		}
	}
	 
}
?>