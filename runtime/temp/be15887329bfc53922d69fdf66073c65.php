<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:39:"./themes/default/index/index\index.html";i:1563002065;}*/ ?>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
		<meta name="viewport" id="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no" />
		<link href="/public/static/css/reset.css" rel="stylesheet" type="text/css">
		<link href="/public/static/css/index.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/public/static/js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript" src="/public/static/js/touchslide.1.1.js"></script>
		<script type="text/javascript" src="/public/static/js/scrolltopcontrol.js"></script>
	</head>
	<body>
		<div class="near-box">
			<!--头部开始-->
			<div class="yx-index-top">
				<div class="index-top-box1">
				</div>
				<div class="index-top-box2">
					<span class="fresh-toptext1">商城首页</span>
				</div>
				<a href="<?php echo url('search'); ?>" class="index-top-box1">
					<span class="index-top-img1"><img src="/public/static/picture/search3.png" alt=""></span>
				</a>
			</div>
			<!--头部结束-->
			<div class="index-bigbox">
				<!--轮播开始-->
				<div id="slideBox" class="slideBox">
					<div class="bd" id="bd">
						<ul>
							<?php if(is_array($frontend_images) || $frontend_images instanceof \think\Collection || $frontend_images instanceof \think\Paginator): $frontend_images_index = 0; $__LIST__ = $frontend_images;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$frontend_images_item): $mod = ($frontend_images_index % 2 );++$frontend_images_index;?>
								<li>
									<a class="pic" href="#"><img src="/public/uploads/<?php echo $frontend_images_item['frontend_images_image']; ?>" /></a>
								</li>
							<?php endforeach; endif; else: echo "" ;endif; ?>
						</ul>
					</div>
					<div class="hd">
						<ul></ul>
					</div>
				</div>
				<!--轮播开始-->
				<!--分类导航开始-->
				<div class="classify-menu">
					<a href="<?php echo url('index/popular'); ?>" class="classify-menu-box1">
						<span class="classify-menu-img1"><img src="/public/static/picture/diamond.png" alt=""></span>
						<span class="classify-menu-text1">热门推荐</span>
					</a>
					<a href="<?php echo url('index/newest'); ?>" class="classify-menu-box1">
						<span class="classify-menu-img1 img-color2"><img src="/public/static/picture/package.png" alt=""></span>
						<span class="classify-menu-text1">最新产品</span>
					</a>
					<a href="<?php echo url('index/classify'); ?>" class="classify-menu-box1">
						<span class="classify-menu-img1 img-color3"><img src="/public/static/picture/classification01.png" alt=""></span>
						<span class="classify-menu-text1">分类产品</span>
					</a>
					<a href="<?php echo url('index/coupon'); ?>" class="classify-menu-box1">
						<span class="classify-menu-img1 img-color4"><img src="/public/static/picture/personal-center-img102.png" alt=""></span>
						<span class="classify-menu-text1">优惠券</span>
					</a>
				</div>
				<!--分类导航结束-->
				<!--品牌特卖开始-->
				<div class="brand-box1">
					<span class="brand-text1">品牌特卖</span>
					<span class="brand-img1"></span>
				</div>
				<div class="special-sale-box1">
					<?php if(is_array($brand) || $brand instanceof \think\Collection || $brand instanceof \think\Paginator): $brand_index = 0; $__LIST__ = $brand;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$brand_item): $mod = ($brand_index % 2 );++$brand_index;?>
						<a href="<?php echo url('Index/brandlist',['id'=>$brand_item['brand_id']]); ?>">
							<span class="special-sale-box2"><img src="/public/uploads/<?php echo $brand_item['image']; ?>" alt=""></span>
						</a>
					<?php endforeach; endif; else: echo "" ;endif; ?>
				</div>
				<!--品牌特卖结束-->
				<!--热门推荐开始-->
				<div class="brand-box1">
					<span class="brand-text1">热门推荐</span>
					<span class="brand-img1"></span>
				</div>
				<div class="special-sale-banner">
					<img src="/public/static/picture/optimization-img1.jpg" alt="">
				</div>
				<div class="special-sale-box3">
					<?php if(is_array($popular) || $popular instanceof \think\Collection || $popular instanceof \think\Paginator): $popular_index = 0; $__LIST__ = $popular;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$popular_item): $mod = ($popular_index % 2 );++$popular_index;?>
						<a href="<?php echo url('Goods/details',['id'=>$popular_item['goods_id']]); ?>">
							<div class="special-sale-box4">
								<span class="special-sale-img1"><img src="/public/uploads/<?php echo $popular_item['image']; ?>" alt=""></span>
								<span class="special-sale-tbox"><?php echo $popular_item['name']; ?></span>
								<!-- <div class="special-sale-tbox2"><span class="special-sale-text1">买一赠一</span></div> -->
								<?php if($popular_item['price2'] == ''): ?>
									<span class="special-sale-text2">￥<?php echo $popular_item['price']; ?></span>
								<?php else: ?>
									<span class="special-sale-text2">￥<?php echo $popular_item['price2']; ?> <i>￥<?php echo $popular_item['price']; ?></i></span>
								<?php endif; ?>
							</div>
						</a>
					<?php endforeach; endif; else: echo "" ;endif; ?>
				</div>
				<!--热门推荐结束-->
				<!--最新产品开始-->
				<div class="brand-box1">
					<span class="brand-text1">最新产品</span>
					<span class="brand-img1"></span>
				</div>
				<div class="special-sale-banner">
					<img src="/public/static/picture/optimization-img2.jpg" alt="">
				</div>
				<div class="special-sale-box3">
					<?php if(is_array($newlist) || $newlist instanceof \think\Collection || $newlist instanceof \think\Paginator): $newlist_index = 0; $__LIST__ = $newlist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$newlist_item): $mod = ($newlist_index % 2 );++$newlist_index;?>
						<a href="<?php echo url('Goods/details',['id'=>$newlist_item['goods_id']]); ?>">
							<div class="special-sale-box4">
								<span class="special-sale-img1"><img src="/public/uploads/<?php echo $newlist_item['image']; ?>" alt=""></span>
								<span class="special-sale-tbox"><?php echo $newlist_item['name']; ?></span>
								<!-- <div class="special-sale-tbox2"><span class="special-sale-text1">买一赠一</span></div> -->
								<?php if($newlist_item['price2'] == ''): ?>
									<span class="special-sale-text2">￥<?php echo $newlist_item['price']; ?></span>
								<?php else: ?>
									<span class="special-sale-text2">￥<?php echo $newlist_item['price2']; ?> <i>￥<?php echo $newlist_item['price']; ?></i></span>
								<?php endif; ?>
							</div>
						</a>
					<?php endforeach; endif; else: echo "" ;endif; ?>
				</div>
				<!--最新产品结束-->
				<!--猜你喜欢开始-->
				<div class="brand-box1">
					<span class="brand-text1">猜你喜欢</span>
					<span class="brand-img1"></span>
				</div>
				<div class="special-sale-banner">
					<img src="/public/static/picture/optimization-img3.jpg" alt="">
				</div>
				<div class="special-sale-box3">
					<?php if(is_array($guesslike) || $guesslike instanceof \think\Collection || $guesslike instanceof \think\Paginator): $guesslike_index = 0; $__LIST__ = $guesslike;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$guesslike_item): $mod = ($guesslike_index % 2 );++$guesslike_index;?>
						<a href="<?php echo url('Goods/details',['id'=>$guesslike_item['goods_id']]); ?>">
							<div class="special-sale-box4">
								<span class="special-sale-img1"><img src="/public/uploads/<?php echo $guesslike_item['image']; ?>" alt=""></span>
								<span class="special-sale-tbox"><?php echo $guesslike_item['name']; ?></span>
								<!-- <div class="special-sale-tbox2"><span class="special-sale-text1">买一赠一</span></div> -->
								<?php if($guesslike_item['price2'] == ''): ?>
									<span class="special-sale-text2">￥<?php echo $guesslike_item['price']; ?></span>
								<?php else: ?>
									<span class="special-sale-text2">￥<?php echo $guesslike_item['price2']; ?> <i>￥<?php echo $guesslike_item['price']; ?></i></span>
								<?php endif; ?>
							</div>
						</a>
					<?php endforeach; endif; else: echo "" ;endif; ?>
				</div>
				<!--猜你喜欢结束-->

			</div>
			<!--bigbox结束-->

			<div class="kaola-bottom">
				<a href="<?php echo url('index'); ?>" class="kaola-bottom-box1">
					<span class="kaola-bottom-img1"><img src="/public/static/picture/home.png"></span>
					<span class="kaola-bottom-text1 text2">首页</span>
				</a>
				<a href="<?php echo url('classify'); ?>" class="kaola-bottom-box1">
					<span class="kaola-bottom-img1"><img src="/public/static/picture/classification.png"></span>
					<span class="kaola-bottom-text1">分类</span>
				</a>
				<a href="<?php echo url('shpcart'); ?>" class="kaola-bottom-box1">
					<span class="kaola-bottom-img1"><img src="/public/static/picture/shop-cart1.png"></span>
					<span class="kaola-bottom-text1 ">购物车</span>
				</a>
				<a href="<?php echo url('pcenter'); ?>" class="kaola-bottom-box1">
					<span class="kaola-bottom-img1"><img src="/public/static/picture/people1.png"></span>
					<span class="kaola-bottom-text1">我的</span>
				</a>
			</div>
		</div>
		<script>
			TouchSlide({
				slideCell: "#slideBox",
				titCell: ".hd ul", //开启自动分页 autoPage:true ，此时设置 titCell 为导航元素包裹层
				mainCell: ".bd ul",
				effect: "leftLoop",
				autoPage: true, //自动分页
				autoPlay: true, //自动播放
			});
		</script>
	</body>
</html>
