<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:40:"./themes/default/index/index\newest.html";i:1562990865;}*/ ?>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
		<meta name="viewport" id="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no" />
		<link href="/public/static/css/reset.css" rel="stylesheet" type="text/css">
		<link href="/public/static/css/index.css" rel="stylesheet" type="text/css">
		<link href="/public/static/css/discounts.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/public/static/js/jquery-1.8.3.min.js"></script>
	</head>
	<body>
		<div class="near-box">
			<!--头部开始-->
			<div class="header">
				<a href="javascript:;" onclick="history.go(-1)" class="left"></a>
				最新产品
			</div>
			<!--头部结束-->
			<div class="discounts-bigbox">
				<div class="discounts-banner1"><img src="/public/static/picture/discounts-img1.jpg" alt=""></div>
				<?php if(is_array($newlist) || $newlist instanceof \think\Collection || $newlist instanceof \think\Paginator): $index = 0; $__LIST__ = $newlist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($index % 2 );++$index;?>
					<div class="discounts-box1">
						<span class="d-box1-img1"><img src="/public/uploads/<?php echo $item['image']; ?>" alt=""></span>
						<div class="discounts-box2">
							<span class="d-box2-text1"><?php echo $item['name']; ?></span>
							<?php if($item['price2'] == ''): ?>
								<span class="d-box2-text2">￥<?php echo $item['price']; ?> </span>
							<?php else: ?>
								<span class="d-box2-text2">￥<?php echo $item['price2']; ?> <i>原价<?php echo $item['price']; ?></i></span>
							<?php endif; ?>
							<a href="<?php echo url('Goods/details',['id'=>$item['goods_id']]); ?>" class="d-box2-btn">立即购买</a>
						</div>
					</div>
				<?php endforeach; endif; else: echo "" ;endif; ?>

				<!-- <div class="discounts-banner1 mt-10"><img src="/public/static/picture/discounts-img2.jpg" alt=""></div>
				<div class="special-sale-box3 border-top">
					<div class="special-sale-box4 border-bottom">
						<span class="special-sale-img1"><img src="/public/static/picture/fruits-img7.png" alt=""></span>
						<span class="special-sale-tbox">新鲜青柠500g/盒</span>
						<span class="special-sale-text2">￥10.8 <i>￥12.8</i></span>
						<span class="special-sale-text3">购买</span>
					</div>
					<div class="special-sale-box4 border-bottom">
						<span class="special-sale-img1"><img src="/public/static/picture/fruits-img4.png" alt=""></span>
						<span class="special-sale-tbox">新鲜橙子500g/盒</span>
						<span class="special-sale-text2">￥10.8 <i>￥12.8</i></span>
						<span class="special-sale-text3">购买</span>
					</div>
					<div class="special-sale-box4 border-bottom">
						<span class="special-sale-img1"><img src="/public/static/picture/fruits-img2.png" alt=""></span>
						<span class="special-sale-tbox">新鲜猕猴桃500g/盒</span>
						<span class="special-sale-text2">￥10.8 <i>￥12.8</i></span>
						<span class="special-sale-text3">购买</span>
					</div>
					<div class="special-sale-box4 border-bottom">
						<span class="special-sale-img1"><img src="/public/static/picture/fruits-img7.png" alt=""></span>
						<span class="special-sale-tbox">新鲜青柠500g/盒</span>
						<span class="special-sale-text2">￥10.8 <i>￥12.8</i></span>
						<span class="special-sale-text3">购买</span>
					</div>
					<div class="special-sale-box4 border-bottom">
						<span class="special-sale-img1"><img src="/public/static/picture/fruits-img4.png" alt=""></span>
						<span class="special-sale-tbox">新鲜橙子500g/盒</span>
						<span class="special-sale-text2">￥10.8 <i>￥12.8</i></span>
						<span class="special-sale-text3">购买</span>
					</div>
					<div class="special-sale-box4 border-bottom">
						<span class="special-sale-img1"><img src="/public/static/picture/fruits-img2.png" alt=""></span>
						<span class="special-sale-tbox">新鲜猕猴桃500g/盒</span>
						<span class="special-sale-text2">￥10.8 <i>￥12.8</i></span>
						<span class="special-sale-text3">购买</span>
					</div>
					<span class="special-sale-line1"></span>
					<span class="special-sale-line2"></span>
				</div> -->
			</div>

		</div>
		<script type="text/javascript" src="/public/static/js/scrolltopcontrol.js"></script>
	</body>
</html>
