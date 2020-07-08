<?php
namespace app\member\controller;
use app\common\controller\AdminBase;
use think\Db;
class Finance extends AdminBase{
    public function index(){  
    	$query = [];
    	$param=input('param.');
    	if(isset($param['uid'])){
			$map['uid'] = ['eq',$param['uid']];	
			$query['uid'] = urlencode($param['uid']);
		}
		if(isset($param['state'])){
			$map['state']=['eq',$param['state']];	
			$query['state']=urlencode($param['state']);
		}
		if(isset($param['type'])){
			$map['type'] = ['eq',$param['type']];	
			$query['type'] = urlencode($param['type']);
		}else{
			$map['type'] = 1;
		}
		$map['finance_id'] = ['gt',0];
		$rechargelist = Db::name('finance')->where($map)->order('finance_id desc')->paginate(20,false,['query'=>$query]);
    	
    	$map['type'] = 2;
    	$withdrawallist = Db::name('finance')->where($map)->order('finance_id desc')->paginate(20,false,['query'=>$query]);
    	//dump($rechargelist);die;
    	   	
		$this->assign([
			'rechargelist' =>$rechargelist,
			'withdrawallist'=>$withdrawallist,
			'empty'=>'<tr><td colspan="20">没有数据~</td></tr>',
		]);
		
    	return $this->fetch();
	}
	 
 	public function show(){
     	$finance_id = input('param.id');
     	
     	$finance = Db::name('finance')
     	->alias('fc')
     	->join('user u','u.user_id = fc.uid')
     	->join('user_bank ub','ub.user_bank_id = fc.user_bank_id')
     	->where('fc.finance_id',$finance_id)
     	->find();
     	//dump($finance);die;
     	
     	$this->assign('finance',$finance);
		$this->assign('crumbs','详情');
		$this->assign('breadcrumb2','充值提现');
				
    	return $this->fetch();
	}
	
	
	public function setState(){
		$finance_id = input('param.id');
		if(input('param.type') == 1){
			$type = '充值';
		}else if(input('param.type') == 2){
			$type = '提现';
		}
		$finance = Db::name('finance')->where('finance_id',$finance_id)->find();
		if(Db::name('finance')->where('finance_id',$finance_id)->update(['state'=>2])){
			Db::name('finance')->where('finance_id',$finance_id)->update(['complete_time'=>time()]);
			if(input('param.type') == 1){
				Db::name('wallet')->where('uid',$finance['uid'])->setInc('principal',$finance['price']);
			}else if(input('param.type') == 2){
				Db::name('wallet')->where('uid',$finance['uid'])->setDec('principal',$finance['price']);
			}
			storage_user_action(UID,session('user_auth.username'),config('BACKEND_USER'),'审核了会员'.$type.'id为'.$finance_id.'的订单');	
			$this->error('审核成功','Finance/index');
		}else{
			$this->error('审核失败');
		};
	}
	
	public function refuse(){
		$finance_id = input('param.id');
		if(input('param.type') == 1){
			$type = '充值';
		}else if(input('param.type') == 2){
			$type = '提现';
		}
		$finance = Db::name('finance')->where('finance_id',$finance_id)->find();
		if(Db::name('finance')->where('finance_id',$finance_id)->update(['state'=>3])){
			if(input('param.type') == 2){
				Db::name('wallet')->where('uid',$finance['uid'])->setInc('principal',$finance['price']);
			}
			storage_user_action(UID,session('user_auth.username'),config('BACKEND_USER'),'拒绝了会员'.$type.'id为'.$finance_id.'的订单');	
			$this->error('拒绝成功','Finance/index');
		}else{
			$this->error('拒绝失败');
		};
	}
}
?>