<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:43:"./themes/default/index/user\invitation.html";i:1562842211;}*/ ?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="apple-touch-fullscreen" content="yes">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta name="format-detection" content="telephone=no">
	<meta name="author" content="AUI, a-ui.com">
	<title>邀请好友</title>
	<link rel="stylesheet" type="text/css" href="/public/static/css/Invitation.css">
	<script type="text/javascript" src="/public/static/js/jquery-1.8.3.min.js"></script>
	
</head>
<body>
<header class="ui-header ui-header-positive ui-border-b">
	<i class="ui-icon-return" onclick="history.back()"></i>
	<h1>邀请好友</h1>
</header>
<div class="in-body">
	<div id="in-self" class="in-self"></div>
	<!-- header begin -->
	<header id="header">
		<div class="in-header">
			<?php if($user['user_photo'] == ''): ?>
				<img src="/public/static/images/usericon.png" alt="">
			<?php else: ?>
				<img src="/public/uploads/<?php echo $user['user_photo']; ?>" alt="">
			<?php endif; ?>
		</div>
		<div class="in-button-box">
			<div id="target" style="opacity:0;"><?php echo $qrData; ?></div>
			<div data-clipboard-action="copy" data-clipboard-target="#target" id="copy_btn" class="in-button">
				<img src="/public/static/picture/icon-btn.png" alt="">
			</div>
		</div>
		<div class="in-code" onclick="Ceng()">
			<img src="/public/static/picture/ewm.png" alt="">
		</div>
		<!-- pop begin -->
		<div id="ceng" class="in-cen"></div>
		<div id="close" class="in-pop">
			<div class="in-self-info">
				<img class="codeimg" src="/<?php echo $pic; ?>" />
				<a onclick="closeCeng()">
					<img src="/public/static/picture/icon-close.png" alt="">
				</a>
				<div class="in-pop-text">
					<p>您的专属邀请二维码</p>
					<p>长按可保存</p>
				</div>
			</div>
		</div>
		<!-- pop end -->
	</header>
	<!-- header end -->
	<!-- content begin -->
	<section id="content">
		<div class="in-content">
			<div class="in-content-line"></div>
			<div class="in-content-box">
				<div class="in-content-title">
					<h2>- 邀请列表 -</h2>
					<div class="in-line-left">
						<img src="/public/static/picture/icon-line.png" alt="">
					</div>
					<div class="in-line-right">
						<img src="/public/static/picture/icon-line.png" alt="">
					</div>
				</div>
				<div class="in-content-links">
					<a href="page.html">
						<div class="in-content-hd">
							<?php if($user['user_photo'] == ''): ?>
								<img src="/public/static/images/usericon.png" alt="">
							<?php else: ?>
								<img src="/public/uploads/<?php echo $user['user_photo']; ?>" alt="">
							<?php endif; ?>
						</div>
						<div class="in-content-bd">
							<p><?php echo $user['user_name']; ?></p>
						</div>
						<div class="in-content-ft">
							<p>
								已邀请 <em><?php echo $user['invitation_num']; ?></em>
								人
							</p>
						</div>
					</a>
					<div class="in-line-left in-content-left">
						<img src="/public/static/picture/icon-line.png" alt="">
					</div>
					<div class="in-line-right in-content-right">
						<img src="/public/static/picture/icon-line.png" alt="">
					</div>
				</div>
				<div class="in-content-fellow">
					<?php if(is_array($user['invitation_user']) || $user['invitation_user'] instanceof \think\Collection || $user['invitation_user'] instanceof \think\Paginator): $index = 0; $__LIST__ = $user['invitation_user'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($index % 2 );++$index;?>
						<div class="in-fellow-well">
							<div class="in-content-hd ">
								<?php if($item['user_photo'] == ''): ?>
									<img src="/public/static/images/usericon.png" alt="">
								<?php else: ?>
									<img src="/public/uploads/<?php echo $item['user_photo']; ?>" alt="">
								<?php endif; ?>
								<div class="in-red-crown"></div>
							</div>
							<div class="in-content-bd red">
								<p><?php echo $item['user_phone']; ?></p>
							</div>
							<!--<div class="in-content-ft">
								<p>
									已邀请 <em>42</em>
									人
								</p>
							</div>-->
						</div>
					<?php endforeach; endif; else: echo "" ;endif; ?>
				</div>
				<div style="height:20px;"></div>
			</div>
		</div>
	</section>
	<!-- content end -->
</div>

<script src="/public/static/js/clipboard.js/dist/clipboard.min.js"></script>
<script src="/public/static/js/layer/layer.js"></script>
<script type="text/javascript">

	var clipboard = new ClipboardJS('#copy_btn');   
    clipboard.on('success', function(e) {
        //console.log(e);
        layer.msg('复制成功');
    }); 

 
	//二维码弹窗
    function Ceng() {
        document.getElementById('ceng').style.display = 'block';
        document.getElementById('close').style.display = 'block';
        return false;
    }
    function closeCeng() {
        document.getElementById('ceng').style.display = 'none';
        document.getElementById('close').style.display = 'none';
        return false;

    }
</script>
</body>
</html>
