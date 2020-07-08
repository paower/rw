<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:42:"./themes/default/index/login\retrieve.html";i:1563024082;}*/ ?>
<!DOCTYPE html>
<html>
	<head>
		<title>注册</title>
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
							<span class="personal-top-text1">找回密码</span>
						</div>
					</div>
				</div>
				<!--头部结束-->
				<div class="personal-box5" style="background: none;">
					<span class="personal-box5-img1"><img src="/public/static/images/usericon.png" alt=""></span>
					<input id="user_phone" name="user_phone" type="text" placeholder="请输入手机号" />
				</div>
				<div class="personal-box5" style="background: none;">
					<span class="personal-box5-img1"><img src="/public/static/images/passwicon.png" alt=""></span>
					<input id="user_pass" name="user_pass" type="password" placeholder="设置新密码" />
				</div>
				<div class="personal-box5" style="background: none;">
					<span class="personal-box5-img1"><img src="/public/static/images/confirm.png" alt=""></span>
					<input id="user_pass2" name="user_pass2" type="password" placeholder="确认新密码" />
				</div>
				<!--<div class="personal-box5">
			  <span class="personal-box5-img1"><img src="/public/static/images/recommend.png" alt=""></span>
			  <input type="text" placeholder="邀请人账户(非必填)" />
		  </div>-->
				<div class="personal-box5" style="background: none;">
					<span class="personal-box5-img1"><img src="/public/static/images/codeicon.png" alt=""></span>
					<input name="captcha" id="captcha" type="text" placeholder="请输入验证码" />
					<div style="float:right; text-decoration:underline;width: 35%;height: 100%;">
						<img style="width: 100%;height: 100%;" src="<?php echo captcha_src(); ?>" class="verify" onclick="javascript:this.src='<?php echo captcha_src(); ?>?rand='+Math.random()">
					</div>
				</div>
				<input onclick="sub()" type="button" name="sub" value="确认" class="personal-box5-text2" />
			</div>
			<!--bigbox结束-->
		</div>
	</body>
	<script>
		function sub() {
			var user_phone = $('#user_phone').val();
			var user_pass = $('#user_pass').val();
			var user_pass2 = $('#user_pass2').val();
			var captcha = $('#captcha').val();
			if (user_phone == '') {
				layer.msg('请输入手机号');
				return false;
			}
			if (user_pass == '') {
				layer.msg('请输入旧密码');
				return false;
			}
			if (user_pass2 == '') {
				layer.msg('请输入新密码');
				return false;
			}
			if (captcha == '') {
				layer.msg('请输入验证码');
				return false;
			}
		
			$.ajax({
				url: "<?php echo url('login/retrieve'); ?>",
				type: 'POST',
				data: {
					user_phone: user_phone,
					user_pass: user_pass,
					user_pass2: user_pass2,
					captcha: captcha
				},
				success: function(msg) {
					if (msg.success) {
						layer.load(1);
						setTimeout(function() {
							layer.closeAll('loading');
						}, 2000);
						location.href = "<?php echo url('Login/login'); ?>";
					} else {
						layer.msg(msg.text);
					}
				}
			})
		
		}
	</script>
</html>
