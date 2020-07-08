<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:45:"./themes/default/index/setting\set_phone.html";i:1562841827;}*/ ?>
<!DOCTYPE html>
<html>
	<head>
		<title>修改手机号</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
		<meta name="viewport" id="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no" />
		<link href="/public/static/css/reset.css" rel="stylesheet" type="text/css">
		<link href="/public/static/css/personal-center.css" rel="stylesheet" type="text/css">
	</head>
	</head>
	<body>
		<div class="near-box" style="margin-top: 45px;">
			<div class="index-bigbox" style="margin-top: 0px;">
				<!--头部开始-->
				<div class="header">
					<a href="javascript:;" onclick="history.go(-1)" class="left"></a>
					修改手机号
				</div>
				<!--头部结束-->

				<!--功能分类开始-->
				<div class="personal-box5" style="background-image: none;">
					<input id="old_phone" name="old_phone" type="number" placeholder="当前手机号码" />
				</div>
				<div class="personal-box5" style="background-image: none;">
					<input id="new_phone" name="new_phone" type="number" placeholder="新手机号码" />
				</div>
				<div class="personal-box5" style="background-image: none;">
					<input name="captcha" id="captcha" type="text" placeholder="请输入验证码" />
					<div style="float:right; text-decoration:underline;width: 35%;height: 100%;">
						<img style="width: 100%;height: 100%;" src="<?php echo captcha_src(); ?>" class="verify" onclick="javascript:this.src='<?php echo captcha_src(); ?>?rand='+Math.random()">
					</div>
				</div>
				<span onclick="sub()" class="personal-box5-text2">提 交</span>
			</div>
		</div>
	</body>
	<script src="/public/static/js/jquery-1.8.3.min.js"></script>
	<script src="/public/static/js/layer/layer.js"></script>
	<script>
		function sub() {
			var old_phone = $('#old_phone').val();
			var new_phone = $("#new_phone").val();
			var captcha = $('#captcha').val();

			if (old_phone == '') {
				layer.msg('当前手机号不能为空');
				return false;
			}
			if (new_phone == '') {
				layer.msg('请输入新手机号');
				return false;
			}
			if (captcha == '') {
				layer.msg('验证码不能为空');
				return false;
			}

			$.ajax({
				url: "<?php echo url('Setting/setPhone'); ?>",
				type: 'POST',
				data: {
					old_phone: old_phone,
					new_phone: new_phone,
					captcha: captcha
				},
				success: function(msg) {
					if (msg.success) {
						layer.msg(msg.text);
					} else {
						layer.msg(msg.text);
					}
				}
			})
		}
	</script>

</html>
