<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:40:"./themes/default/index/index\coupon.html";i:1562918399;}*/ ?>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
		<meta name="viewport" id="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no" />
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
				<div class="coupon-box1" id="con_one_1">
					<!--优惠券主体开始-->
					<?php if(is_array($coupon) || $coupon instanceof \think\Collection || $coupon instanceof \think\Paginator): $index = 0; $__LIST__ = $coupon;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($index % 2 );++$index;?>
						<div class="coupon-bigbox">
							<div class="coupon-box2">
								<span class="coupon-semicircle1"></span>
								<span class="coupon-semicircle2"></span>
								<span class="coupon-line"></span>
								<!--现金券内容开始-->
								<div class="coupon-box3">
									<span onclick="receive(<?php echo $item['coupon_id']; ?>)" style="color: #FF9201;" class="coupon-text1">领取</span>
									<?php if($item['coupon_type'] == 1): ?>
										<span class="coupon-text2">¥<?php echo $item['coupon_value']; ?></span>
									<?php else: ?>
										<span class="coupon-text2"><?php echo number_format($item['coupon_value']); ?>折</span>
									<?php endif; if($item['coupon_limit'] != 0): ?>
										<span class="coupon-text3">满<?php echo $item['coupon_limit']; ?>元使用</span>
									<?php else: ?>
										<span class="coupon-text3">无使用条件</span>
									<?php endif; ?>
								</div>
								<div class="coupon-box4">
									<span class="coupon-text4"><?php echo $item['describe']; ?></span>
									<span class="coupon-text4">剩余<?php echo $item['coupon_surplus_num']; ?>张</span>
									<span class="coupon-text5"><?php echo date('Y-m-d H:i:s',$item['expire_time']); ?> 到期 <i class="particulars">详情</i></span>
								</div>
							</div>
							<div class="coupon-box5" style="display: none;">
								<span class="coupon-line2"></span>
								<span class="coupon-text6">优惠券前缀号：<?php echo $item['conpon_prefix']; ?></span>
								<span class="coupon-text6">使用时间：<?php echo date('Y-m-d H:i:s',$item['generate_time']); ?>至<?php echo date('Y-m-d H:i:s',$item['expire_time']); ?></span>
							</div>
						</div>
					<?php endforeach; endif; else: echo "" ;endif; ?>
					<!--优惠券主体结束-->
				</div>

			</div>

		</div>
		<script src="/public/static/js/jquery-1.8.3.min.js"></script>
		<script src="/public/static/js/layer/layer.js"></script>
		<script>
			function setTab(name, cursel, n) {
				for (i = 1; i <= n; i++) {
					var menu = document.getElementById(name + i);
					var con = document.getElementById("con_" + name + "_" + i);
					menu.className = i == cursel ? "tc-picthon coupon-title-text1" : "coupon-title-text1";
					con.style.display = i == cursel ? "block" : "none";
				}
			}
			$(".particulars").click(function() {
				$(this).parent(".coupon-text5").parent(".coupon-box4")
					.parent(".coupon-box2").next(".coupon-box5").toggle();
				$(this).parent(".coupon-text5").parent(".coupon-box4")
					.parent(".coupon-box2").parent(".coupon-bigbox").toggleClass("h-190");
				$(this).parent(".coupon-text5").parent(".coupon-box4")
					.parent(".coupon-box2").parent(".coupon-bigbox").siblings(".coupon-bigbox").removeClass("h-190");
				$(this).parent(".coupon-text5").parent(".coupon-box4")
					.parent(".coupon-box2").parent(".coupon-bigbox").siblings(".coupon-bigbox").find(".coupon-box5").hide("fast");
			});
			
			function receive(id){
				$.ajax({
					url:"<?php echo url('index/coupon'); ?>",
					type: 'POST',
					data: {coupon_id:id},
					success:function (msg) {
						if (msg.success) {
							layer.msg(msg.text);
							location.href="<?php echo url('Index/coupon'); ?>";
						} else {
							layer.msg(msg.text);
						}
					}
				});
			}
		</script>
	</body>
</html>
