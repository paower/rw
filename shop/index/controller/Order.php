<?php
namespace app\index\controller;
use app\common\controller\HomeBase;
use think\Session;
use think\Db;
class Order extends HomeBase
{
    public function index()
    { 
    	return $this->fetch();
    }   
    
	//  生成订单
    public function orders()
    {
    	if(!Session::has('user_id')){
			$this->redirect('Login/login');
		}
		$data = input('param.');
		$goods_id = $data['id'];
		$num = $data['num'];
		$attribute = $data['attribute'];

		$goods = Db::name('goods')->where('goods_id',$goods_id)->find();
		$attribute_value = Db::name('attribute_value')->where('attribute_value_id','in',$attribute)->select();
		
		$freight = 0;
		
		$goods_discount = Db::name('goods_discount')->where('goods_id',$goods_id)->find();
		if(empty($goods_discount)){
			$goods_discount = false;
			$goodzprice = $goods['price'] * $num;
		}else{
			$goodzprice = $goods_discount['price'] * $num;
		}
		$zprice = $freight + $goodzprice;
		$address = Db::name('address')->where(['uid'=>Session::get('user_id'),'default'=>2])->find();
		
		$couponlist = Db::name('user_coupon')
		->alias('uc')
		->join('coupon c','c.coupon_id = uc.coupon_id')
		->where(['uc.uid'=>Session::get('user_id'),'uc.state'=>1])
		->select();
		
		$this->assign([
			'goods'=>$goods,
			'num'=>$num,
			'attribute_value'=>$attribute_value,
			'goods_discount'=>$goods_discount,
			'goodzprice'=>$goodzprice,
			'freight'=>$freight,
			'zprice'=>$zprice,
			'address'=>$address,
			'couponlist'=>$couponlist
		]);
    	return $this->fetch();
    }
    
    //生成订单2
    public function ordersTwo()
    {
    	$cart_id = input('param.id');
    	$num = explode(',',chop(input('param.num'),','));
    	$c_id = explode(',',chop($cart_id,','));
    	if(count($num) == count($c_id)){
    		$id_len = count($c_id);
    		for($i = 0; $i < $id_len; $i++){
    			Db::name('cart')->where('cart_id',$c_id[$i])->update(['num'=>$num[$i]]);
    		}
    	}else{
    		echo "<script>
    			alert('商品对应数量出错！！');
    		</script>";die;
    	}
    	$goods = Db::name('cart')
		->alias('ca')
		->join('goods g','g.goods_id = ca.goods_id')
		->where('ca.cart_id','in',$cart_id)
		->select();
		//dump($goods);die;
		$goodzprice = 0;
		$freight = 0;
		foreach($goods as $key => $value){
			$goods_discount = Db::name('goods_discount')->where('goods_id',$value['goods_id'])->find();
			if(!empty($goods_discount)){
				$goods[$key]['price'] = $goods_discount['price'];
			}
			
			$goodzprice += $value['num'] * $goods[$key]['price'];
			
			$attribute_value_arr = explode(',',chop($value['attribute_value_id'],','));
			$len = count($attribute_value_arr);
			$attribute_value = [];
			for($i = 0; $i < $len; $i++){
				$attribute_value[$i] = Db::name('attribute_value')->where('attribute_value_id',$attribute_value_arr[$i])->find();
			}
			$goods[$key]['attribute_value'] = $attribute_value;
		}
		
    	$zprice = $goodzprice + $freight;
    	
    	$address = Db::name('address')->where(['uid'=>Session::get('user_id'),'default'=>2])->find();
    	$this->assign([
			'address'=>$address,
			'goods'=>$goods,
			'goodzprice'=>$goodzprice,
			'freight'=>$freight,
			'zprice'=>$zprice,
			'cart_id'=>$cart_id,
		]);
    	return $this->fetch('orders2');
    }
    
    // 订单提交
    public function subOrder()
    {
    	if(request()->isPost()){
			$date=input('post.');
			if(isset($date['cart_id'])){
				$isDel = true;
				$cart_id = explode(',',chop($date['cart_id'],','));
			}else{
				$isDel = false;
			}
			$orderdata = $date['orderdata'];
			//dump($orderdata);die;
			$return_points = 0;
			if(is_int($date['goods_id'])){
				$goods = Db::name('goods')->where('goods_id',$date['goods_id'])->find();
				$return_points = $goods['points'] * $orderdata[0][1];
			}else{
				$goods_id = chop($date['goods_id'],',');
				$goods_id = explode(',',$goods_id);
				$id_len = count($goods_id);
				for($i = 0; $i < $id_len; $i++){
					$goods = Db::name('goods')->where('goods_id',$goods_id[$i])->find();
					$return_points += $goods['points'] * $orderdata[$i][1];
				}
			}
			//dump($return_points);die;
			$address = Db::name('address')->where('address_id',$date['address_id'])->find();
			$user = Db::name('user')->where('user_id',Session::get('user_id'))->find();
			
			$order = [
				'order_num_alias'=>time().rand(10000,99999),
				'uid'=>Session::get('user_id'),
				'return_points'=>$return_points,
				'name'=>$user['user_name'],
				'tel'=>$user['user_phone'],
				'shipping_name'=>$address['name'],
				'address_id'=>$date['address_id'],
				'shipping_tel'=>$address['telephone'],
				'shipping_city_id'=>$address['city_id'],
				'shipping_country_id'=>$address['country_id'],
				'shipping_province_id'=>$address['province_id'],
				'order_status_id'=>3,
				'creation_time'=>time(),
				'price'=>$date['goodzprice'],
				'freight'=>$date['freight']
			]; 
			$order_id = Db::name('order')->insertGetId($order);
			$booleanNum = 0;
			foreach($orderdata as $key => $value){
				if($value[0] == $orderdata[$key][0]){
					$order_goods = [
						'order_id'=>$order_id,
						'goods_id'=>$value[0],
						'num'=>$orderdata[$key][1],
						'attribute_value_id'=>$orderdata[$key][2],
					];
					if(Db::name('order_goods')->insert($order_goods) != 1){
						$booleanNum++;
						Db::name('order')->where('order_id',$order_id)->delete();
						Db::name('order_goods')->where('order_id',$order_id)->delete();
					};
				}else{
					$booleanNum++;
					Db::name('order')->where('order_id',$order_id)->delete();
				}
				
			}
			if($booleanNum == 0){
				//删除购物车
				if($isDel){
					Db::name('cart')->where('cart_id','in',$cart_id)->delete();
				}	
				return ['success'=>true,'data'=>$order_id];
			}else{
				return ['success'=>false];
			}
		}
    }
    
    //订单详情
    public function details()
    {
    	if(!Session::has('user_id')){
			$this->redirect('Login/login');
		}
		$order_id = input('param.id');
		$order = Db::name('order')
		->alias('o')
		->join('address ar','ar.address_id = o.address_id')
		->field('o.*,ar.name as name2,ar.telephone,ar.address,ar.city_id,ar.country_id,ar.province_id,ar.default as def')
		->where('o.order_id',$order_id)
		->find();
		$order['goods_list'] = Db::name('order_goods')
		->alias('og')
		->join('goods g','g.goods_id = og.goods_id')
		->where('og.order_id',$order_id)
		->select();
		foreach($order['goods_list'] as $key => $value){
			$goods_discount = Db::name('goods_discount')->where('goods_id',$value['goods_id'])->find();
     		if(!empty($goods_discount)){
     			$order['goods_list'][$key]['price'] = $goods_discount['price'];
     		}
     		$order['goods_list'][$key]['attribute_value'] = Db::name('attribute_value')->where('attribute_value_id','in',$value['attribute_value_id'])->select();
		}
		
		//dump($order);die;
		$this->assign([
			'order'=>$order,
		]);
    	return $this->fetch();
    }
    
    //订单列表
    public function orderlist()
    {
    	if(!Session::has('user_id')){
			$this->redirect('Login/login');
		}
		$all_list = Db::name('order')
		->alias('o')
		->join('order_status os','os.order_status_id = o.order_status_id')
		->field('os.name as name2,o.*')
		->where('o.uid',Session::get('user_id'))
		->order('o.creation_time desc')
		->select();
		foreach($all_list as $key => $value){
			$all_list[$key]['count'] = Db::name('order_goods')->where('order_id',$value['order_id'])->sum('num');
			$all_list[$key]['goods_list'] = Db::name('order_goods')
			->alias('og')
			->join('goods g','g.goods_id = og.goods_id')
			->where('order_id',$value['order_id'])
			->select();
			
			foreach($all_list[$key]['goods_list'] as $key1 => $value1){
				$goods_discount = Db::name('goods_discount')->where('goods_id',$value1['goods_id'])->find();
	     		if(!empty($goods_discount)){
	     			$all_list[$key]['goods_list'][$key1]['price'] = $goods_discount['price'];
	     		}
			}
		}
		//dump($all_list);die;
		$dfk_list = Db::name('order')->where(['uid' => Session::get('user_id'),'order_status_id'=>3])->order('creation_time desc')->select();
		foreach($dfk_list as $key => $value){
			$dfk_list[$key]['count'] = Db::name('order_goods')->where('order_id',$value['order_id'])->sum('num');
			$dfk_list[$key]['goods_list'] = Db::name('order_goods')
			->alias('og')
			->join('goods g','g.goods_id = og.goods_id')
			->where('order_id',$value['order_id'])
			->select();
			
			foreach($dfk_list[$key]['goods_list'] as $key1 => $value1){
				$goods_discount = Db::name('goods_discount')->where('goods_id',$value1['goods_id'])->find();
	     		if(!empty($goods_discount)){
	     			$dfk_list[$key]['goods_list'][$key1]['price'] = $goods_discount['price'];
	     		}
			}
		}
		
		$dfh_list = Db::name('order')->where(['uid' => Session::get('user_id'),'order_status_id'=>1])->order('creation_time desc')->select();
		foreach($dfh_list as $key => $value){
			$dfh_list[$key]['count'] = Db::name('order_goods')->where('order_id',$value['order_id'])->sum('num');
			$dfh_list[$key]['goods_list'] = Db::name('order_goods')
			->alias('og')
			->join('goods g','g.goods_id = og.goods_id')
			->where('order_id',$value['order_id'])
			->select();
			
			foreach($dfh_list[$key]['goods_list'] as $key1 => $value1){
				$goods_discount = Db::name('goods_discount')->where('goods_id',$value1['goods_id'])->find();
	     		if(!empty($goods_discount)){
	     			$dfh_list[$key]['goods_list'][$key1]['price'] = $goods_discount['price'];
	     		}
			}
		}
		
		$dsh_list = Db::name('order')->where(['uid' => Session::get('user_id'),'order_status_id'=>4])->order('creation_time desc')->select();
		foreach($dsh_list as $key => $value){
			$dsh_list[$key]['count'] = Db::name('order_goods')->where('order_id',$value['order_id'])->sum('num');
			$dsh_list[$key]['goods_list'] = Db::name('order_goods')
			->alias('og')
			->join('goods g','g.goods_id = og.goods_id')
			->where('order_id',$value['order_id'])
			->select();
			
			foreach($dsh_list[$key]['goods_list'] as $key1 => $value1){
				$goods_discount = Db::name('goods_discount')->where('goods_id',$value1['goods_id'])->find();
	     		if(!empty($goods_discount)){
	     			$dsh_list[$key]['goods_list'][$key1]['price'] = $goods_discount['price'];
	     		}
			}
		}
		
		$dpj_list = Db::name('evaluate')
		->alias('e')
		->join('order o','o.order_id = e.order_id')
		->join('goods g','g.goods_id = e.goods_id')
		->where(['e.uid' => Session::get('user_id'),'e.pj_state'=>1])
		->order('e.generate_time desc')
		->select();
		$dpj_count = Db::name("evaluate")->where(['uid' => Session::get('user_id'),'pj_state'=>1])->count();
		
		$ypj_list = Db::name('evaluate')
		->alias('e')
		->join('order o','o.order_id = e.order_id')
		->join('goods g','g.goods_id = e.goods_id')
		->where(['e.uid' => Session::get('user_id'),'e.pj_state'=>2])
		->order('e.generate_time desc')
		->select();
		
		$this->assign([
			'all_list' => $all_list,
			'dfk_list' => $dfk_list,
			'dfh_list' => $dfh_list,
			'dsh_list' => $dsh_list,
			'dpj_list' => $dpj_list,
			'ypj_list' => $ypj_list,
			'dpj_count' => $dpj_count
		]);
    	return $this->fetch();
    }
    
    //查看物流
    public function tracking()
    {
    	if(!Session::has('user_id')){
			$this->redirect('Login/login');
		}
    	return $this->fetch();
    }
    
    //退款
    public function refund()
    {
    	if(!Session::has('user_id')){
			$this->redirect('Login/login');
		}
		$order_id = input('param.id');
		$order = Db::name('order')->where('order_id',$order_id)->find();
		$order['goods_list'] = Db::name('order_goods')
		->alias('og')
		->join('goods g','g.goods_id = og.goods_id')
		->where('og.order_id',$order_id)
		->select();
		foreach($order['goods_list'] as $key => $value){
			$goods_discount = Db::name('goods_discount')->where('goods_id',$value['goods_id'])->find();
     		if(!empty($goods_discount)){
     			$order['goods_list'][$key]['price'] = $goods_discount['price'];
     		}
     		$order['goods_list'][$key]['attribute_value'] = Db::name('attribute_value')->where('attribute_value_id','in',$value['attribute_value_id'])->select();
		}
		//dump($order);die;
		$this->assign([
			'order'=>$order,
		]);
		
		if(request()->isPost()){
			$order_id = input('post.order_id');
			$refund_content = input('post.refund_content');
			$refund_image = $this->request->file('refund_image');
	        $info = $refund_image->validate(['ext'=>'jpg,png,gif'])->move(ROOT_PATH . 'public' . DS . 'uploads'. DS . 'user');
	        if($info){
	            $filePath = 'user/'.$info->getSaveName();   
	    		$data = [
	    			'refund_content'=>$refund_content,
	    			'refund_image'=>$filePath,
	    			'order_status_id'=>7
	    		];
	    		if(Db::name('order')->where('order_id',$order_id)->update($data)){
	    			return ['success'=>true,'text'=>'提交成功，请耐心等待平台审核'];
	    		}else{
	    			return ['error'=>false,'text'=>'提交失败'];
	    		}
	        }else{
	            return ['error'=>false,'text'=>'图片上传出错'];
	        }
		}
		
		
    	return $this->fetch();
    }
    
    //确认收货
    public function confirm()
    {
    	if(!Session::has('user_id')){
			$this->redirect('Login/login');
		}
		if(request()->isPost()){
			$order_id = input('post.order_id');
			if(Db::name('order')->where('order_id',$order_id)->update(['order_status_id'=>6])){
				$goods = Db::name('order_goods')->where('order_id',$order_id)->select();
				foreach($goods as $key => $value){
					$evaluate = [
						'order_id'=>$order_id,
						'goods_id'=>$value['goods_id'],
						'uid'=>Session::get('user_id'),
						'pj_state'=>1,
						'generate_time'=>time()
					];
					Db::name('evaluate')->insert($evaluate);
				}
				Db::name('reward')->where('order_id',$order_id)->update(['status'=>1]);
				
				return ['success'=>true,'text'=>'确认成功'];
			}else{
				return ['error'=>false,'text'=>'确认失败'];
			}
		}
    }
    
    //评价
    public function pj()
    {
    	if(!Session::has('user_id')){
			$this->redirect('Login/login');
		}
		$evaluate_id = input('param.id');
		$evaluate = Db::name('evaluate')
		->alias('ev')
		->join('goods g','g.goods_id = ev.goods_id')
		->where('evaluate_id',$evaluate_id)
		->find();
		$this->assign([
			'evaluate'=>$evaluate,
		]);
		
		if(request()->isPost()){
			$evaluate_id = input('post.evaluate_id');
			$content = input('post.content');
			$is_anonymous = input('post.is_anonymous');
			$rate = input('post.rate');
			$pj_image = $this->request->file('pj_image');
	        $info = $pj_image->validate(['ext'=>'jpg,png,gif'])->move(ROOT_PATH . 'public' . DS . 'uploads'. DS . 'user');
	        if($info){
	            $filePath = 'user/'.$info->getSaveName();   
	    		$data = [
	    			'is_anonymous'=>$is_anonymous,
	    			'content'=>$content,
	    			'pj_image'=>$filePath,
	    			'pj_state'=>2,
	    			'rate'=>$rate,
	    			'pj_time'=>time(),
	    		];
	    		if(Db::name('evaluate')->where(array('uid'=>Session::get('user_id'),'evaluate_id'=>$evaluate_id))->update($data)){
	    			return ['success'=>true,'text'=>'评价成功'];
	    		}else{
	    			return ['error'=>false,'text'=>'评价失败'];
	    		}
	        }else{
	            return ['error'=>false,'text'=>'图片上传出错'];
	        }
		}
    	return $this->fetch();
    }
    
	//查看评价
	public function evaluation()
    {
    	if(!Session::has('user_id')){
			$this->redirect('Login/login');
		}
		$evaluate_id = input('param.id');
		$evaluate = Db::name('evaluate')
		->alias('ev')
		->join('goods g','g.goods_id = ev.goods_id')
		->where('evaluate_id',$evaluate_id)
		->find();
		$this->assign([
			'evaluate'=>$evaluate,
		]);
    	return $this->fetch();
    }
} 
?>