<?php
namespace app\admin\controller;
use app\common\controller\AdminBase;
use think\Db;
class Coupon extends AdminBase{
	
	protected function _initialize(){
		parent::_initialize();
		$this->assign('breadcrumb1','商品');
		$this->assign('breadcrumb2','优惠券管理');
	}
	
	public function index(){     	
		$param=input('param.');
		
		$query=[];
		
		if(isset($param['coupon_name'])){		
			$map['c.coupon_name']=['like',"%".$param['coupon_name']."%"];
			$query['c.coupon_name']=urlencode($param['coupon_name']);
		}else{
			$map['c.coupon_id']=['gt',0];
		}
		
		$list=[];
		
		$list=Db::name('coupon')->alias('c')->where($map)->order('c.coupon_id desc')->paginate(config('page_num'),false,$query);		
		
		$this->assign('list',$list);
				
		$this->assign('empty','<tr><td colspan="20">没有数据~</td></tr>');
		
		return $this->fetch();
	}
	
	public function add(){
		
		if(request()->isPost()){
			$date=input('post.');
			$coupon['conpon_prefix'] = $date['conpon_prefix'];
			$coupon['coupon_name'] = $date['coupon_name'];
			$coupon['coupon_type'] = $date['coupon_type'];
			$coupon['coupon_limit'] = $date['coupon_limit'];
			$coupon['coupon_value'] = $date['coupon_value'];
			$coupon['coupon_num'] = $date['coupon_num'];
			$coupon['coupon_surplus_num'] = $date['coupon_num'];
			$coupon['describe'] = $date['describe'];
			$coupon['term'] = $date['term'];
			$coupon['generate_time'] = time();
			$coupon['expire_time'] = $date['term'] * 86400 + time();
			$cid=Db::name('coupon')->insert($coupon,false,true);
			if($cid){
				storage_user_action(UID,session('user_auth.username'),config('BACKEND_USER'),'新增了优惠券');
				return ['success'=>'新增成功','action'=>'add'];
			}else{
				return ['error'=>'新增失败'];
			}
		}
		$this->assign('crumbs','新增');
		return $this->fetch();
	}
	
	public function edit(){
		if(request()->isPost()){
			$date=input('post.');		
			$coupon['conpon_prefix'] = $date['conpon_prefix'];
			$coupon['coupon_name'] = $date['coupon_name'];
			$coupon['coupon_type'] = $date['coupon_type'];
			$coupon['coupon_limit'] = $date['coupon_limit'];
			$coupon['coupon_value'] = $date['coupon_value'];
			$coupon['describe'] = $date['describe'];
			$coupon['term'] = $date['term'];
			$coupon['expire_time'] = $date['term'] * 86400 + $date['generate_time'];
			if(Db::name('coupon')->where('coupon_id',$date['coupon_id'])->update($coupon)){
				storage_user_action(UID,session('user_auth.username'),config('BACKEND_USER'),'编辑了优惠券');
				return ['success'=>'修改成功','action'=>'edit'];
			}else{
				return ['error'=>'修改失败'];
			}
		}
		$coupon = Db::name('coupon')->where('coupon_id',input('param.id'))->find();
		$this->assign([
			'coupon' => $coupon,
			'crumbs' => '优惠券资料'
		]);
		return $this->fetch('info');
	}
	
	function del(){
		$r = Db::name('coupon')->where('coupon_id',input('param.id'))->delete();
		if($r){
			storage_user_action(UID,session('user_auth.username'),config('BACKEND_USER'),'删除优惠券'.input('param.id'));
			$this->redirect('Coupon/index');
		}else{
			return $this->error('删除失败！',url('Coupon/index'));
		}		
		
	}
}