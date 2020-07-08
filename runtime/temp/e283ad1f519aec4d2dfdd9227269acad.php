<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:45:"./themes/default/index/setting\set_login.html";i:1562841896;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<title>登录密码</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<meta name="viewport" id="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no"/>
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
				登录密码
			</div>
          <!--头部结束--> 
          
          <!--功能分类开始-->
          <div class="personal-box5" style="background-image: none;">
          	  <input id="old_password" name="old_password" type="password" placeholder="输入当前密码" />
          </div>
          <div class="personal-box5" style="background-image: none;">
          	  <input id="new_password" name="new_password" type="password" placeholder="新登录密码" />
          </div>
		  <div class="personal-box5" style="background-image: none;">
          	  <input id="new_password2" name="new_password2" type="password" placeholder="确认新密码" />
          </div>
          <span onclick="sub()" class="personal-box5-text2">提 交</span>
      </div>
</div>
</body>
<script src="/public/static/js/jquery-1.8.3.min.js"></script>
<script src="/public/static/js/layer/layer.js"></script>
<script>
	function sub(){
		var old_password = $('#old_password').val();
		var new_password = $("#new_password").val();
		var new_password2 = $('#new_password2').val();
		
		if(old_password == ''){
			layer.msg('旧密码不能为空');
			return false;
		}
		if(new_password == ''){
			layer.msg('请输入新密码');
			return false;
		}
		if(new_password2 == ''){
			layer.msg('请输入确认密码');
			return false;
		}
		
		$.ajax({
			url: "<?php echo url('Setting/setLogin'); ?>",
			type: 'POST',
			data: {old_password:old_password,new_password:new_password,new_password2:new_password2},
			success:function (msg) {
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