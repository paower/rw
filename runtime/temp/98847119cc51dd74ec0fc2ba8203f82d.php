<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:41:"./themes/default/index/user\recharge.html";i:1563022514;}*/ ?>
<!DOCTYPE html>
<html>

	<head>
		<title>充值</title>
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
					充值
				</div>
				<!--头部结束-->

				<!--功能分类开始-->
				<div class="personal-box5" style="background-image: none;">
					<input id="price" type="number" name="price" placeholder="输入充值金额" />
				</div>
				<div class="personal-box5" style="background-image: none;">
					<input id="pay_password" type="password" name="pay_password" placeholder="输入安全密码" />
				</div>
				<div class="uploadimg" style="float: left;">
					<div style="position: relative;">
						<input onchange="FirstImg()" name="firstImg" style="opacity:0;position:absolute" type="file" id="FirstfileImg" multiple="">
						<span> 点击上传凭证</span>
					</div>
						<!--<img src="/public/static/images/upload.png" />-->
					<fieldset style="width:20%;">
					    <legend>图片预览</legend>
					    <div style="position: relative;" id="ccc">
					    </div>
					</fieldset>
					<input type="hidden" id="voucher" name="voucher"/>
				</div>
				<span onclick="sub()" class="personal-box5-text2">提 交</span>
			</div>
			<div class="explain">
				<ul>
					<li><b>1、</b>输入充值金额;</li>
					<li><b>2、</b>给以下账户付款：</li>
					<li>开户银行【<?php echo $bank_name; ?>】</li>
					<li>开户支行【<?php echo $bank_name2; ?>】</li>
					<li>开户姓名【<?php echo $bank_user; ?>】</li>
					<li>银行卡号【<?php echo $bank_num; ?>】</li>
					<li><b>3、</b>转账成功后，点击提交，等待后台审核！</li>
				</ul>
			</div>
		</div>
	</body>
<script src="/public/static/js/jquery-1.8.3.min.js"></script>
<script src="/public/static/js/layer/layer.js"></script>
<script>
	
function sub(){
	var price = $('#price').val();
	var file = $("#FirstfileImg").prop('files');
	var pay_password = $('#pay_password').val();
	//console.log(file[0]);return false;
	if(pay_password == ''){
		layer.msg('请输入安全密码');
	 	return false;
	}
	if(price == ''){
		layer.msg('请输入充值金额');
	 	return false;
	}
	if(file.length == 0){
		layer.msg('请选择文件');
		return false;
	}
	var formdata = new FormData();
    formdata.append("img", file[0]);
    formdata.append("price",price);
    formdata.append("pay_password",pay_password);
  	$.ajax({
		url: "<?php echo url('User/recharge'); ?>",
		type: 'POST',
		data: formdata,
		cache:false,
		contentType:false,
		processData:false,
		success:function (msg) {
			if (msg.success) {
				layer.msg(msg.text);
				history.go(-1);
			} else {
				layer.msg(msg.text);
			}
		}
   	}) 
}

	
jQuery.DuoImgsYulan = function(file, id) {
    for (var i = 0; i < 1; i++) {
        if (!/image\/\w+/.test(file[i].type)) {
            layer.msg("请选择图片文件");
            return false;
        }
        if (file[i].size > 2048 * 1024) {
            layer.msg("图片不能大于2MB");
            continue;
        }
        var img;
       // console.log(document.getElementById("fileImg"));
       // console.log(file[i]);
       // console.log("file-size=" + file[i].size);
        var reader = new FileReader();
        reader.onloadstart = function(e) {
           // console.log("开始读取....");
        }
        reader.onprogress = function(e) {
           // console.log("正在读取中....");
        }
        reader.onabort = function(e) {
            //console.log("中断读取....");
        }
        reader.onerror = function(e) {
           // console.log("读取异常....");
        }
        reader.onload = function(e) {
           // console.log("成功读取....");
            var div = document.createElement("div"); //外层 div
            div.setAttribute("style", "position:relative;width:inherit;height:inherit;float:left;z-index:2;width:150px;margin-left:8px;margin-right:8px;");
            var del = document.createElement("div"); //删除按钮div
            del.setAttribute("style", "position: absolute; top: 0px; right: 40px; z-index: 99; width: 20px; height:20px;border-radius:50%;")
            var delicon = document.createElement("img");
            delicon.setAttribute("src", "/public/static/images/remove.png");
            delicon.setAttribute("title", "删除");
            delicon.setAttribute("style", "cursor:pointer;width: 100%; height:100%");
            del.onclick = function() {
                this.parentNode.parentNode.removeChild(this.parentElement);
                ClearfirtsImg();
            };
            del.appendChild(delicon);
            div.appendChild(del);
            var imgs = document.createElement("img"); //上传的图片
            imgs.setAttribute("name", "loadimgs");
            imgs.setAttribute("src", e.target.result);
            imgs.setAttribute("width", 150);
            if (document.getElementById(id).childNodes.length > 2) {
                document.getElementById(id).removeChild(document.getElementById(id).firstChild);
            }
            div.appendChild(imgs)
            document.getElementById(id).appendChild(div);
        }
        reader.readAsDataURL(file[i]);
    }
}

function FirstImg() {
    $.DuoImgsYulan(document.getElementById("FirstfileImg").files, "ccc");
}

function ClearfirtsImg() {
    var file = $("#FirstfileImg")
    file.after(file.clone().val(""));
    file.remove();
}
</script>
</html>