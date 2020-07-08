<?php
namespace app\index\controller;
use app\common\controller\HomeBase;
use app\index\model\Index as Idx;
use think\Session;
use think\Db;

class Index extends HomeBase
{
	//	首页
    public function index()
    {
		$brand = $this->random(3,'brand','brand_id');
		
		$guesslike =  $this->random(3,'goods','goods_id');
		foreach($guesslike as $key => $value){
			$guesslike[$key]['price2'] = Db::name('goods_discount')->where('goods_id',$value['goods_id'])->value('price');
		}
		
		$newlist = Db::name('goods')->where(['status'=>1])->order('date_added desc')->limit(3)->select();
		foreach($newlist as $key => $value){
			$newlist[$key]['price2'] = Db::name('goods_discount')->where('goods_id',$value['goods_id'])->value('price');
		}
		
		$popular = Db::name('goods')->where(['status'=>1,'popular'=>1])->order('date_added desc')->limit(3)->select();
		foreach($popular as $key => $value){
			$popular[$key]['price2'] = Db::name('goods_discount')->where('goods_id',$value['goods_id'])->value('price');
		}
		
		$frontend_images = Db::name('frontend_images')->order('frontend_images_weight asc')->select();
		$this->assign([
			'brand' => $brand,
			'guesslike' => $guesslike,
			'newlist' => $newlist,
			'popular' => $popular,
			'frontend_images' => $frontend_images
		]);
		
		return $this->fetch();
    }
	
	//id随机
	public function random($num,$table,$id)
	{
		$countcus = Db::name($table)->count();
		$max = Db::name($table)->max($id);
		$min = Db::name($table)->min($id);
		if($countcus < $num){
			$num = $countcus;
		}
		$i = 1;
		$flag = 0;
		$ary = array();
		while($i <= $num){
			$rundnum = rand($min, $max);
			if($flag != $rundnum){
				//过滤重复 
				if(!in_array($rundnum,$ary)){
					$ary[] = $rundnum;
					$flag = $rundnum;
				}else{
					$i--;
				}
				$i++;
			}
		}
		return Db::name($table)->where($id,'in',$ary,'or')->select();
	}
	
	
	public function brandlist()
	{
		$brand_id = input('param.id');
		$brandlist = Db::name('goods_brand')
		->alias('gb')
		->join('goods g','g.goods_id = gb.goods_id')
		->where('gb.brand_id',$brand_id)
		->order('g.date_added desc')
		->select();
		foreach($brandlist as $key => $value){
			$brandlist[$key]['price2'] = Db::name('goods_discount')->where('goods_id',$value['goods_id'])->value('price');
		}
		
		$brand = Db::name('brand')->where('brand_id',$brand_id)->find();
		//dump($brandlist);die;
		$this->assign([
			'brandlist' => $brandlist,
			'brand' => $brand
		]);
		return $this->fetch();
	}
    
	//  分类
    public function classify()
    {
    	
    	$categoryParent = Db::name('category')->where('pid',0)->order('sort_order asc')->select();
    	$categorySub = [];
    	foreach($categoryParent as $key => $value){
	 		$categorySub[$value['id']]=Db::name('category')->where('pid',$value['id'])->select();
    	}	
    	$goodsList = Db::name('goods_to_category')
    	->alias('gc')
    	->join('category c','c.id = gc.category_id')
    	->join('goods gs','gs.goods_id = gc.goods_id')
    	->where('c.pid',0)
    	->select();
    	$this->assign([
    		'categoryParent'=>$categoryParent,
    		'categorySub'=>$categorySub,
    		'goodsList'=>$goodsList,
    	]);
    	return $this->fetch();
    }
    
	//  购物车
	public function shpcart()
	{
		if(!Session::has('user_id')){
			$this->redirect('Login/login');
		}
		$cart = Db::name('cart')
		->alias('ca')
		->join('goods g','g.goods_id = ca.goods_id')
		->where('ca.uid',Session::get('user_id'))
		->select();
		foreach($cart as $key => $value){
			$goods_discount = Db::name('goods_discount')->where('goods_id',$value['goods_id'])->find();
			if(!empty($goods_discount)){
				$cart[$key]['price'] = $goods_discount['price'];
			}
			
			$attribute_value_arr = explode(',',chop($value['attribute_value_id'],','));
			$len = count($attribute_value_arr);
			$attribute_value = [];
			for($i = 0; $i < $len; $i++){
				$attribute_value[$i] = Db::name('attribute_value')->where('attribute_value_id',$attribute_value_arr[$i])->find();
			}
			$cart[$key]['attribute_value'] = $attribute_value;
		}
		
		//dump($cart);die;
		$this->assign([
			'cart'=>$cart,
		]);
		return $this->fetch();
	}
	
	//购物车删除
	public function cartDel()
	{
		$map['uid'] = Session::get('user_id');
		$map['cart_id'] = ['in',input('param.cart_id')];
		if(Db::name('cart')->where($map)->delete()){
			return ['success'=>true,'text'=>'删除成功'];
		}else{
			return ['error'=>false,'text'=>'删除失败'];
		}
	}
	
	//	我的
	public function pcenter()
	{
		$idx = new Idx();
		if(!Session::has('user_id')){
			$user_name = '未登录';
			$user_phone = ''; 
			$user_photo = '/public/static/images/touxiang.png';
		}else{
			$user_id=Session::get('user_id');
			$res=$idx->m_one('user',['user_id'=>$user_id]);
			$user_name = $res['user_name'];
			$user_phone = $res['user_phone'];
			$user_photo = $res['user_photo']!=''? '/public/uploads/'.$res['user_photo'] : '/public/static/images/touxiang.png';
		}
		
		
		$this->assign([
			'user_name'=>$user_name,
			'user_phone'=>$user_phone,
			'user_photo'=>$user_photo
		]);
		return $this->fetch();
	}
	
	//	搜索
	public function search()
	{
		return $this->fetch();
	}
	
	//热门
	public function popular()
	{
		$popular = Db::name('goods')->where(['status'=>1,'popular'=>1])->order('date_added desc')->select();
		foreach($popular as $key => $value){
			$popular[$key]['price2'] = Db::name('goods_discount')->where('goods_id',$value['goods_id'])->value('price');
		}
		
		$this->assign([
			'popular'=>$popular
		]);
		
		return $this->fetch();
	}
	
	//最新
	public function newest()
	{
		$newlist = Db::name('goods')->where(['status'=>1])->order('date_added desc')->select();
		foreach($newlist as $key => $value){
			$newlist[$key]['price2'] = Db::name('goods_discount')->where('goods_id',$value['goods_id'])->value('price');
		}
		$this->assign([
			'newlist'=>$newlist
		]);
		return $this->fetch();
	}
	
	//优惠券
	public function coupon()
	{
		if(request()->isPost()){
			if(!Session::has('user_id')){
				$this->redirect('Login/login');
			}
			$coupon_id = input('post.coupon_id');
			$coupon = Db::name('coupon')->where('coupon_id',$coupon_id)->find();
			if($coupon['coupon_surplus_num'] == 0){
				return ['success'=>false,'text'=>'已经领完了'];
			}
			if($coupon['expire_time'] <= time()){
				return ['success'=>false,'text'=>'该优惠券已过期'];
			}
			$user_coupon = Db::name('user_coupon')->where(['uid'=>Session::get('user_id'),'coupon_id'=>$coupon_id])->find();
			if(!empty($user_coupon)){
				return ['success'=>false,'text'=>'已领取过该优惠券'];
			}
			$user_coupon_data = [
				'uid' => Session::get('user_id'),
				'coupon_id' => $coupon_id,
				'coupon_number' => $coupon['conpon_prefix'] . rand(100000,999999),
				'state' => 1
			];
			if(Db::name('user_coupon')->insert($user_coupon_data)){
				Db::name('coupon')->where('coupon_id',$coupon_id)->setDec('coupon_surplus_num',1);
				return ['success'=>true,'text'=>'领取成功'];
			}else{
				return ['success'=>false,'text'=>'领取失败'];
			}
		}
		$map = [
			'expire_time'=>['gt',time()],
			'coupon_surplus_num'=>['gt',0]
		];
		$coupon = Db::name('coupon')->where($map)->select();
		$this->assign([
			'coupon' => $coupon
		]);
		return $this->fetch();
	}
}
