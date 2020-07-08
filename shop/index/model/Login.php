<?php
namespace app\index\model;
use think\Model;
use think\Db;
use think\Session;

class Login extends Model{
	protected $table="user";
	
	/**
	 * [verify 登录验证，成功则存入session]
	 * @param  [array] $map [条件]
	 */
	public function verify($map){
		$res=Db::name($this->table)->where($map)->find();
		if($res){
			Session::set('user_phone',$res['user_phone']);
			Session::set('user_id',$res['user_id']);
			return true;
		}
		return false;
	}
	
	/**
	 * [m_add 添加用户数据]
	 * @param  [array] $data [添加的数据]
	 */
	public function m_add($data){
		Db::name($this->table)->insert($data);
		
		$res=$this->verify($data);
		return $res;
	}
	
	/**
	 * [m_one 查询单条数据]
	 * @param  [array] $map [条件]
	 */
	public function m_one($map){
		$res=Db::name($this->table)->where($map)->find();
		return $res;
	}
	
	/**
	 * [m_one 修改数据]
	 * @param  [array] $where [条件]
	 * @param  [array] $data [修改的数据]
	 */
	public function m_edit($where,$data){
		$res=Db::name($this->table)->where($where)->update($data);
		return $res;
	}
}