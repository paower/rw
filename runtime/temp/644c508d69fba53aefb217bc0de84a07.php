<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:39:"./themes/default/index/user\coupon.html";i:1563009184;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<meta name="viewport" id="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no"/>
<link href="/public/static/css/reset.css" rel="stylesheet" type="text/css">
<link href="/public/static/css/discount-coupon.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="near-box">
	<div class="header">
		<a href="javascript:;" onclick="history.go(-1)" class="left"></a>
		优惠券
	</div>
	<div class="bigbox">
		<div class="coupon-title"> 
			 <span class="coupon-title-text1 tc-picthon" id="one1" onclick="setTab('one',1,3)">未使用</span>
			 <span class="coupon-title-text1" id="one2" onclick="setTab('one',2,3)">已使用</span>
			 <span class="coupon-title-text1" id="one3" onclick="setTab('one',3,3)">已过期</span>
		</div> 
		<div class="coupon-box1" id="con_one_1">
			<!--优惠券主体开始-->
			<?php if(is_array($user_coupon1) || $user_coupon1 instanceof \think\Collection || $user_coupon1 instanceof \think\Paginator): $i = 0; $__LIST__ = $user_coupon1;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$coupon1): $mod = ($i % 2 );++$i;?>
				<div class="coupon-bigbox">
					<div class="coupon-box2">
						<span class="coupon-semicircle1"></span>
						<span class="coupon-semicircle2"></span>
						<span class="coupon-line"></span>
						<!--现金券内容开始-->
						<div class="coupon-box3">
							<span class="coupon-text1">有效</span>
							<?php if($coupon1['coupon_type'] == 1): ?>
								<span class="coupon-text2">￥<?php echo $coupon1['coupon_value']; ?></span>
							<?php else: ?>
								<span class="coupon-text2"><?php echo number_format($coupon1['coupon_value']); ?>折</span>
							<?php endif; if($coupon1['coupon_limit'] != 0): ?>
								<span class="coupon-text3">满<?php echo $coupon1['coupon_limit']; ?>元使用</span>
							<?php else: ?>
								<span class="coupon-text3">无使用条件</span>
							<?php endif; ?>
						</div>
						<div class="coupon-box4">
							<span class="coupon-text4"><?php echo $coupon1['describe']; ?></span>
							<!-- <span class="coupon-text4">全场通用</span> -->
							<span class="coupon-text5"><?php echo date('Y-m-d H:i:s',$coupon1['expire_time']); ?> 到期 <i class="particulars">详情</i></span>
						</div>    
					</div>
					<div class="coupon-box5" style="display: none;">
						<span class="coupon-line2"></span>	
						<span class="coupon-text6">现金券号：<?php echo $coupon1['coupon_number']; ?></span>
						<span class="coupon-text6">使用时间：<?php echo date('Y-m-d H:i:s',$coupon1['generate_time']); ?>至<?php echo date('Y-m-d H:i:s',$coupon1['expire_time']); ?></span>
					</div>
				</div>
			<?php endforeach; endif; else: echo "" ;endif; ?>
			
            <!--优惠券主体结束-->
		</div>	
		<div class="coupon-box1" id="con_one_2" style="display: none;">
			<!--优惠券主体开始-->
			<?php if(is_array($user_coupon2) || $user_coupon2 instanceof \think\Collection || $user_coupon2 instanceof \think\Paginator): $i = 0; $__LIST__ = $user_coupon2;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$coupon2): $mod = ($i % 2 );++$i;?>
				<div class="coupon-bigbox">
					<div class="coupon-box2">
						<span class="coupon-semicircle1"></span>
						<span class="coupon-semicircle2"></span>
						<span class="coupon-line"></span>
						<!--现金券内容开始-->
						<div class="coupon-box3">
							<span class="coupon-text1">已使用</span>
							<?php if($coupon2['coupon_type'] == 1): ?>
								<span class="coupon-text2 tcolor-gray">￥<?php echo $coupon2['coupon_value']; ?></span>
							<?php else: ?>
								<span class="coupon-text2 tcolor-gray"><?php echo number_format($coupon2['coupon_value']); ?>折</span>
							<?php endif; if($coupon2['coupon_limit'] != 0): ?>
								<span class="coupon-text3">满<?php echo $coupon2['coupon_limit']; ?>元使用</span>
							<?php else: ?>
								<span class="coupon-text3">无使用条件</span>
							<?php endif; ?>
						</div>
						<div class="coupon-box4">
							<span class="coupon-text4 tcolor-gray"><?php echo $coupon2['describe']; ?></span>
							<!-- <span class="coupon-text4 tcolor-gray">全场通用</span> -->
							<span class="coupon-text5"><?php echo date('Y-m-d H:i:s',$coupon2['expire_time']); ?> 到期 <i class="particulars">详情</i></span>
						</div>    
					</div>
					<div class="coupon-box5" style="display: none;">
						<span class="coupon-line2"></span>	
						<span class="coupon-text6 tcolor-gray">现金券号：<?php echo $coupon2['coupon_number']; ?></span>
						<span class="coupon-text6 tcolor-gray">使用时间：<?php echo date('Y-m-d H:i:s',$coupon2['generate_time']); ?>至<?php echo date('Y-m-d H:i:s',$coupon2['expire_time']); ?></span>
					</div>
				</div>
			<?php endforeach; endif; else: echo "" ;endif; ?>
			<!--优惠券主体结束-->
		</div>
		<div class="coupon-box1" id="con_one_3" style="display: none;">
			<!--优惠券主体开始-->
			<?php if(is_array($user_coupon3) || $user_coupon3 instanceof \think\Collection || $user_coupon3 instanceof \think\Paginator): $i = 0; $__LIST__ = $user_coupon3;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$coupon3): $mod = ($i % 2 );++$i;?>
				<div class="coupon-bigbox">
					<div class="coupon-box2">
						<span class="coupon-semicircle1"></span>
						<span class="coupon-semicircle2"></span>
						<span class="coupon-line"></span>
						<!--现金券内容开始-->
						<div class="coupon-box3">
							<span class="coupon-text1">已过期</span>
							<?php if($coupon3['coupon_type'] == 1): ?>
								<span class="coupon-text2 tcolor-gray">￥<?php echo $coupon3['coupon_value']; ?></span>
							<?php else: ?>
								<span class="coupon-text2 tcolor-gray"><?php echo number_format($coupon3['coupon_value']); ?>折</span>
							<?php endif; if($coupon3['coupon_limit'] != 0): ?>
								<span class="coupon-text3">满<?php echo $coupon3['coupon_limit']; ?>元使用</span>
							<?php else: ?>
								<span class="coupon-text3">无使用条件</span>
							<?php endif; ?>
						</div>
						<div class="coupon-box4">
							<span class="coupon-text4 tcolor-gray"><?php echo $coupon3['describe']; ?></span>
							<!-- <span class="coupon-text4 tcolor-gray">全场通用</span> -->
							<span class="coupon-text5"><?php echo date('Y-m-d H:i:s',$coupon3['expire_time']); ?> 到期 <i class="particulars">详情</i></span>
						</div>    
					</div>
					<div class="coupon-box5" style="display: none;">
						<span class="coupon-line2"></span>	
						<span class="coupon-text6 tcolor-gray">现金券号：<?php echo $coupon3['coupon_number']; ?></span>
						<span class="coupon-text6 tcolor-gray">使用时间：<?php echo date('Y-m-d H:i:s',$coupon3['generate_time']); ?>至<?php echo date('Y-m-d H:i:s',$coupon3['expire_time']); ?></span>
					</div>
				</div>
			<?php endforeach; endif; else: echo "" ;endif; ?>
			<!--优惠券主体结束-->
		</div>
	</div>

</div>
<script src="/public/static/js/jquery-1.8.3.min.js"></script>
<script>
function setTab(name,cursel,n){
  for(i=1;i<=n;i++){
      var menu=document.getElementById(name+i);
      var con=document.getElementById("con_"+name+"_"+i);
      menu.className=i==cursel?"tc-picthon coupon-title-text1":"coupon-title-text1";
      con.style.display=i==cursel?"block":"none";
  }
}
 $(".particulars").click(function () {
 	 $(this).parent(".coupon-text5").parent(".coupon-box4")
 	 .parent(".coupon-box2").next(".coupon-box5").toggle();
 	 $(this).parent(".coupon-text5").parent(".coupon-box4")
 	 .parent(".coupon-box2").parent(".coupon-bigbox").toggleClass("h-190");
 	 $(this).parent(".coupon-text5").parent(".coupon-box4")
 	 .parent(".coupon-box2").parent(".coupon-bigbox").siblings(".coupon-bigbox").removeClass("h-190");
 	 $(this).parent(".coupon-text5").parent(".coupon-box4")
 	 .parent(".coupon-box2").parent(".coupon-bigbox").siblings(".coupon-bigbox").find(".coupon-box5").hide("fast");
 });
</script>	
</body>
</html>