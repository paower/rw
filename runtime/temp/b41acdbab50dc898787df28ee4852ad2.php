<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:38:"./themes/default/index/pay\pay_ok.html";i:1562895755;}*/ ?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<title>订单状态</title>
	<link rel="stylesheet" href="/public/static/css/payment.css" type="text/css"/>
	<script type="text/javascript" src="/public/static/js/jquery-1.8.3.min.js" ></script>
</head>
	
<body>
<!--头部  star-->
<header style="color:#fff">
	<a href="payment.html">
		<div class="_left"><img src="/public/static/picture/left.png"></div><span>订单状态</span></a>
</header>
<!--头部 end-->
<div class="payokconter">
    <div class="paysuccess">
    	<li><img src="/public/static/images/payok.png" /></li>
        <li><strong>支付成功</strong></li>
    </div>  
</div>
<!--内容 star-->
<div class="payokconter">
    <div class="paysuccess01">
    	<li><span>订单总额</span></li>
        <li><strong>¥<?php echo number_format($order['price'] + $order['freight'],2); ?></strong></li>
        <li>订单号:<?php echo $order['order_num_alias']; ?></li>
    </div>  
</div>

    
<div class="payokbottom">
	<div class="payokbottom01">
    	<a href="<?php echo url('Index/index'); ?>" class="payokindex">返回首页</a>
		<a href="<?php echo url('Order/details',['id'=>$order['order_id']]); ?>">查看订单</a>
    </div>
</div> 
<!--内容 end-->
</body>
</html>