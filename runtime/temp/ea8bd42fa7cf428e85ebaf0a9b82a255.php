<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:39:"./themes/default/index/user\profit.html";i:1562901169;}*/ ?>
<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="UTF-8">
		<title>收益</title>
		<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport" />
		<meta content="yes" name="apple-mobile-web-app-capable" />
		<meta content="black" name="apple-mobile-web-app-status-bar-style" />
		<meta content="telephone=no" name="format-detection" />
		<link href="/public/static/css/balance.css" rel="stylesheet" type="text/css" />
	</head>

	<body>
		<section class="aui-flexView">
			<section class="aui-scrollView">
				<header class="aui-navBar aui-navBar-fixed">
					<a href="javascript:;" onclick="history.go(-1)" class="aui-navBar-item">
						<i class="icon icon-return"></i>

					</a>
					<span class="billhead_title">收益</span>
				</header>
				<?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $index = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($index % 2 );++$index;?>
					<div class="aui-cells">
						<a href="javascript:;" class="aui-cells-cell">
							<div class="aui-cell-hd">
								<h4>购物返还</h4>
								<?php if($item['complete_time'] != ''): ?>
									<p><?php echo date("Y-m-d",$item['complete_time']); ?></p>
								<?php else: ?>
									<p><?php echo date("Y-m-d",$item['creation_time']); ?></p>
								<?php endif; ?>
							</div>
							<div>
								<p>+<?php echo $item['price']; ?></p>
								<p class="p_text">
									<?php if($item['state'] == 1): ?>
										发放中
									<?php elseif($item['state'] == 2): ?>
										已发放
									<?php endif; ?>
								</p>
							</div>
						</a>
					</div>
				<?php endforeach; endif; else: echo "" ;endif; ?>
			</section>
		</section>
	</body>

</html>