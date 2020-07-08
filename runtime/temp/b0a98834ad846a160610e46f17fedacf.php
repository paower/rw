<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:40:"./themes/default/index/order\refund.html";i:1562841102;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<meta name="viewport" id="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no"/>
<link href="/public/static/css/pj.css" rel="stylesheet" type="text/css">
<link href="/public/static/css/reset.css" rel="stylesheet" type="text/css">
<link href="/public/static/css/indent-details.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="near-box">
    <div class="header">
		<a href="javascript:;" onclick="history.go(-1)" class="left"></a>
		退款申请
	</div>
    <div class="jd-qrdd-bigbox">
        <div class="zjzz-buylist-goods1">
        	<input type="hidden" name="order_id" id="order_id" value="<?php echo \think\Request::instance()->param('id'); ?>" />
            <div class="zjzz-buylist-gtime">
                <span class="zjzz-buylist-gtime1">订单号：<?php echo $order['order_num_alias']; ?></span>
            </div>
            <?php if(is_array($order['goods_list']) || $order['goods_list'] instanceof \think\Collection || $order['goods_list'] instanceof \think\Paginator): $index = 0; $__LIST__ = $order['goods_list'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($index % 2 );++$index;?>
	            <div class="zjzz-buylist-det">
	                <img src="/public/uploads/<?php echo $item['image']; ?>"/>
	                <div class="zjzz-buylist-gdetail">
	                	<div>
		                    <span class="zjzz-buylist-gtit1"><?php echo $item['name']; ?></span>
		                    <span class="zjzz-buylist-gmoney">
		                        <i class="zjzz-buylist-gm1">￥<?php echo $item['price']; ?></i>
		                        <i class="zjzz-buylist-gm2">x<?php echo $item['num']; ?></i>
		                    </span>
	                    </div>
	                    <p class="zjzz-buylist-gm2">
	                    	<?php if(is_array($item['attribute_value']) || $item['attribute_value'] instanceof \think\Collection || $item['attribute_value'] instanceof \think\Paginator): $index2 = 0; $__LIST__ = $item['attribute_value'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item2): $mod = ($index2 % 2 );++$index2;?>
	                    		<?php echo $item2['name']; ?>：<?php echo $item2['value_name']; endforeach; endif; else: echo "" ;endif; ?>
	                    </p>
	                </div>
	            </div>
	        <?php endforeach; endif; else: echo "" ;endif; ?>
        </div>
       	<div class="tb-pj-a2">
       	  <textarea id="refund_content" placeholder="请在此说明您要退款的理由..." class="tbpj-a2-input"></textarea>
       	</div>
        <div class="serve-type-box1">
	       	<span class="serve-type-text2">上传图片：</span>
	      	<span class="serve-type-img2">
	       	   	<input onchange="uploads_img()" id="refund_image" type="file" name="refund_image" class="serve-type-btn1">
	          	<i class="serve-type-img3"></i>
	           	<i class="serve-type-text3">上传图片(最多一张)</i>
	       	</span>
	        <span id="img_box" class="serve-type-img2" style="display: none;">
	        	<img src="" style="height: 100%;width: 100%;position: absolute;top: 0;left: 0;" />
	        </span>
        </div>
       <a href="javascript:;" onclick="sub()" class="tb-pj-c1">提交申请</a>
    </div>
</div>
</body>
<script src="/public/static/js/jquery-1.8.3.min.js"></script>
<script src="/public/static/js/layer/layer.js"></script>
<script>
	function sub(){
		var refund_image = $("#refund_image").prop('files');
		var order_id = $('#order_id').val();
		var refund_content = $('#refund_content').val();
		if(refund_content.length <= 0){
			layer.msg('请填写退款理由！');
			return false;
		}
		if(order_id == ""){
			layer.msg('订单出错！');
			return false;
		}
		if(refund_image.length == 0){
			layer.msg('请选择文件');
			return false;
		}
		var formdata = new FormData();
	    formdata.append("refund_image", refund_image[0]);
	    formdata.append("order_id",order_id);
	    formdata.append("refund_content",refund_content);
		$.ajax({
			url: "<?php echo url('Order/refund'); ?>",
			type: 'POST',
			data: formdata,
			cache:false,
			contentType:false,
			processData:false,
			success:function (msg) {
				if (msg.success) {
					layer.msg(msg.text);
				} else {
					layer.msg(msg.text);
				}
			}
	   	}) 
	}
	function uploads_img(){
		var file = $("#refund_image").prop('files');
		//		console.log(file);
		var Url = getObjectURL(file[0]);
		if(Url){
			$('#img_box img').attr("src",Url);
			$('#img_box').show();
		}
	}
	
	function getObjectURL(file) {
		var url = null ;
		if(window.createObjectURL!=undefined){
			url = window.createObjectURL(file) ;
		}else if(window.URL!=undefined){
			url = window.URL.createObjectURL(file) ;
		}else if(window.webkitURL!=undefined){ 
			url = window.webkitURL.createObjectURL(file) ;
		}
		return url ;
	}
</script>
</html>