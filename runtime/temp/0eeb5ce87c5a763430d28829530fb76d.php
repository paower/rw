<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:43:"./themes/default/index/order\orderlist.html";i:1563003856;}*/ ?>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
		<meta name="viewport" id="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no" />
		<link rel="stylesheet" href="/public/static/css/reset.css" type="text/css" />
		<link href="/public/static/css/my-indent.css" rel="stylesheet" type="text/css">
		<script src="/public/static/js/jquery-1.8.3.min.js" type="text/javascript"></script>
		<script src="/public/static/js/layer/layer.js"></script>
		<title></title>
	</head>
	<body>
		<div class="zjzz-buylist-wear">
			<div class="zjzz-buylist-top">
				<a href="javascript:;" onclick="history.go(-1)" class="zjzz-buylist-t1"></a>
				<span class="zjzz-buylist-t2">我的订单</span>
				<!--<span class="zjzz-buylist-t3">
					<span class="zjzz-buylist-t4"></span>
				</span>-->
			</div>
		</div>
		<div class="zjzz-buylist-top2">
			<a href="javascript:;" class="zjzz-buylist-tp1">
				<i class="t-t">全部</i>
				<!--<span class="zjzz-buylist-tp3">4</span>-->
			</a>
			<a href="javascript:;" class="zjzz-buylist-tp1">
				<i class="t-t">待付款</i>
				<!--<span class="zjzz-buylist-tp3">1</span>-->
			</a>
			<a href="javascript:;" class="zjzz-buylist-tp1">
				<i class="t-t">待发货</i>
				<!--<span class="zjzz-buylist-tp3">1</span>-->
			</a>
			<a href="javascript:;" class="zjzz-buylist-tp1">
				<i class="t-t">待收货</i>
				<!--<span class="zjzz-buylist-tp3">1</span>-->
			</a>
			<a href="javascript:;" class="zjzz-buylist-tp1">
				<i class="t-t">评价</i>
				<!--<span class="zjzz-buylist-tp3">4</span>-->
			</a>
		</div>
		<div class="zjzz-buylist-mid">
			<!--全部-->
			<div class="zjzz-buylist-m1">
				<!--<span class="zjzz-buylist-allact">
					双十一期间发货时效公告>>
				</span>-->
				<?php if(is_array($all_list) || $all_list instanceof \think\Collection || $all_list instanceof \think\Paginator): $allindex = 0; $__LIST__ = $all_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$alldata): $mod = ($allindex % 2 );++$allindex;?>
				<div class="zjzz-buylist-goods1">
					<div class="zjzz-buylist-gtime">
						<span class="zjzz-buylist-gtime1"><?php echo date("Y-m-d",$alldata['creation_time']); ?></span>
						<span class="zjzz-buylist-gtime2"><?php echo $alldata['name2']; ?></span>
					</div>
					<?php if(is_array($alldata['goods_list']) || $alldata['goods_list'] instanceof \think\Collection || $alldata['goods_list'] instanceof \think\Paginator): $g_allindex = 0; $__LIST__ = $alldata['goods_list'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$g_alldata): $mod = ($g_allindex % 2 );++$g_allindex;?>
					<div class="zjzz-buylist-det">
						<img src="/public/uploads/<?php echo $g_alldata['image']; ?>" />
						<div class="zjzz-buylist-gdetail">
							<span class="zjzz-buylist-gtit1"><?php echo $g_alldata['name']; ?></span>
							<span class="zjzz-buylist-gmoney">
								<i class="zjzz-buylist-gm1">￥<?php echo $g_alldata['price']; ?></i>
								<i class="zjzz-buylist-gm2">x<?php echo $g_alldata['num']; ?></i>
							</span>
						</div>
					</div>
					<?php endforeach; endif; else: echo "" ;endif; ?>
					<span class="zjzz-buylist-goodsm">
						<i class="zjzz-buylist-gm3">共<?php echo $alldata['count']; ?>件</i>
						<i>应付总额：<i class="zjzz-buylist-gm4">￥<?php echo $alldata['price']; ?></i></i>
					</span>
					<div class="zjzz-buylist-btn">
						<?php if($alldata['order_status_id'] == 1): ?>
						<!--<a href="<?php echo url('order/tracking'); ?>" class="zjzz-buylist-btn1">查看物流</a>-->
						<a href="<?php echo url('order/details',['id'=>$alldata['order_id']]); ?>" class="zjzz-buylist-btn1">查看订单</a>
						<a href="<?php echo url('order/refund',['id'=>$alldata['order_id']]); ?>" class="zjzz-buylist-btn1">退款</a>
						<?php elseif($alldata['order_status_id'] == 3): ?>
						<a href="<?php echo url('Pay/payment',['id'=>$alldata['order_id']]); ?>" class="zjzz-buylist-btn3">去付款</a>
						<?php elseif($alldata['order_status_id'] == 4): ?>
						<a onclick="confirm(<?php echo $alldata['order_id']; ?>)" href="javascript:;" class="zjzz-buylist-btn3">确认收货</a>
						<a href="<?php echo url('order/details',['id'=>$alldata['order_id']]); ?>" class="zjzz-buylist-btn1">查看订单</a>
						<!--<a href="<?php echo url('order/tracking'); ?>" class="zjzz-buylist-btn1">查看物流</a>-->
						<?php elseif($alldata['order_status_id'] == 5): ?>
						<a href="<?php echo url('order/details',['id'=>$alldata['order_id']]); ?>" class="zjzz-buylist-btn1">查看订单</a>
						<?php elseif($alldata['order_status_id'] == 6): ?>
						<!--<a href="<?php echo url('order/pj',['id'=>$alldata['order_id']]); ?>" class="zjzz-buylist-btn2">评论送豆</a>-->
						<a href="<?php echo url('order/details',['id'=>$alldata['order_id']]); ?>" class="zjzz-buylist-btn1">查看订单</a>
						<?php elseif($alldata['order_status_id'] == 7): ?>
						<a href="<?php echo url('order/details',['id'=>$alldata['order_id']]); ?>" class="zjzz-buylist-btn1">查看订单</a>
						<?php endif; ?>
					</div>
				</div>
				<?php endforeach; endif; else: echo "" ;endif; ?>
			</div>

			<!--待付款-->
			<div class="zjzz-buylist-m1">
				<!--<span class="zjzz-buylist-allact">
					双十一期间发货时效公告>>
				</span>-->
				<?php if(is_array($dfk_list) || $dfk_list instanceof \think\Collection || $dfk_list instanceof \think\Paginator): $dfkindex = 0; $__LIST__ = $dfk_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$dfkitem): $mod = ($dfkindex % 2 );++$dfkindex;?>
				<div class="zjzz-buylist-goods1">
					<div class="zjzz-buylist-gtime">
						<span class="zjzz-buylist-gtime1"><?php echo date("Y-m-d",$dfkitem['creation_time']); ?></span>
						<span class="zjzz-buylist-gtime2">待付款</span>
					</div>
					<?php if(is_array($dfkitem['goods_list']) || $dfkitem['goods_list'] instanceof \think\Collection || $dfkitem['goods_list'] instanceof \think\Paginator): $dfkindex2 = 0; $__LIST__ = $dfkitem['goods_list'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$dfkitem2): $mod = ($dfkindex2 % 2 );++$dfkindex2;?>
					<div class="zjzz-buylist-det">
						<img src="/public/uploads/<?php echo $dfkitem2['image']; ?>" />
						<div class="zjzz-buylist-gdetail">
							<span class="zjzz-buylist-gtit1"><?php echo $dfkitem2['name']; ?></span>
							<span class="zjzz-buylist-gmoney">
								<i class="zjzz-buylist-gm1">￥<?php echo $dfkitem2['price']; ?></i>
								<i class="zjzz-buylist-gm2">x<?php echo $dfkitem2['num']; ?></i>
							</span>
						</div>
					</div>
					<?php endforeach; endif; else: echo "" ;endif; ?>
					<span class="zjzz-buylist-goodsm">
						<i class="zjzz-buylist-gm3">共<?php echo $dfkitem['count']; ?>件</i>
						<i>应付总额：<i class="zjzz-buylist-gm4">￥<?php echo $dfkitem['price']; ?></i></i>
					</span>
					<div class="zjzz-buylist-btn">
						<a href="<?php echo url('Pay/payment',['id'=>$dfkitem['order_id']]); ?>" class="zjzz-buylist-btn3">去付款</a>
					</div>
				</div>
				<?php endforeach; endif; else: echo "" ;endif; ?>
			</div>

			<!--待发货-->
			<div class="zjzz-buylist-m1">
				<!--<span class="zjzz-buylist-allact">
					双十一期间发货时效公告>>
				</span>-->
				<?php if(is_array($dfh_list) || $dfh_list instanceof \think\Collection || $dfh_list instanceof \think\Paginator): $dfhindex = 0; $__LIST__ = $dfh_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$dfhitem): $mod = ($dfhindex % 2 );++$dfhindex;?>
				<div class="zjzz-buylist-goods1">
					<div class="zjzz-buylist-gtime">
						<span class="zjzz-buylist-gtime1"><?php echo date("Y-m-d",$dfhitem['creation_time']); ?></span>
						<span class="zjzz-buylist-gtime2">待发货</span>
					</div>
					<?php if(is_array($dfhitem['goods_list']) || $dfhitem['goods_list'] instanceof \think\Collection || $dfhitem['goods_list'] instanceof \think\Paginator): $dfhindex2 = 0; $__LIST__ = $dfhitem['goods_list'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$dfhitem2): $mod = ($dfhindex2 % 2 );++$dfhindex2;?>
					<div class="zjzz-buylist-det">
						<img src="/public/uploads/<?php echo $dfhitem2['image']; ?>" />
						<div class="zjzz-buylist-gdetail">
							<span class="zjzz-buylist-gtit1"><?php echo $dfhitem2['name']; ?></span>
							<span class="zjzz-buylist-gmoney">
								<i class="zjzz-buylist-gm1">￥<?php echo $dfhitem2['price']; ?></i>
								<i class="zjzz-buylist-gm2">x<?php echo $dfhitem2['num']; ?></i>
							</span>
						</div>
					</div>
					<?php endforeach; endif; else: echo "" ;endif; ?>
					<span class="zjzz-buylist-goodsm">
						<i class="zjzz-buylist-gm3">共<?php echo $dfhitem['count']; ?>件</i>
						<i>应付总额：<i class="zjzz-buylist-gm4">￥<?php echo $dfhitem['price']; ?></i></i>
					</span>
					<div class="zjzz-buylist-btn">
						<a href="<?php echo url('order/details',['id'=>$dfhitem['order_id']]); ?>" class="zjzz-buylist-btn1">查看订单</a>
						<!--<a href="<?php echo url('order/tracking'); ?>" class="zjzz-buylist-btn1">查看物流</a>-->
						<a href="<?php echo url('order/refund',['id'=>$dfhitem['order_id']]); ?>" class="zjzz-buylist-btn1">退款</a>
					</div>
				</div>
				<?php endforeach; endif; else: echo "" ;endif; ?>
			</div>

			<!--待收货-->
			<div class="zjzz-buylist-m1">
				<!--<span class="zjzz-buylist-allact">
					双十一期间发货时效公告>>
				</span>-->
				<?php if(is_array($dsh_list) || $dsh_list instanceof \think\Collection || $dsh_list instanceof \think\Paginator): $dshindex = 0; $__LIST__ = $dsh_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$dshitem): $mod = ($dshindex % 2 );++$dshindex;?>
				<div class="zjzz-buylist-goods1">
					<div class="zjzz-buylist-gtime">
						<span class="zjzz-buylist-gtime1"><?php echo date("Y-m-d",$dshitem['creation_time']); ?></span>
						<span class="zjzz-buylist-gtime2">待收货</span>
					</div>
					<?php if(is_array($dshitem['goods_list']) || $dshitem['goods_list'] instanceof \think\Collection || $dshitem['goods_list'] instanceof \think\Paginator): $dshindex2 = 0; $__LIST__ = $dshitem['goods_list'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$dshitem2): $mod = ($dshindex2 % 2 );++$dshindex2;?>
					<div class="zjzz-buylist-det">
						<img src="/public/uploads/<?php echo $dshitem2['image']; ?>" />
						<div class="zjzz-buylist-gdetail">
							<span class="zjzz-buylist-gtit1"><?php echo $dshitem2['name']; ?></span>
							<span class="zjzz-buylist-gmoney">
								<i class="zjzz-buylist-gm1">￥<?php echo $dshitem2['price']; ?></i>
								<i class="zjzz-buylist-gm2">x<?php echo $dshitem2['num']; ?></i>
							</span>
						</div>
					</div>
					<?php endforeach; endif; else: echo "" ;endif; ?>
					<span class="zjzz-buylist-goodsm">
						<i class="zjzz-buylist-gm3">共<?php echo $dshitem['count']; ?>件</i>
						<i>应付总额：<i class="zjzz-buylist-gm4">￥<?php echo $dshitem['price']; ?></i></i>
					</span>
					<div class="zjzz-buylist-btn">
						<a onclick="confirm(<?php echo $dshitem['order_id']; ?>)" class="zjzz-buylist-btn3">确认收货</a>
						<a href="<?php echo url('order/details',['id'=>$dshitem['order_id']]); ?>" class="zjzz-buylist-btn1">查看订单</a>
						<!--<a href="<?php echo url('order/tracking'); ?>" class="zjzz-buylist-btn1">查看物流</a>-->
					</div>
				</div>
				<?php endforeach; endif; else: echo "" ;endif; ?>
			</div>

			<!--评论-->
			<div class="zjzz-buylist-m1">
				<span class="zjzz-buylist-mt1" onclick="setTab2('pj',1,2)"><i id="pj1" class="zjzz-buylist-mt2">待评价(<?php echo $dpj_count; ?>)</i></span>
				<span class="zjzz-buylist-mt1" onclick="setTab2('pj',2,2)"><i id="pj2">已评价</i></span>
				<!--<span class="zjzz-buylist-mt3">已累计奖励0豆</span>-->
				<div class="zjzz-buylist-ms1" id="con_pj_1">
					<?php if(is_array($dpj_list) || $dpj_list instanceof \think\Collection || $dpj_list instanceof \think\Paginator): $dpjindex = 0; $__LIST__ = $dpj_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$dpjitem): $mod = ($dpjindex % 2 );++$dpjindex;?>
					<div class="zjzz-buylist-goods">
						<img src="/public/uploads/<?php echo $dpjitem['image']; ?>" />
						<div class="zjzz-buylist-gdetail">
							<span class="zjzz-buylist-gtit"><?php echo $dpjitem['name']; ?></span>
							<!--<span class="zjzz-buylist-gd">评价送10考拉豆</span>-->
						</div>
						<div class="zjzz-buylist-btn">
							<a href="<?php echo url('order/pj',['id'=>$dpjitem['evaluate_id']]); ?>" class="zjzz-buylist-btn2">我要评价</a>
							<a href="<?php echo url('order/details',['id'=>$dpjitem['order_id']]); ?>" class="zjzz-buylist-btn1">查看订单</a>
						</div>
					</div>
					<?php endforeach; endif; else: echo "" ;endif; ?>
					<span class="zjzz-buylist-mt4">
						<img src="/public/static/picture/weixiao.png" />
						已经到底啦~
					</span>
				</div>
				<div class="zjzz-buylist-ms1" id="con_pj_2" style="display: none;">
					<?php if(is_array($ypj_list) || $ypj_list instanceof \think\Collection || $ypj_list instanceof \think\Paginator): $ypjindex = 0; $__LIST__ = $ypj_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$ypjitem): $mod = ($ypjindex % 2 );++$ypjindex;?>
					<div class="zjzz-buylist-goods">
						<img src="/public/uploads/<?php echo $ypjitem['image']; ?>" />
						<div class="zjzz-buylist-gdetail">
							<span class="zjzz-buylist-gtit"><?php echo $ypjitem['name']; ?></span>
							<!--<span class="zjzz-buylist-gd">评价送10考拉豆</span>-->
						</div>
						<div class="zjzz-buylist-btn">
							<a href="<?php echo url('order/evaluation',['id'=>$ypjitem['evaluate_id']]); ?>" class="zjzz-buylist-btn2">查看评价</a>
							<!--<a href="<?php echo url('order/pj'); ?>" class="zjzz-buylist-btn1">追加评价</a>-->
						</div>
					</div>
					<?php endforeach; endif; else: echo "" ;endif; ?>
				</div>
			</div>
		</div>
		<script>
			function confirm(order_id) {
				layer.msg('确认收货？', {
					time: 0,
					btn: ['确定', '取消'],
					yes: function(index) {
						layer.close(index);
						$.ajax({
							type: "post",
							url: "<?php echo url('Order/confirm'); ?>",
							data: {
								order_id: order_id
							},
							success: function(msg) {
								if (msg.success) {
									layer.msg(msg.text);
								} else {
									layer.msg(msg.text);
								}
							}
						});
					}
				});

			}

			//默认
			function getUrlParam(name) {
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
				var r = window.location.search.substr(1).match(reg);
				if (r != null) {
					return unescape(r[2]);
				} else {
					return null
				};
			};
			var type = getUrlParam('type');
			$('.zjzz-buylist-m1').eq(type).show().siblings().hide();
			$('.zjzz-buylist-tp1 i').eq(type).addClass('zjzz-buylist-tp2');


			//评论&待评论选项卡
			function setTab2(name, cursel, n) {
				for (i = 1; i <= n; i++) {
					var menu = document.getElementById(name + i);
					var con = document.getElementById("con_" + name + "_" + i);
					menu.className = i == cursel ? "zjzz-buylist-mt2" : "";
					con.style.display = i == cursel ? "block" : "none";
				}
			};

			//选项卡
			$('.zjzz-buylist-tp1').click(function() {
				var idx = $(this).index();
				$('.zjzz-buylist-m1').eq(idx).show().siblings().hide();

				var len = $('.t-t').length;
				for (var o = 0; o < len; o++) {
					if (o == idx) {
						$('.t-t').eq(o).addClass('zjzz-buylist-tp2');
					} else {
						$('.t-t').eq(o).removeClass('zjzz-buylist-tp2');
					}
				}
			});
		</script>
	</body>
</html>
