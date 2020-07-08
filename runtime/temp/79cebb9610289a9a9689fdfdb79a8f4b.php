<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:39:"./themes/default/index/login\login.html";i:1573185033;}*/ ?>
<!DOCTYPE html>
<html>
	<head>
		<title>登录</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
		<meta name="viewport" id="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no" />
		<link href="/public/static/css/reset.css" rel="stylesheet" type="text/css">
		<link href="/public/static/css/personal-center.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/public/static/js/jquery-1.8.3.min.js"></script>
		<script src="/public/static/js/layer/layer.js"></script>
	</head>
	</head>
	<body>
		<div class="near-box">
			<div class="index-bigbox" style="margin-top: 0px;">
				<!--头部开始-->
				<div class="personal-top">
					
					<div class="personal-top-box1">
						<div class="personal-top-box3">
							<span class="personal-top-text1">登录账户</span>
						</div>
					</div>
				</div>
				<!--头部结束-->

				<div class="personal-box5" style="background: none;">
					<span class="personal-box5-img1"><img src="/public/static/images/usericon.png" alt=""></span>
					<input id="user_phone" name="user_phone" type="text" placeholder="请输入账号" />
				</div>
				<div class="personal-box5" style="background: none;">
					<span class="personal-box5-img1"><img src="/public/static/images/passwicon.png" alt=""></span>
					<input id="user_pass" name="user_pass" type="password" placeholder="请输入密码" />
				</div>
				<div class="personal-box5" style="background: none;">
					<span class="personal-box5-img1"><img src="/public/static/images/codeicon.png" alt=""></span>
					<input name="captcha" style="width: 50%;float: left; margin-top: 15px;" id="captcha" type="text" placeholder="请输入验证码" />
					<div style="float:right; text-decoration:underline;width: 35%;height: 100%;">
						<img style="width: 100%;height: 100%;" src="<?php echo captcha_src(); ?>" class="verify" onclick="javascript:this.src='<?php echo captcha_src(); ?>?rand='+Math.random()">
					</div>
				</div>

				<div style="width: 100%;float: left;">
					<input onclick="sub()" class="personal-box5-text2" type="button" name="sub" value="登 录"></input>
				</div>

				<div style="clear: both;"></div>
				<div class="bott_box"><a href="<?php echo url('login/register'); ?>" class="">注册</a> / <a href="<?php echo url('login/retrieve'); ?>" class="">忘记密码？</a></div>
			</div>
			<!--bigbox结束-->
		</div>
	</body>
	<script>
		function sub() {
			var user_phone = $('#user_phone').val();
			var user_pass = $('#user_pass').val();
			var captcha = $('#captcha').val();
			if (user_phone == '') {
				layer.msg('请输入手机号');
				return false;
			}
			if (user_pass == '') {
				layer.msg('请输入密码');
				return false;
			}
			if (captcha == '') {
				layer.msg('请输入验证码');
				return false;
			}

			$.ajax({
				url: "<?php echo url('Login/login'); ?>",
				type: 'POST',
				data: {
					user_phone: user_phone,
					user_pass: user_pass,
					captcha: captcha
				},
				success: function(msg) {
					if (msg.success) {
						layer.load(1);
						setTimeout(function() {
							layer.closeAll('loading');
						}, 2000);
						location.href = "<?php echo url('index/pcenter'); ?>";
					} else {
						layer.msg(msg.text);
					}
				}
			})

		}
	</script>
</html>
