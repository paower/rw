<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:39:"./themes/default/index/user\wallet.html";i:1562901728;}*/ ?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>我的余额</title>
        <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport"/>
        <meta content="yes" name="apple-mobile-web-app-capable"/>
        <meta content="black" name="apple-mobile-web-app-status-bar-style"/>
        <meta content="telephone=no" name="format-detection"/>
        <link href="/public/static/css/balance.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <section class="aui-flexView">
            <header class="aui-navBar aui-navBar-fixed">
                <a href="javascript:;" onclick="history.go(-1)" class="aui-navBar-item">
                    <i class="icon icon-return"></i>
                </a>
                <div class="aui-center">
                    <span class="aui-center-title"></span>
                </div>
            </header>
            <section class="aui-scrollView">
                <div class="aui-line-box">
                    <div class="aui-line-circle">
                        <h2>余额资产</h2>
                        <p>
                            <em>￥<?php echo number_format($total,2); ?></em>
                        </p>
                    </div>
                    <div class="aui-line-text">
                        <p>
                            <i class="aui-line-blue"></i>
                        	可提现余额: <em>￥<?php echo number_format($wallet['principal'],2); ?></em>
                        </p>
                        <p>
                            <i class="aui-line-orange"></i>
                        	返现积分: <em>￥<?php echo number_format($wallet['interest'],2); ?></em>
                        </p>
                    </div>
                </div>
                <div class="aui-cells">
                    <a href="<?php echo url('user/bill'); ?>" class="aui-cells-cell">
                        <div class="aui-cell-hd">
                            <h4>账单</h4>
                            <p>充值、提现明细</p>
                        </div>
                        <span class="aui-cell-fr"></span>
                    </a>
                    <a href="<?php echo url('user/profit'); ?>" class="aui-cells-cell">
                        <div class="aui-cell-hd">
                            <h4>收益</h4>
                            <p>返现明细</p>
                        </div>
                        <span class="aui-cell-fr">查看收益</span>
                    </a>
                </div>
            </section>
            <footer class="aui-footer">
                <a href="<?php echo url('user/withdrawal'); ?>" class="aui-forward">提现</a>
                <a href="<?php echo url('user/recharge'); ?>" class="aui-recharge">充值</a>
            </footer>
        </section>
    </body>
</html>
