<?php
namespace app\admin\controller;
use app\common\controller\AdminBase;
use think\Db;
class Settings extends AdminBase{
	
	protected function _initialize(){
		parent::_initialize();
		$this->assign('breadcrumb1','系统');
				
	}

	
	function general(){			
		$this->assign('breadcrumb2','基本配置');
		$this->assign('common',$this->get_config_by_module('common'));
		return $this->fetch();
	}
	
	function get_config_by_module($module){
		
		$list=Db::name('config')->where('module',$module)->select();
		if(isset($list)){
			foreach ($list as $k => $v) {
				$config[$v['name']]=$v;
			}
		}
		return $config;
	}
	
	function save(){
		
		if(request()->isPost()){
			
			$config=input('post.');			
			
			if($config && is_array($config)){
				$c=Db::name('Config');    
	            foreach ($config as $name => $value) {
	                $map = array('name' => $name);
					$c->where($map)->setField('value', $value);					
	            }
				
	        }
	        clear_cache();
			storage_user_action(UID,session('user_auth.username'),config('BACKEND_USER'),'更新系统基本配置');	
	      return ['success'=>'更新成功'];
		  
		}
	}
	
	function other(){
		
		$this->assign('length',Db::name('length_class')->select());
		$this->assign('weight',Db::name('weight_class')->select());		
		$this->assign('order_status',Db::name('order_status')->select());		
		$this->assign('member_auth_group',Db::name('member_auth_group')->field('id,title')->select());		
		$this->assign('breadcrumb2','其他配置');
		$this->assign('bank_name',Db::name('config')->where('name','bank_name')->value('value'));
		$this->assign('bank_name2',Db::name('config')->where('name','bank_name2')->value('value'));
		$this->assign('bank_user',Db::name('config')->where('name','bank_user')->value('value'));
		$this->assign('bank_num',Db::name('config')->where('name','bank_num')->value('value'));
		$this->assign('return_day',Db::name('config')->where('name','return_day')->value('value'));
		return $this->fetch();
	}
	
	public function frontend()
	{
		$frontend_images = Db::name('frontend_images')->order('frontend_images_weight asc')->select();
		$this->assign([
			'frontend_images' => $frontend_images,
			'breadcrumb2' => '前台配置',
		]);
		return $this->fetch();
	}
	
	function ajax_eidt(){
		if(request()->isPost()){
			
			$data=input('post.');
			
			$table_name=$data['table'];
			
			if(isset($data[$table_name][$data['key']])){
				$info=$data[$table_name][$data['key']];
			}	
			
			if(isset($data['id'])&&$data['id']!=''){
				//更新
				$info[$data['pk_id']]=(int)$data['id'];				
								
				$r=Db::name($table_name)->update($info,false,true);
				if($r){
					storage_user_action(UID,session('user_auth.username'),config('BACKEND_USER'),'更新了前台轮播图'.$data['id']);	
					return ['success'=>'更新成功'];
				}else{
					return ['error'=>'更新失败'];
				}
			}else{
				//新增
				$r=Db::name($table_name)->insert($info,false,true);
				if($r){
					storage_user_action(UID,session('user_auth.username'),config('BACKEND_USER'),'添加了前台轮播图');
					return ['success'=>'添加成功','id'=>$r];
				}else{
					return ['error'=>'添加失败'];
				}
			}
		}
	}
	 function ajax_del(){
		if(request()->isPost()){
			$data=input('post.');		
			
			if(empty($data['id'])){
				return ['success'=>'删除成功'];
			}
			
			$r=Db::name($data['table'])->delete($data['id']);
			
			if($r){
				return ['success'=>'删除成功'];
			}else{
				return ['error'=>'删除失败'];
			}
		}
	}
}
?>