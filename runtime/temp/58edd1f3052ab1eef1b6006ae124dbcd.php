<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:40:"./themes/default/index/user\setting.html";i:1563006861;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<meta name="viewport" id="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no"/>
<link href="/public/static/css/reset.css" rel="stylesheet" type="text/css">
<link href="/public/static/css/shoping-cart.css" rel="stylesheet" type="text/css">
</head>
<body style="background: #F5F5F4;">
<div class="near-box">
	<div class="header">
		<a href="javascript:;" onclick="history.go(-1)" class="left"></a>
		设置中心
	</div>
	<div class="shop-cart-bigbox">
		<!-- <a href="<?php echo url('setting/setPersonal'); ?>"><div class="cart-title">修改个人资料 <i>修改</i></div></a> -->
		<a href="<?php echo url('setting/setPhone'); ?>"><div class="cart-title">修改手机号 <i>修改</i></div></a>
		<a href="<?php echo url('setting/setLogin'); ?>"><div class="cart-title">登录密码 <i>修改</i></div></a>
		<a href="<?php echo url('setting/setSecurity'); ?>"><div class="cart-title">安全密码<i>设置/修改</i></div></a>
		<a href="<?php echo url('setting/bankcard'); ?>"><div class="cart-title">收款账号<i>绑定/修改</i></div></a>
	</div>
</div>
<input type="hidden" id="ids" value="">
</body>
</html>