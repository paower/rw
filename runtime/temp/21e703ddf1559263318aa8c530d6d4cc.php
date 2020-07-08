<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:41:"./themes/default/index/index\shpcart.html";i:1562842608;}*/ ?>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
		<meta name="viewport" id="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no" />
		<link href="/public/static/css/reset.css" rel="stylesheet" type="text/css">
		<link href="/public/static/css/shoping-cart.css" rel="stylesheet" type="text/css">
		<script src="/public/static/js/jquery-1.8.3.min.js" type="text/javascript"></script>
		<script src="/public/static/js/cart.js" type="text/javascript"></script>
		<script src="/public/static/js/layer/layer.js"></script>
	</head>
	<body style="background: #F5F5F4;">
		<div class="near-box">
			<div class="header">
				<a href="javascript:;" onclick="history.go(-1)" class="left"></a>
				购物车
				<span class="shop-cart-htext1">编辑</span>
			</div>
			<div class="shop-cart-bigbox">
				<div class="shop-cart-listbox1">
					<div class="shop-cart-box2">
						<input type="checkbox" name="sub2" class="btn1">
						<span class="shop-cart-ltext1">全部</span>
					</div>
					<?php if(is_array($cart) || $cart instanceof \think\Collection || $cart instanceof \think\Paginator): $index = 0; $__LIST__ = $cart;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($index % 2 );++$index;?>
					<div class="index-goods">
						<span class="shop-cart-check2">
							<input type="checkbox" name="sub2" value="<?php echo $item['cart_id']; ?>" class="shopcart-input1 btn2">
						</span>
						<span class="index-goods-img"><img src="/public/uploads/<?php echo $item['image']; ?>"></span>
						<div class="index-goods-textbox">
							<span class="index-goods-text1"><?php echo $item['name']; ?></span>
							<span class="type_text">
								<?php if(is_array($item['attribute_value']) || $item['attribute_value'] instanceof \think\Collection || $item['attribute_value'] instanceof \think\Paginator): $index2 = 0; $__LIST__ = $item['attribute_value'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item2): $mod = ($index2 % 2 );++$index2;?>
								<?php echo $item2['name']; ?>：<?php echo $item2['value_name']; endforeach; endif; else: echo "" ;endif; ?>
							</span>
							<div class="index-goods-text2">
								￥
								<i class="priceJs">
									<?php echo $item['price']; ?>
								</i>
							</div>
							<div class="shop-cart-box3">
								<span class="shop-cart-subtract"></span>
								<input type="tel" size="4" value="1" class="shop-cart-numer tb_count">
								<span class="shop-cart-add"></span>
							</div>
						</div>
					</div>
					<?php endforeach; endif; else: echo "" ;endif; ?>
					<div style="display: none;" class="shopPrice">本店总计：￥<span class="ShopTotal">0.00</span></div>
				</div>



			</div>
			<div class="shop-cart-total">
				<label class="checkall">
					<span class="shop-cart-check1"><input type="checkbox" class="" id="ckAll"></span>
					全选
				</label>
				<span class="scart-total-text2">合计：￥</span>
				<span id="AllTotal" class="scart-total-text3">0.00</span>
				<a href="javascript:;" onclick="buy()" class="scart-total-text4">去结算<i id="selectedTotal"></i></a>
				<span onclick="del()" class="delete hide"></span>
			</div>
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
					<span class="kaola-bottom-img1"><img src="/public/static/picture/shop-cart2.png"></span>
					<span class="kaola-bottom-text1 text2">购物车</span>
				</a>
				<a href="<?php echo url('pcenter'); ?>" class="kaola-bottom-box1">
					<span class="kaola-bottom-img1"><img src="/public/static/picture/people1.png"></span>
					<span class="kaola-bottom-text1">我的</span>
				</a>
			</div>
		</div>
		<input type="hidden" id="ids" value="">
		<script type="text/javascript">
			//去结算
			function buy() {
				//console.log('去结算');
				var cart_id = '';
				$('.btn2:checked').each(function() {
					cart_id += $(this).val() + ',';
				});
				if (cart_id == '') {
					layer.msg("请选择要结算的商品");
					return false;
				}
				var num = '';
				$('.tb_count').each(function() {
					num += $(this).val() + ',';
				});

				location.href = "<?php echo url('Order/ordersTwo'); ?>?id=" + cart_id + "&num=" + num;
			}

			//删除
			function del() {
				layer.msg('确定删除吗？', {
					time: 0,
					btn: ['确定', '取消'],
					yes: function(index) {
						layer.close(index);
						var cart_id = '';
						$('.btn2:checked').each(function() {
							cart_id += $(this).val() + ',';
						});

						$.post(
							"<?php echo url('Index/cartDel'); ?>", {
								cart_id: cart_id
							},
							function(msg) {
								if (msg.success) {
									layer.msg(msg.text);
								} else {
									layer.msg(msg.text);
								}
							}
						);
					}
				});

				//	console.log(cart_id);
			}
		</script>
	</body>
</html>
