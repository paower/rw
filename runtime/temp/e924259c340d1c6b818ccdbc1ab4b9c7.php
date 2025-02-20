<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:44:"./themes/default/index/setting\bankcard.html";i:1563022024;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0 ,maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta content="telephone=no" name="format-detection" />
<script>
(function (doc, win) {
        var docEl = doc.documentElement,
            resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
            recalc = function () {
                var clientWidth = docEl.clientWidth;
                if (!clientWidth) return;
                if(clientWidth>=750){
                    docEl.style.fontSize = '100px';
                }else{
                    docEl.style.fontSize = 100 * (clientWidth / 750) + 'px';
                }
            };

        if (!doc.addEventListener) return;
        win.addEventListener(resizeEvt, recalc, false);
        doc.addEventListener('DOMContentLoaded', recalc, false);
    })(document, window);
</script>
<link href="/public/static/css/bank.css" rel="stylesheet" type="text/css">
<script src="/public/static/js/jquery-1.8.3.min.js"></script>
<script src="/public/static/js/layer/layer.js"></script>
<title>绑定银行卡</title>
</head>

<body>
<header>
    <a href="javascript:;" onclick="history.go(-1)" ><img src="/public/static/picture/left.png"></a>
    <div class="title">银行卡</div>
</header>
<div class="bank_content">
	<?php if(is_array($user_bank) || $user_bank instanceof \think\Collection || $user_bank instanceof \think\Paginator): $index = 0; $__LIST__ = $user_bank;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($index % 2 );++$index;?>
		<div class="card">
	    	<div class="card_number">
	        	<img class="img-responsive" src="/public/static/picture/yinhang.png">
	            <div class="txt0">
	            	<span><?php echo $item['bank_name']; ?> <?php echo $item['bank_name2']; ?> <?php echo $item['bank_user']; ?></span>
	            	<?php if($item['default'] == 1): ?>
	            		<span class="qrdd-a1-t2">默认</span>
	            	<?php endif; ?>
	            	<br><?php echo $item['bank_num']; ?>
	            </div>
	        </div>
	    </div>
	<?php endforeach; endif; else: echo "" ;endif; ?>
    <div  class="click_pop"><a href="javascript:void(0)">添加账号</a></div>
    <!--弹出框-->
    <div class="pop">
        <div class="pop-top">
            添加账号
            <span class="pop-close"></span>
        </div>
        <div class="pop-content">
            <form role="form">
            	<div class="form-group">
                    <label class="col-sm-3">持卡人姓名</label>
                    <div class="col-sm-9">
                        <input class="form-control pop_input" id="bank_user" name="bank_user" type="text" >
                    </div>
                </div>
				<div class="form-group">
                    <label class="col-sm-3">开户银行</label>
                    <div class="col-sm-9">
                        <input class="form-control pop_input" id="bank_name" name="bank_name" type="text" >
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3">银行卡号</label>
                    <div class="col-sm-9">
                        <input class="form-control pop_input" id="bank_num" name="bank_num" type="number" >
                    </div>
                </div>
				<div class="form-group">
                    <label class="col-sm-3">开户支行</label>
                    <div class="col-sm-9">
                        <input class="form-control pop_input" id="bank_name2" name="bank_name2" type="text" >
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3">是否默认</label>
                    <div class="col-sm-9 whether">
                        <input class="pop_radio" name="default" value="1" type="radio">是
                        <input class="pop_radio" name="default" value="0" type="radio" checked="checked">否
                    </div>
                </div>
            </form>
        </div>
        <div class="pop-foot">
            <input onclick="sub()" type="button" value="提 交" class="pop-ok"/>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('.pop-close').click(function () {
                $('.bgPop,.pop').hide();
            });
            $('.click_pop').click(function () {
                $('.bgPop,.pop').show();
            });
        })
        
        function sub(){
        	var bank_user = $('#bank_user').val();
        	var bank_name = $('#bank_name').val();
        	var bank_num = $('#bank_num').val();
        	var bank_name2 = $('#bank_name2').val();
        	var Default = $("input[name='default']:checked").val();
        	if(bank_user == ''){
        		layer.msg('请输入开户人姓名');
        		return false;
        	}
        	if(bank_name == ''){
        		layer.msg('请输入开户银行');
        		return false;
        	}
        	if(bank_num == ''){
        		layer.msg('请输入银行卡号');
        		return false;
        	}
        	if(bank_name2 == ''){
        		layer.msg('请输入开户支行');
        		return false;
        	}
        	$.ajax({
				url: "<?php echo url('Setting/bankcard'); ?>",
				type: 'POST',
				data: {bank_user:bank_user,bank_name:bank_name,bank_num:bank_num,bank_name2:bank_name2,Default:Default},
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
</div>
</body>
</html>
