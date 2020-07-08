<?php
namespace app\indexhaoran\model;
use think\Model;
use think\Db;
use app\indexhaoran\model\Login;

class Register extends Login
{
	protected $table="frontuser";
	
	/**
	 * [m_add 添加用户数据]
	 * @param  [array] $data [添加的数据]
	 * @return [int]       [添加成功的条数]
	 */
	public function m_add($data){
		Db::name($this->table)->insert($data);
		
		$res=$this->verify($data);
		return $res;
	}
	
	/**
	 * [m_one 查询单条数据]
	 * @param  [array] $map [条件]
	 * @return [array]      [查询的数据]
	 */
	public function m_one($map){
		$res=Db::name($this->table)->where($map)->find();
		return $res;
	}
}
