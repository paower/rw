<?php
namespace app\index\controller;
use app\common\controller\HomeBase;
use think\Session;
use think\Db;
class Goods extends HomeBase
{
    public function index()
    {    		
		
		if(!$list=osc_goods()->get_goods_info((int)input('param.id'))){
			$this->error('商品不存在！！');
		}
		
		$this->assign('SEO',['title'=>$list['goods']['name'].'-'.config('SITE_TITLE'),
		'keywords'=>$list['goods']['meta_keyword'],
		'description'=>$list['goods']['meta_description']]);
		
		osc_goods()->update_goods_viewed((int)input('param.id'));
		
		$this->assign('goods',$list['goods']);
		$this->assign('image',$list['image']);
		$this->assign('options',$list['options']);
		$this->assign('discount',$list['discount']);
		$this->assign('mobile_description',$list['mobile_description']);
		
		return $this->fetch();
   
    }
    
	//  商品详情
	public function details()
	{
		if(!Session::has('user_id')){
			$this->redirect('Login/login');
		}
		if(input('param.id') ==	''){
			$this->redirect('Index/classify');
		}
		$goods_id = input('param.id');
		$goods = Db::name('goods')->where('goods_id',$goods_id)->find();
		$goods_image = Db::name('goods_image')->where('goods_id',$goods_id)->order('sort_order asc')->select();
		$goods_discount = Db::name('goods_discount')->where('goods_id',$goods_id)->find();
		if(empty($goods_discount)){
			$goods_discount = false;
		}
		
		$map=[];
		$goods_attribute = Db::name('goods_attribute')->where('goods_id',$goods_id)->select();
		foreach($goods_attribute as $key => $value){
			$attribute_value = Db::name('attribute_value')->where('attribute_value_id',$value['attribute_value_id'])->find();
			array_push($map,$attribute_value['attribute_id']);
		}
		$map = array_unique($map);
		$map = array_values($map);
		$attribute = Db::name('attribute')->where('attribute_id','in',implode(',',$map))->select();
		foreach($attribute as $key => $value){
			$attribute[$key]['attribute_value'] = Db::name('attribute_value')->where('attribute_id',$value['attribute_id'])->select();
		}
//		dump($attribute);die;
		$goods_description = Db::name('goods_description')->where('goods_id',$goods_id)->find();
		
		$goods_brand = Db::name('goods_brand')
		->alias('gb')
		->join('brand b','b.brand_id = gb.brand_id')
		->where('gb.goods_id',$goods_id)
		->find();
		

		$this->assign([
			'goods'=>$goods,
			'goods_image'=>$goods_image,
			'goods_discount'=>$goods_discount,
			'attribute'=>$attribute,
			'goods_description'=>$goods_description,
			'goods_brand'=>$goods_brand,
		]);
		return $this->fetch();
	}
	
	//加入购物车
	public function addCart()
	{
		$param=input('post.');
		
		if($goods=Db::name('goods')->find((int)$param['goods_id'])){			
			if((int)$param['num']<$goods['minimum']){
   				return ['success'=>false,'text'=>'最小起订量是'.$goods['minimum'],'minimum'=>$goods['minimum']];
   			} 			
		}else{
			return ['success'=>false,'text'=>'商品不存在'];
		}
		
		$cart['uid']=Session::get('user_id');
		$cart['goods_id']=(int)$param['goods_id'];
		$cart['num']=(int)$param['num'];
		$cart['create_time']=time();
		$cart['attribute_value_id']=$param['attribute_value_id'];
	
		//判断是否有同一个商品
		if(Db::name('cart')->where(array('uid'=>$cart['uid'],'goods_id'=>$cart['goods_id'],'attribute_value_id'=>$cart['attribute_value_id']))->find()){
			Db::name('cart')->where(array('uid'=>$cart['uid'],'goods_id'=>$cart['goods_id'],'attribute_value_id'=>$cart['attribute_value_id']))->setInc('num',$cart['num']);
			$cartnum = Db::name('cart')->where('uid',$param['goods_id'])->count();
			return ['success'=>true,'text'=>'加入成功','cartnum'=>1];
		}else{
			if($cart_id=Db::name('cart')->insert($cart,false,true)){
				$cartnum = Db::name('cart')->where('uid',$param['goods_id'])->count();
				return ['success'=>true,'text'=>'加入成功','cartnum'=>2];
			}else{
				return ['success'=>false,'text'=>'加入失败'];
			}
		}
	}
}
