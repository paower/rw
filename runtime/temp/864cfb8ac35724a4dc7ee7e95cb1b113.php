<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:47:"./themes/default/member/order_backend\show.html";i:1562744941;s:34:"./shop/admin/view/public/base.html";i:1562121180;}*/ ?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title><?php echo \think\Config::get('SITE_NAME'); ?>-后台管理中心</title>

		<meta name="description" content="<?php echo \think\Config::get('SITE_NAME'); ?>" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="/public/static/js/bt/bootstrap.min.css" />
		<link rel="stylesheet" href="/public/static/view_res/admin/ace/font-awesome/4.2.0/css/font-awesome.min.css" />
		
		<!--城市选择器-->
		<!--<link rel="stylesheet" href="/public/static/css/pick-pcc.min.1.0.1.css">-->

		<!-- ace styles -->
		<link rel="stylesheet" href="/public/static/view_res/admin/ace/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="/public/static/view_res/admin/ace/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="/public/static/view_res/admin/ace/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->
		<script src="/public/static/view_res/admin/ace/js/ace-extra.min.js"></script>

		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="/public/static/view_res/admin/ace/js/html5shiv.min.js"></script>
		<script src="/public/static/view_res/admin/ace/js/respond.min.js"></script>
		<![endif]-->
		<style>
			.table thead > tr > td, .table tbody > tr > td {
			    vertical-align: middle;
			}	
			.table thead td span[data-toggle="tooltip"]:after, label.control-label span:after {
				font-family: FontAwesome;
				color: #1E91CF;
				content: "\f059";
				margin-left: 4px;
			}
		</style>
		
		
			
		
		
		
		<script src="/public/static/js/jquery/jquery-2.0.3.min.js"></script>
		<script src="/public/static/js/jquery/jquery-migrate-1.2.1.min.js"></script>
			
		
		<script src="/public/static/artDialog/artDialog.js"></script>
		<link href="/public/static/artDialog/skins/default.css" rel="stylesheet" type="text/css" />			
		
		<script>
			var filemanager_url="<?php echo url('admin/FileManager/index'); ?>";
		</script>
		<script src="/public/static/js/oscshop_common.js"></script>
	</head>

	<body class="no-skin">
		<div id="navbar" class="navbar navbar-default    navbar-collapse       h-navbar">
			<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>

			<div class="navbar-container" id="navbar-container">
				<div class="navbar-header pull-left">
					<a href="<?php echo url('admin/Index/index'); ?>" class="navbar-brand">
						<small>							
							<?php echo \think\Config::get('SITE_NAME'); ?> 后台管理
						</small>
					</a>
					<button class="pull-right navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#sidebar">
						<span class="sr-only">Toggle sidebar</span>

						<span class="icon-bar"></span>

						<span class="icon-bar"></span>

						<span class="icon-bar"></span>
					</button>
				</div>

				<div class="navbar-buttons navbar-header pull-right  collapse navbar-collapse" role="navigation">
					<ul class="nav ace-nav">

						<li class="light-blue">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								
								<span class="user-info">
									<?php echo session('user_auth.username'); ?>
								</span>

								<i class="ace-icon fa fa-caret-down"></i>
							</a>

							<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								
								<li>
									<a target="_blank" href="<?php echo \think\Request::instance()->root(true); ?>">网站前台</a>
								</li>
								
								<li>
									<a href="<?php echo url('admin/User/edit',array('id'=>session('user_auth.uid'))); ?>">修改密码</a>
								</li>
								
								<li><a href="<?php echo url('admin/Index/clear'); ?>">清空缓存</a></li>

								<li>
									<a href="<?php echo url('admin/Index/logout'); ?>">退出系统</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>

			
			</div><!-- /.navbar-container -->
		</div>

		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>
			
			<div id="sidebar" class="sidebar h-sidebar navbar-collapse collapse">
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
				</script>
				
				<ul class="nav nav-list">
					<li class="hover">
						<a target="_blank" href="<?php echo \think\Request::instance()->root(true); ?>">
							<i class="menu-icon fa fa fa-home fa-lg"></i>
							<span class="menu-text">前台 </span>
							<b class="arrow fa fa-angle-down"></b>
						</a>
						<b class="arrow"></b>
					</li>
					
					<?php if(is_array($admin_menu) || $admin_menu instanceof \think\Collection || $admin_menu instanceof \think\Paginator): $i = 0; $__LIST__ = $admin_menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$m): $mod = ($i % 2 );++$i;?>					
					<li class="hover <?php if(isset($breadcrumb1) AND ($breadcrumb1 == $m["title"])): ?> active open <?php endif; ?>">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa <?php echo $m['icon']; ?>"></i>
							<span class="menu-text"> <?php echo $m['title']; ?> </span>
							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>
						<?php if(isset($m['children'])): ?>
						<ul class="submenu">
							
							<?php if(is_array($m['children']) || $m['children'] instanceof \think\Collection || $m['children'] instanceof \think\Paginator): if( count($m['children'])==0 ) : echo "" ;else: foreach($m['children'] as $key=>$vo): ?>   
							<li class="hover">
								<a href="<?php echo \think\Request::instance()->root(true); ?>/<?php echo $vo['url']; ?>">
									<i class="menu-icon fa fa-caret-right"></i>
									<?php echo $vo['title']; if(isset($vo['children'])): ?>
										<b class="arrow fa fa-angle-down"></b>
									<?php endif; ?>
								</a>

								<b class="arrow"></b>
								
									<?php if(isset($vo['children'])): ?>
										<ul class="submenu">
											<?php if(is_array($vo['children']) || $vo['children'] instanceof \think\Collection || $vo['children'] instanceof \think\Paginator): if( count($vo['children'])==0 ) : echo "" ;else: foreach($vo['children'] as $key=>$v2): ?> 
												<li class="hover">
													<a href="<?php echo \think\Request::instance()->root(true); ?>/<?php echo $v2['url']; ?>">
														<i class="menu-icon fa fa-caret-right"></i>
														<?php echo $v2['title']; ?>
													</a>
			
													<b class="arrow"></b>
												</li> 
											<?php endforeach; endif; else: echo "" ;endif; ?> 
										</ul>	
									<?php endif; ?>
								
							</li>
							<?php endforeach; endif; else: echo "" ;endif; ?>
							
						</ul>
						<?php endif; ?>
					</li>
					<?php endforeach; endif; else: echo "" ;endif; ?>
					
				</ul><!-- /.nav-list -->

				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
				</script>
			</div>

			<div class="main-content">
				<div class="main-content-inner">
					<div class="page-content">
						
<?php use think\Db; ?>
 
	<div class="page-header">
		<h1>
			<?php echo $breadcrumb2; ?>
			<small>
				<i class="ace-icon fa fa-angle-double-right"></i>
				<?php echo $crumbs; ?>
			</small>
		</h1>
	</div>	
	<ul class="nav nav-tabs">
		
	  <li class="active"><a href="#tab-order" data-toggle="tab">订单详情</a></li>
	
	  <li><a href="#tab-shipping" data-toggle="tab">收货地址</a></li>
	 
	  <li><a href="#tab-product" data-toggle="tab">商品清单</a></li>
	  
	 <!-- <li><a href="#tab-history" data-toggle="tab">订单历史</a></li>    -->      
	  
	</ul>
	<div class="tab-content">
		<div class="tab-pane active" id="tab-order">
			<table class="table table-bordered">
				<tr>
				    <td>订单ID</td>
				    <td><?php echo $data['order']['order_id']; ?></td>
				</tr>
				<tr>
					<td>订单编号</td>
					<td><?php echo $data['order']['order_num_alias']; ?></td>
				</tr>
				 <!--<tr>
		            <td>支付方式</td>
		            <td>
		            	<?php switch($data['order']['payment_code']): case "alipay": ?>支付宝<?php break; case "weixin": ?>微信支付<?php break; case "points": ?>积分兑换<?php break; endswitch; ?>
		            </td>
		          </tr>-->
				<tr>
					<td>会员名称</td>
					<td>					
						
							<?php echo $data['order']['name']; ?>
						
					</td>
				</tr>
				<!--<tr>
				    <td>电子邮件</td>
				    <td><?php echo $data['order']['email']; ?></td>
				</tr>-->
				  <tr>
				    <td>联系电话</td>
				    <td><?php echo $data['order']['telephone']; ?></td>
				</tr> 
				<?php if($data['order']['points_order']==0){ ?>
				<tr>
				    <td>合计金额</td>
				    <td>
				    	￥<?php echo $data['order']['price']; ?>
				    </td>
				</tr>
				<!--<?php }elseif($data['order']['points_order']==1){ ?>
				<tr>
				    <td>兑换积分</td>
				    <td>
				    	<?php echo $data['order']['pay_points']; ?>
				    </td>
				</tr>	
				<?php } ?>-->
				<tr>
				    <td>订单状态</td>
				    <td id="order-status"> <?php echo get_order_status_name($data['order']['order_status_id']); ?></td>
				</tr>     
				<!--<tr>
					<td>IP地址</td>
					<td><?php echo $data['order']['ip']; ?></td>
				</tr>  -->
				<!--<tr>
					<td>用户系统</td>
					<td><?php echo $data['order']['user_agent']; ?></td>
				</tr>-->
				<tr>
					<td>下单时间</td>
					<td><?php echo date('Y/m/d H:i:s',$data['order']['creation_time']); ?></td>
				</tr>
				<!--<tr>
					<td>修改时间</td>
					<td>
						<?php if($data['order']['date_modified'] != 0): ?>
							<?php echo date('Y/m/d H:i:s',$data['order']['date_modified']); else: ?>
							无
						<?php endif; ?>
					</td>
				</tr>-->
				<?php if($data['order']['order_status_id'] == 7): ?>
				<tr>
					<td>退款理由</td>
					<td><?php echo $data['order']['refund_content']; ?></td>
				</tr>
				<tr>
					<td>退款图片</td>
					<td><img src="/public/uploads/<?php echo $data['order']['refund_image']; ?>" /></td>
				</tr>
				<?php endif; ?>
				</table>
		</div>
		
		<div class="tab-pane" id="tab-shipping">
            <table class="table table-bordered">
          <tr>
            <td>收货人姓名</td>
            <td><?php echo $data['order']['shipping_name']; ?></td>
          </tr>
                  
          <tr>
            <td>所在地</td>
            <td>
            	<?php echo get_area_name($data['order']['shipping_province_id']); ?>，
            	<?php echo get_area_name($data['order']['shipping_city_id']); ?>，
            	<?php echo get_area_name($data['order']['shipping_country_id']); ?>
            </td>
          </tr>
          
          <tr>
            <td>地址</td>
            <td><?php echo $data['order']['address']; ?></td>
          </tr>
         
         
           <!--<tr>
          	<td>货运方式</td>
          	<td><?php echo get_shipping_name($data['order']['shipping_method']); ?></td>
          </tr>-->
          <tr>
          	<td>联系电话</td>
          	<td><?php echo $data['order']['shipping_tel']; ?></td>
          </tr>
          
        </table>        
      </div>
    
    <div id="tab-product" class="tab-pane">
      	<table class="table table-bordered">
          	<thead>
	            <tr>
	            <td class="left">商品ID</td>
				<td class="left">商品名称</td>
				<td class="left">商品属性</td>
				<td class="right">数量</td>
				<td class="right">价格</td>              
				<td class="right">总计</td>
	            </tr>
          	</thead>
          
        	<tbody>
        		<?php if(is_array($goods_list) || $goods_list instanceof \think\Collection || $goods_list instanceof \think\Paginator): $index = 0; $__LIST__ = $goods_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($index % 2 );++$index;?>
		            <tr>
		            	<td class="left">
							<?php echo $item['goods_id']; ?>
			            </td>
			            <td class="left">
			              	<?php echo $item['name']; ?>
			            </td>
			            <td class="left">
			            	<?php if(is_array($item['attribute_value']) || $item['attribute_value'] instanceof \think\Collection || $item['attribute_value'] instanceof \think\Paginator): $index2 = 0; $__LIST__ = $item['attribute_value'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item2): $mod = ($index2 % 2 );++$index2;?>
			            		<?php echo $item2['name']; ?>：<?php echo $item2['value_name']; endforeach; endif; else: echo "" ;endif; ?>
			            </td>
			            <td class="right">	              	
			              	<?php echo $item['num']; ?>
			            </td>
			              
			            <td class="right">￥
			              	<?php echo $item['price']; ?>
			            </td>
			            <td class="right">￥
			           		<?php echo number_format($item['num'] * $item['price'],2); ?>
			            </td>
		            </tr>
		        <?php endforeach; endif; else: echo "" ;endif; ?>
         	</tbody>
        </table>
  
    </div>
	
	
		 <!--<div id="tab-history" class="tab-pane">
        <div id="history"></div>
        <table class="table table-bordered">
          <tr>
            <td>订单状态</td>
            <td>
              <input type="hidden" name="old_order_status_id" value="<?php echo $data['order']['order_status_id']; ?>" id="old_order_status_id" />
              <select name="order_status_id">
                <?php foreach ($data['order_statuses'] as $order_statuses) { ?>
                	
                 <option value="<?php echo $order_statuses['order_status_id']; ?>" <?php if ($order_statuses['order_status_id'] == $data['order']['order_status_id']) { echo ' selected="selected"'; }?> ><?php echo $order_statuses['name']; ?></option>
               
                <?php } ?>
              </select>
            </td>
          </tr>
          <tr>
            <td>通知会员</td>
            <td><input type="checkbox" checked="checked" name="notify" value="1" /></td>
          </tr>
          <tr>
            <td>订单附言</td>
            <td><textarea name="comment" cols="40" rows="8" style="width: 99%"></textarea>
            </td>
           </tr>
           <tr>
           	<td colspan="2">
          <div class="text-right">
			<button id="button-history" class="btn btn-primary" data-loading-text="Loading...">
			<i class="fa fa-plus-circle"></i>
			添加订单记录
			</button>
		  </div>
		  </td>
          </tr>
        </table>
      </div>	-->
		
	</div>

					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->



			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if IE]>
		<script type="text/javascript">
		 window.jQuery || document.write("<script src='/public/static/view_res/admin/ace/js/jquery1x.min.js'>"+"<"+"/script>");
		</script>
		<![endif]-->

		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='/public/static/view_res/admin/ace/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
		<script type="text/javascript">
		 window.jQuery || document.write("<script src='/public/static/view_res/admin/ace/js/jquery1x.min.js'>"+"<"+"/script>");
		</script>
		<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='/public/static/view_res/admin/ace/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="/public/static/js/bt/bootstrap.min.js"></script>

		<!-- ace scripts -->
		<script src="/public/static/view_res/admin/ace/js/ace-elements.min.js"></script>
		<script src="/public/static/view_res/admin/ace/js/ace.min.js"></script>

		
<script>	
//更新数量
$('.quantity').blur(function(){		
	$.post(
		"<?php echo url('OrderBackend/update_order',array('type'=>'quantity')); ?>",
		{shipping:$('#shipping').val(),quantity:$(this).val(),order_id:$(this).attr('order_id'),order_goods_id:$(this).attr('order_goods_id')},
		function(data){
			if(data){
				window.location.reload();
			}
		}
	);
});
//更新价格
$('.price').blur(function(){		
	$.post(
		"<?php echo url('OrderBackend/update_order',array('type'=>'price')); ?>",
		{shipping:$('#shipping').val(),price:$(this).val(),order_id:$(this).attr('order_id'),order_goods_id:$(this).attr('order_goods_id')},
		function(data){
			if(data){
				window.location.reload();
			}
		}
	);
});
//更新运费
$('#shipping').blur(function(){		
	$.post(
		"<?php echo url('OrderBackend/update_shipping'); ?>",
		{shipping:$('#shipping').val(),order_id:$(this).attr('order_id')},
		function(data){
			if(data){
				window.location.reload();
			}
		}
	);
});

$('#history').load('<?php echo url("OrderBackend/history",array("id"=>input("param.id"))); ?>');
$('#button-history').live('click', function() {

	$.ajax({
		url: '<?php echo url("OrderBackend/history",array("id"=>input("param.id"))); ?>',
		type: 'post',
		dataType: 'html',
		data: 'order_status_id=' + encodeURIComponent($('select[name=\'order_status_id\']').val()) + '&notify=' + encodeURIComponent($('input[name=\'notify\']').attr('checked') ? 1 : 0)  + '&comment=' + encodeURIComponent($('textarea[name=\'comment\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-history').attr('disabled', true);
			$('#history').prepend('<div class="attention"><img src="/public/static/image/loading.gif" alt="" />加载中...</div>');
		},
		complete: function() {
			$('#button-history').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(html) {
			$('#history').html(html);
			
			$('textarea[name=\'comment\']').val('');
			
			$('#order-status').html($('select[name=\'order_status_id\'] option:selected').text());
		}
	});
});
</script>

	</body>
</html>
