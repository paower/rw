<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:42:"./themes/default/index/index\classify.html";i:1563023172;}*/ ?>
﻿<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<meta name="viewport" id="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no"/>
<link href="/public/static/css/reset.css" rel="stylesheet" type="text/css">
<link href="/public/static/css/classify.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/public/static/js/jquery-1.8.3.min.js"></script>
</head>
<body>
<div class="near-box">
	<div class="yx-index-top">
	  	 <a href="<?php echo url('search'); ?>" class="index-top-box1">
	  	 	<span class="index-top-img1"><img src="/public/static/picture/search3.png" alt=""></span>
	  	 </a>
	  </div>
	<div class="classify-bigbox">
	    <div class="classify-left">
	    	<div class="classify-perch"></div>
	    	<?php if(is_array($categoryParent) || $categoryParent instanceof \think\Collection || $categoryParent instanceof \think\Paginator): $index = 0; $__LIST__ = $categoryParent;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$data): $mod = ($index % 2 );++$index;?>
	    		<span class="classify-text1 <?php if($index == 1): ?>pitch-on2<?php endif; ?> "><?php echo $data['name']; ?></span>
	    	<?php endforeach; endif; else: echo "" ;endif; ?>
	    	<div class="classify-perch2"></div>
	    </div>
	    <?php if(is_array($categoryParent) || $categoryParent instanceof \think\Collection || $categoryParent instanceof \think\Paginator): $index = 0; $__LIST__ = $categoryParent;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$data): $mod = ($index % 2 );++$index;?>
		    <div class="classify-right content2">
		    	<div class="classify-perch-r"></div>
		    	<div class="classify-right-title">
		    		<span class="classifyrt-text1">综合排序</span>
		    		<span class="classifyrt-text1 price">按价格<i class="sort-img"></i><i class="sort-img2" style="display: none;"></i></span>
		    		<span class="classifyrt-text1 list-show">分类</span>
		    	</div>
		    	<div class="classify-list" style="display: none;">
		    		<span val="all" class="classify-list-text1 pitch-on-cl">全部分类</span>
		    		<?php if(is_array($categorySub[$data['id']]) || $categorySub[$data['id']] instanceof \think\Collection || $categorySub[$data['id']] instanceof \think\Paginator): $index2 = 0; $__LIST__ = $categorySub[$data['id']];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$data2): $mod = ($index2 % 2 );++$index2;?>
	    				<span val="<?php echo $data2['id']; ?>" class="classify-list-text1"><?php echo $data2['name']; ?></span>
		    		<?php endforeach; endif; else: echo "" ;endif; ?>
		    	</div>
		    	<div class="goodsList_box">
			    	<!--商品列表循环-->
			    	<?php if(is_array($goodsList) || $goodsList instanceof \think\Collection || $goodsList instanceof \think\Paginator): $serial = 0; $__LIST__ = $goodsList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$goods): $mod = ($serial % 2 );++$serial;if($data['id'] == $goods['category_id']): ?>
				            <div class="classify-box1">
				            	<a href="<?php echo url('goods/details',['id'=>$goods['goods_id']]); ?>" class="classify-box1-img1"><img src="/public/uploads/<?php echo $goods['image']; ?>" alt=""></a>
				            	<div class="classify-box2">
				            		<a href="<?php echo url('goods/details',['id'=>$goods['goods_id']]); ?>" class="classify-box2-text1"><?php echo $goods['name']; ?></a>
				            		<span class="classify-box2-text2">￥<?php echo $goods['price']; ?></span>
				            	</div>
				            </div>
				        <?php endif; endforeach; endif; else: echo "" ;endif; ?>
			    	<!--商品列表循环-->
		    	</div>
		    	<div class="classify-perch2"></div>
		    </div>
		<?php endforeach; endif; else: echo "" ;endif; ?>
	</div>
	<div class="kaola-bottom">
		<a href="<?php echo url('index'); ?>" class="kaola-bottom-box1">
			<span class="kaola-bottom-img1"><img src="/public/static/picture/home2.png"></span>
			<span class="kaola-bottom-text1">首页</span>
		</a>
		<a href="<?php echo url('classify'); ?>" class="kaola-bottom-box1">
			<span class="kaola-bottom-img1"><img src="/public/static/picture/classification1.png"></span>
			<span class="kaola-bottom-text1 text2">分类</span>
		</a>
		<a href="<?php echo url('shpcart'); ?>" class="kaola-bottom-box1">
			<span class="kaola-bottom-img1"><img src="/public/static/picture/shop-cart1.png"></span>
			<span class="kaola-bottom-text1 ">购物车</span>
		</a>
		<a href="<?php echo url('pcenter'); ?>" class="kaola-bottom-box1">
			<span class="kaola-bottom-img1"><img src="/public/static/picture/people1.png"></span>
			<span class="kaola-bottom-text1">我的</span>
		</a>
	</div>
</div>
<script type="text/javascript">
	function switab(tab,con,tab_c_css,tab_n_css,no) {  
    $(tab).each(function(i){  
        if(i == no)  
        {  
            $(this).addClass(tab_c_css);  
        }else  
        {  
            $(this).removeClass(tab_c_css);  
            $(this).addClass(tab_n_css);  
        }  
    })  
    if (con)  
    {  
        $(con).each(function(i){  
            if(i == no)  
            {  
                $(this).show();  
            }else  
            {  
                $(this).hide();  
            }  
        })  
    }  
}  
$(document).ready(function(){
    $(".classify-text1").each(function(i){
        $(this).click(function(){
            switab('.classify-text1','.content2','pitch-on2','',i);        
        })
    });
});

$('.classify-list-text1').click(function(){
	$(this).addClass('pitch-on-cl').siblings().removeClass('pitch-on-cl');
	var data = $(this).attr("val");
})

$(".price").click(function () {
        $(this).children(".sort-img").hide();
        $(this).children(".sort-img2").show();
        $(this).children(".sort-img2").toggleClass("img3");
	});
$(".classifyrt-text1").click(function () {
        $(this).addClass("tcolor-yellow");
        $(this).siblings(".classifyrt-text1").removeClass("tcolor-yellow");
	});
$(".list-show").click(function () {
        $(this).parent(".classify-right-title").next(".classify-list").slideToggle();
	});

$(".shop-cart-add").click(function() {
    var multi = 0;
    var vall = $(this).prev().val();
    vall++;
    $(this).prev().val(vall);
    TotalPrice();
});
$(".shop-cart-subtract").click(function() {
    var multi = 0;
    var vall = $(this).next().val();
    vall--;
    if(vall <= 0) {
        vall = 0;
    }
    $(this).next().val(vall);
    TotalPrice();
});

</script>
</body>
</html>