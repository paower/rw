<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:40:"./themes/default/index/user\address.html";i:1562927902;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<meta name="viewport" id="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no"/>
<link href="/public/static/css/reset.css" rel="stylesheet" type="text/css">
<link href="/public/static/css/receiving-adress.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="near-box">
	<div class="header">
		<a href="javascript:;" onclick="history.go(-1)" class="left"></a>
		收货地址
	</div>
	<div class="bigbox">
		<?php if(is_array($address) || $address instanceof \think\Collection || $address instanceof \think\Paginator): $index = 0; $__LIST__ = $address;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($index % 2 );++$index;?>
			<div class="sh-adress-box1">
				<a href="<?php echo url('user/setaddress',['id'=>$item['address_id']]); ?>" class="sh-adress-box2">
				 	<span class="sh-adress-text1"><?php echo $item['name']; ?></span>
				 	<span class="sh-adress-text1 text-r"><?php echo $item['telephone']; ?></span>
				 	<span class="sh-adress-text2"><?php echo get_area_name($item['province_id']); ?> <?php echo get_area_name($item['city_id']); ?> <?php echo get_area_name($item['country_id']); ?> <?php echo $item['address']; ?></span>
				</a>
				<div class="sh-adress-box3">
					<div class="sh-adress-text3 <?php if($item['default'] == 2): ?>img2<?php endif; ?>">默认地址</div>
					<div onclick="del(<?php echo $item['address_id']; ?>)" class="sh-adress-text4">删除</div>
				</div>
			</div>
		<?php endforeach; endif; else: echo "" ;endif; ?>
         <a href="<?php echo url('user/setaddress'); ?>" class="set-text1">添加新地址</a>
		 <!--确认删除弹层-->
		<!-- <div class="delete-layer-bg" style="display: none;"></div>
		 <div class="delete-layer" style="display: none;">
	         <div class="active-a2">确认后地址将被删除！</div>
	         <div class="active-a3">
	        	<span class="other2 other1">取消</span>
	        	<span class="other2" id="deletebox">确定</span>
	        	<div class="active-a3-x1"></div>
	         </div>
		 </div> -->
	</div>

</div>
<script type="text/javascript" src="/public/static/js/jquery-1.8.3.min.js"></script>
<script src="/public/static/js/layer/layer.js"></script>
<script type="text/javascript">
	function del(id){
		layer.msg('确认后地址将被删除', {
			time: 0 ,
			btn: ['确认', '取消'],
			yes: function(index){
				$.post(
					"<?php echo url('User/deladdress'); ?>",
					{
						address_id:id
					},
					function(msg){
						if (msg.success) {
							layer.msg(msg.text);
							setTimeout('url()',1000);
						} else {
							layer.msg(msg.text);
						}
					}
				);
			}
		});
	}
	function url(){
		location.reload();
	}
	
	var that;
//	$(".sh-adress-text3").click(function () {
//		 $(this).toggleClass("img2");
//		 $(this).parent(".sh-adress-box3").parent(".sh-adress-box1").siblings(".sh-adress-box1")
//		 .find(".sh-adress-text3").removeClass("img2");
//	});
	
	// $(".sh-adress-text4").click(function () {
	// 	 $(".delete-layer-bg").show();
	// 	 $(".delete-layer").show();
	// 	 $("body").addClass("ovflowhide");
	// 	 that = $(this);
	// });
	$(".delete-layer-bg").click(function () {
		 $(".delete-layer-bg").hide();
		 $(".delete-layer").hide();
		 $("body").removeClass("ovflowhide");
	});
	$(".other1").click(function () {
		 $(".delete-layer-bg").hide();
		 $(".delete-layer").hide();
		 $("body").removeClass("ovflowhide");
	});
	$("#deletebox").click(function () {
		 $(".delete-layer-bg").hide();
		 $(".delete-layer").hide();
		 $("body").removeClass("ovflowhide");
		 $(that).parent(".sh-adress-box3").parent(".sh-adress-box1").remove();
	});
</script>
</body>
</html>