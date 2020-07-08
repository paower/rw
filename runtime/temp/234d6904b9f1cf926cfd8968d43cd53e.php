<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:41:"./themes/default/index/index\pcenter.html";i:1589342683;}*/ ?>
﻿<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<meta name="viewport" id="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no"/>
<link href="/public/static/css/reset.css" rel="stylesheet" type="text/css">
<link href="/public/static/css/personal-center.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/public/static/js/jquery-1.8.3.min.js"></script>
<script src="/public/static/js/layer/layer.js"></script>
</head>
</head>
<body>
<div class="near-box">
	<!--头部开始-->
	  <div class="personal-index-top">
	  	 <a href="<?php echo url('user/setting'); ?>" class="personal-top-right">
	  	 	<img src="/public/static/images/setup.png" alt="">
	  	 </a>
	  </div>
	  <!--头部结束-->
      <div class="index-bigbox" style="margin-top: 0px;">
          <!--头部中间开始-->
          <div class="personal-top">
			 <div class="personal-top-box1" <?php if($user_name =='未登录'): ?>id="tologin"<?php endif; ?>>
          	 	<span class="personal-top-img1"><a href="#" title="修改头像" <?php if($user_name !='未登录'): ?> id="logox"<?php endif; ?>><img src="<?php echo $user_photo; ?>" alt=""></a></span>
          	 	<div class="personal-top-box2">
          	 		<span class="personal-top-text1"><?php echo $user_name!=''?$user_name:$user_phone; ?></span>
          	 	</div>
          	 </div>
          </div>
          <!--头部中间结束-->
          <!--代付款分类开始-->
          <div class="personal-box1 mbt-05">
          	   <a href="<?php echo url('order/orderlist'); ?>?type=1" class="personal-box2 box3">
          	      <span class="personal-box1-img1"><img src="/public/static/picture/personal-center-img1.png" alt=""></span>
          	      <span class="personal-box1-text1">待付款</span>
          	   </a>
          	   <a href="<?php echo url('order/orderlist'); ?>?type=2" class="personal-box2 box3">
          	      <span class="personal-box1-img1"><img src="/public/static/picture/personal-center-img2.png" alt=""></span>
          	      <span class="personal-box1-text1">待发货</span>
          	   </a>
          	   <a href="<?php echo url('order/orderlist'); ?>?type=3" class="personal-box2 box3">
          	      <span class="personal-box1-img1"><img src="/public/static/picture/personal-center-img3.png" alt=""></span>
          	      <span class="personal-box1-text1">待收货</span>
          	   </a>
          	   <a href="<?php echo url('order/orderlist'); ?>?type=4" class="personal-box2 box3">
          	      <span class="personal-box1-img1"><img src="/public/static/picture/personal-center-img4.png" alt=""></span>
          	      <span class="personal-box1-text1">待评价</span>
          	   </a>
          	   <a href="<?php echo url('order/orderlist'); ?>?type=0" class="personal-box2 box3">
          	      <span class="personal-box1-img1"><img src="/public/static/picture/personal-center-img5.png" alt=""></span>
          	      <span class="personal-box1-text1">全部订单</span>
          	   </a>
          </div>
          <!--代付款分类结束-->
          <!--功能分类开始-->
		  <a href="<?php echo url('user/wallet'); ?>" class="personal-box5">
          	  <span class="personal-box5-img1"><img src="/public/static/images/balance.png" alt=""></span>
          	  <span>我的余额</span>
          </a>
		  <a href="<?php echo url('user/invitation'); ?>" class="personal-box5">
          	  <span class="personal-box5-img1"><img src="/public/static/picture/Invitation.png" alt=""></span>
          	  <span>邀请好友</span>
          </a>
          <a href="<?php echo url('user/coupon'); ?>" class="personal-box5">
          	  <span class="personal-box5-img1"><img src="/public/static/picture/personal-center-img10.png" alt=""></span>
          	  <span>我的优惠券</span>
          </a>
          <a href="<?php echo url('user/address'); ?>" class="personal-box5">
          	  <span class="personal-box5-img1"><img src="/public/static/picture/personal-center-img11.png" alt=""></span>
          	  <span>收货地址</span>
          </a>
          <a href="<?php echo url('user/service'); ?>" class="personal-box5">
          	  <span class="personal-box5-img1"><img src="/public/static/picture/personal-center-img12.png" alt=""></span>
          	  <span>售后服务</span>
          </a>
          <a href="javascript:;" onclick="out()" class="personal-box5-text2">退出登录</a>
      </div>
      <!--bigbox结束-->
      <div class="kaola-bottom">
          <a href="<?php echo url('index'); ?>" class="kaola-bottom-box1">
               <span class="kaola-bottom-img1"><img src="/public/static/picture/home2.png"></span>
               <span class="kaola-bottom-text1">首页</span>
          </a>
          <a href="<?php echo url('classify'); ?>" class="kaola-bottom-box1">
               <span class="kaola-bottom-img1"><img src="/public/static/picture/classification.png"></span>
               <span class="kaola-bottom-text1">分类</span>
          </a>
          <a href="<?php echo url('shpcart'); ?>" class="kaola-bottom-box1">
               <span class="kaola-bottom-img1"><img src="/public/static/picture/shop-cart1.png"></span>
               <span class="kaola-bottom-text1">购物车</span>
          </a>
          <a href="<?php echo url('pcenter'); ?>" class="kaola-bottom-box1">
               <span class="kaola-bottom-img1"><img src="/public/static/picture/people2.png"></span>
               <span class="kaola-bottom-text1 text2">我的</span>
          </a>
     </div>
</div>
</body>
<script>
	function out(){
		layer.msg('确定退出吗？', {
		  	time: 0 ,
		  	btn: ['确定', '取消'],
		  	yes: function(index){
		    	layer.close(index);
		    	location.href="<?php echo url('login/logout'); ?>";
		  	}
		});
	}
	
</script>

</html>