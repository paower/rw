<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:37:"./themes/default/index/user\bill.html";i:1562751039;}*/ ?>
﻿<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>账单</title>
        <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport"/>
        <meta content="yes" name="apple-mobile-web-app-capable"/>
        <meta content="black" name="apple-mobile-web-app-status-bar-style"/>
        <meta content="telephone=no" name="format-detection"/>
        <link href="/public/static/css/balance.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <section class="aui-flexView">
            <section class="aui-scrollView">
			 <header class="aui-navBar aui-navBar-fixed">
                <a href="javascript:;" onclick="history.go(-1)" class="aui-navBar-item">
                    <i class="icon icon-return"></i>
                </a>
				<span class="billhead_title">账单</span>
            </header>
            	<?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $index = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($index % 2 );++$index;?>
	                <div class="aui-cells">
	                    <a href="javascript:;" class="aui-cells-cell">
	                    	<?php if($item['type'] == 1): ?>
		                        <div class="aui-cell-hd">
		                            <h4>充值</h4>
		                            <p>
		                            	<span><?php echo date("Y-m-d",$item['creation_time']); ?></span>
		                            </p>
		                        </div>
	                        	<div>
		                        	<p>+<?php echo $item['price']; ?></p>
		                        	<p class="p_text">
	                            		<?php if($item['state'] == 1): ?>
	                            			平台审核中
	                            		<?php elseif($item['state'] == 2): ?>
	                            			已完成
	                            		<?php elseif($item['state'] == 3): ?>
	                            			平台已拒绝
	                            		<?php endif; ?>
	                            	</p>
		                        </div>
	                        <?php elseif($item['type'] == 2): ?>
		                        <div class="aui-cell-hd">
		                            <h4>提现</h4>
		                            <p>
		                            	<span><?php echo date("Y-m-d",$item['creation_time']); ?></span>
		                            </p>
		                        </div>
		                       	<div>
		                        	<p>-<?php echo $item['price']; ?></p>
		                        	<p class="p_text">
	                            		<?php if($item['state'] == 1): ?>
	                            			平台审核中
	                            		<?php elseif($item['state'] == 2): ?>
	                            			已完成
	                            		<?php elseif($item['state'] == 3): ?>
	                            			平台已拒绝
	                            		<?php endif; ?>
	                            	</p>
		                        </div>
	                        <?php elseif($item['type'] == 3): ?>
	                        	<div class="aui-cell-hd">
		                            <h4>购物</h4>
		                            <p>
		                            	<span><?php echo date("Y-m-d",$item['creation_time']); ?></span>
		                            </p>
		                        </div>
		                        <div>
		                        	<p>-<?php echo $item['price']; ?></p>
		                        	<p class="p_text">
	                            		<?php if($item['state'] == 1): ?>
	                            			平台审核中
	                            		<?php elseif($item['state'] == 2): ?>
	                            			已完成
	                            		<?php elseif($item['state'] == 3): ?>
	                            			平台已拒绝
	                            		<?php endif; ?>
	                            	</p>
		                        </div>
		                    <?php elseif($item['type'] == 4): ?>
	                        	<div class="aui-cell-hd">
		                            <h4>退款</h4>
		                            <p>
		                            	<span><?php echo date("Y-m-d",$item['creation_time']); ?></span>
		                            </p>
		                        </div>
		                        <div>
		                        	<p>+<?php echo $item['price']; ?></p>
		                        	<p class="p_text">
	                            		<?php if($item['state'] == 1): ?>
	                            			平台审核中
	                            		<?php elseif($item['state'] == 2): ?>
	                            			已完成
	                            		<?php elseif($item['state'] == 3): ?>
	                            			平台已拒绝
	                            		<?php endif; ?>
	                            	</p>
		                        </div>
		                    <?php endif; ?>
	                    </a>
	                </div>
                <?php endforeach; endif; else: echo "" ;endif; ?>
            </section>
        </section>
    </body>
</html>
