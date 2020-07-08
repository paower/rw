<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:41:"./themes/default/index/order\details.html";i:1562745087;}*/ ?>
﻿<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<meta name="viewport" id="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no"/>
<link href="/public/static/css/reset.css" rel="stylesheet" type="text/css">
<link href="/public/static/css/indent-details.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="near-box">
    <a href="javascript:;" onclick="history.go(-1)" class="jd-qrdd-topbox">订单详情</a>
    <div class="jd-qrdd-bigbox">
        <!--商品地址管理部分-->
        <div class="indent-details-box">
        	<?php if($order['order_status_id'] == 1): ?>
	            <span class="indent-details-img1"></span>
	            <span class="indent-details-text1">待发货</span>
	            <span class="indent-details-text2">平台正在准备货物中，请耐心等待！</span>
	            <span class="indent-details-text3"><?php echo date("Y-m-d H:i:s",$order['creation_time']); ?></span>
            <?php elseif($order['order_status_id'] == 4): ?>
            	<span class="indent-details-img1"></span>
	            <span class="indent-details-text1">待收货</span>
	            <span class="indent-details-text2">货物已发往用户地址，请注意查收！</span>
	            <span class="indent-details-text3"><?php echo date("Y-m-d H:i:s",$order['creation_time']); ?></span>
	        <?php elseif($order['order_status_id'] == 5): ?>
            	<span class="indent-details-img1"></span>
	            <span class="indent-details-text1">已取消</span>
	            <span class="indent-details-text2">已取消该订单，退款已返回用户余额！</span>
	            <span class="indent-details-text3"><?php echo date("Y-m-d H:i:s",$order['creation_time']); ?></span>
	        <?php elseif($order['order_status_id'] == 6): ?>
            	<span class="indent-details-img1"></span>
	            <span class="indent-details-text1">已完成</span>
	            <span class="indent-details-text2">已完成订单，感谢购买本平台产品，欢迎下次光临！</span>
	            <span class="indent-details-text3"><?php echo date("Y-m-d H:i:s",$order['creation_time']); ?></span>
	        <?php elseif($order['order_status_id'] == 7): ?>
            	<span class="indent-details-img1"></span>
	            <span class="indent-details-text1">待取消</span>
	            <span class="indent-details-text2">平台正在处理中，请耐心等待！</span>
	            <span class="indent-details-text3"><?php echo date("Y-m-d H:i:s",$order['creation_time']); ?></span>
	        <?php endif; ?>
        </div>
        <!--地址部分-->
        <div class="jd-qrdd-a1">
        	<span class="qrdd-a1-t1"><?php echo $order['name2']; ?></span>
        	<span class="qrdd-a1-t1"><?php echo $order['telephone']; ?></span>
        	<?php if($order['def'] == 2): ?>
        		<span class="qrdd-a1-t2">默认</span>
        	<?php endif; ?>
        	<div class="qrdd-a1-b1">
        		<span class="qrdd-a1-img1"></span>
        		<span class="qrdd-a1-t3"><?php echo get_area_name($order['province_id']); ?> <?php echo get_area_name($order['city_id']); ?> <?php echo get_area_name($order['country_id']); ?> <?php echo $order['address']; ?></span>
        	</div>
        	<span class="qrdd-a1-img2"></span>
        </div>
        <!--商品部分-->
        <div class="zjzz-buylist-goods1">
            <div class="zjzz-buylist-gtime">
                <span class="zjzz-buylist-gtime1"><i class="indent-details-img2"></i>平台自营店</span>
                <span class="zjzz-buylist-gtime2">联系客服</span>
            </div>
            <?php if(is_array($order['goods_list']) || $order['goods_list'] instanceof \think\Collection || $order['goods_list'] instanceof \think\Paginator): $index = 0; $__LIST__ = $order['goods_list'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($index % 2 );++$index;?>
	            <div class="zjzz-buylist-det">
	                <img src="/public/uploads/<?php echo $item['image']; ?>"/>
	                <div class="zjzz-buylist-gdetail">
	                	<div>
		                    <span class="zjzz-buylist-gtit1"><?php echo $item['name']; ?></span>
		                    <span class="zjzz-buylist-gmoney">
		                        <i class="zjzz-buylist-gm1">￥<?php echo $item['price']; ?></i>
		                        <i class="zjzz-buylist-gm2">x<?php echo $item['num']; ?></i>
		                    </span>
	                    </div>
	                    <p class="zjzz-buylist-gm2">
	                    	<?php if(is_array($item['attribute_value']) || $item['attribute_value'] instanceof \think\Collection || $item['attribute_value'] instanceof \think\Paginator): $index2 = 0; $__LIST__ = $item['attribute_value'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item2): $mod = ($index2 % 2 );++$index2;?>
	                    		<?php echo $item2['name']; ?>：<?php echo $item2['value_name']; endforeach; endif; else: echo "" ;endif; ?>
	                    </p>
	                </div>
	            </div>
	        <?php endforeach; endif; else: echo "" ;endif; ?>
            <div class="zjzz-buylist-btn">
                <a class="zjzz-buylist-btn3">申请售后</a>
            </div>
        </div>
        <!--商品金额部分-->
        <div class="indent-details-box2">
            <span class="indent-details-text4">总额</span>
            <span class="indent-details-text5">￥<?php echo number_format($order['price'] + $order['freight'],2); ?></span>
        </div>
        <div class="indent-details-box2">
            <span class="indent-details-text4 tcolor-grey">商品总价</span>
            <span class="indent-details-text5 tcolor-black">￥<?php echo number_format($order['price'],2); ?></span>
        </div>
        <div class="indent-details-box2">
            <span class="indent-details-text4 tcolor-grey">运费</span>
            <span class="indent-details-text5 tcolor-black">￥<?php echo number_format($order['freight'],2); ?></span>
        </div>
        <!--<div class="indent-details-box2">
            <span class="indent-details-text4 tcolor-grey">税费</span>
            <span class="indent-details-text5 tcolor-black">￥0.00</span>
        </div>
        <div class="indent-details-box2">
            <span class="indent-details-text4 tcolor-grey">发票信息</span>
            <span class="indent-details-text5 tcolor-black">不需要发票</span>
        </div>-->
        <!--订单编号部分-->
        <div class="indent-details-box3">
            <p>订单编号:<?php echo $order['order_num_alias']; ?></p>
            <!--<p>支付方式:支付宝</p>
            <p>支付交易单号:201711024866544846144</p>-->
            <p>下单时间:<?php echo date("Y-m-d H:i:s",$order['creation_time']); ?></p>
        </div>
    </div>
</div>
</body>

</html>