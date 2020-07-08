<?php
namespace app\index\model;
use think\Model;
use think\Db;
use think\Session;

class Index extends Model{
	
	
	//查询单条数据
	public function m_one($table,$map){
		$res=Db::name($table)->where($map)->find();
		return $res;
	}
}


?>