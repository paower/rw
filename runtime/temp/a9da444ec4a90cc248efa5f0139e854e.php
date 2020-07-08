<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:48:"./themes/default/member/member_backend\info.html";i:1562900015;s:34:"./shop/admin/view/public/base.html";i:1562121180;}*/ ?>
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
		
	  <li class="active"><a href="#tab-member" data-toggle="tab">会员资料</a></li>
	 
	  <li><a href="#tab-shipping" data-toggle="tab">收货地址</a></li>
	  <li><a href="#tab-money" data-toggle="tab">资产</a></li>
	  
	</ul>
	<div class="tab-content">		
		<input class="USER" name="user_id" type="hidden" value="<?php echo \think\Request::instance()->param('id'); ?>" />		
		<div class="tab-pane active" id="tab-member">
			<table class="table table-binfoed">
				<tr>
				    <td>ID</td>
				    <td><?php echo $data['info']['user_id']; ?></td>
				</tr>
				<tr>
				    <td>手机号（账号）</td>
				    <td><input class="USER" name="user_phone" type="number" style="width:400px;" value="<?php echo $data['info']['user_phone']; ?>" /></td>
				</tr> 
				<tr>
					<td>用户名</td>
					<td>
						<input class="USER" name="user_name" type="text" style="width: 400px;" value="<?php echo (isset($data['info']['user_name']) && ($data['info']['user_name'] !== '')?$data['info']['user_name']:''); ?>" />
					</td>
				</tr>
				
				<tr>
					<td>登录密码</td>
					<td>
						<input class="USER" id="pwd" name="password" type="password" style="width:400px;" value="000000" />
						<input class="USER" name="password1" type="hidden" value="<?php echo $data['info']['password']; ?>" />
					</td>
				</tr>
				<tr>
					<td>安全密码</td>
					<td>
						<input class="USER" id="pwd1" name="pay_password" type="password" style="width:400px;" value="000000" />
						<input class="USER" name="pay_password1" type="hidden" value="<?php echo $data['info']['pay_password']; ?>" />
					</td>
				</tr>	
				<tr>
	                <td>头像：</td>
	                <td class="col-sm-10" id="thumb">
	                  <a id="thumb-image" href="#" data-toggle="image" class="img-thumbnail">
	                  	<?php if(empty($data['info']['user_photo']) || (($data['info']['user_photo'] instanceof \think\Collection || $data['info']['user_photo'] instanceof \think\Paginator ) && $data['info']['user_photo']->isEmpty())): ?>
	                  		<img src="/public/static/image/no_image_100x100.jpg" />
	                  	<?php else: ?>
	                  		<img style="width: 50px;height: 50px;" src="/public/uploads/<?php echo $data['info']['user_photo']; ?>" />
	                  	<?php endif; ?>
	                  </a>
	                  <input class="USER" type="hidden" name="image" value="<?php echo $data['info']['user_photo']; ?>" id="input-image" />
	            	</td>
          		</tr>
				<tr>
					<td>注册时间</td>
					<td><?php echo date("Y-m-d H:i:s",$data['info']['user_retime']); ?></td>
				</tr>
				<tr>
					<td>状态</td>
					<td>	
						<label class="radio-inline">
							<input class="USER" type="radio" <?php if($data['info']['status'] == 1): ?>checked<?php endif; ?> value="1" name="status">激活
						</label>
						<label class="radio-inline">
							<input class="USER" type="radio" <?php if($data['info']['status'] == 2): ?>checked<?php endif; ?>  value="2" name="status">冻结
						</label>
					</td>
				</tr>
			</table>
			<div class="form-group">
				<div style="margin-left:20px;">
					<input name="send" type="submit" value="提交" class="btn btn-primary" id="btn" />
				</div>
			</div>
		</div>
		
		<div class="tab-pane" id="tab-shipping">
			<div class="page-header" >
				<a id="addbut" href="javascript:;" class="btn btn-primary">＋</a>
			</div>
			<div id="add_box" style="display: none;">
				<table class="table table-binfoed">
					<input class="ADDRESS" name="uid" type="hidden" value="<?php echo \think\Request::instance()->param('id'); ?>" />	
					<tr>
						<td>收货人姓名</td>
						<td>
							<input id="name" class="ADDRESS" name="name" type="text" style="width:30%;" value="" />
						</td>
					</tr>
					<tr>
						<td>所在地</td>
						<td>
							<select class="ADDRESS" id="province" name="province">
								<option value="change" selected>选择省份</option>
								<?php if(is_array($province) || $province instanceof \think\Collection || $province instanceof \think\Paginator): $index = 0; $__LIST__ = $province;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($index % 2 );++$index;?>
									<option value="<?php echo $item['area_id']; ?>" ><?php echo $item['area_name']; ?></option>
								<?php endforeach; endif; else: echo "" ;endif; ?>
							</select>
							<select class="ADDRESS" id="city" name="city" style="display: none;">
								<option value="change" selected>选择市区</option>
							</select>
							<select class="ADDRESS" id="country" name="country" style="display: none;">
								<option value="change" selected>选择县乡</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>详细地址</td>
						<td>
							<input id="address" class="ADDRESS" name="address" type="text" style="width:30%;" value="" />
						</td>
					</tr>
					<tr>
						<td>手机号码</td>
						<td>
							<input id="telephone" class="ADDRESS" name="telephone" type="text" style="width:30%;" value="" />
						</td>
					</tr>
					<tr>
						<td>是否默认</td>
						<td>	
							<label class="radio-inline">
								<input class="ADDRESS" type="radio"  checked="checked" value="1" name="default">否
							</label>
							<label class="radio-inline">
								<input class="ADDRESS" type="radio" value="2" name="default">是
							</label>
						</td>
					</tr>
				</table>
				<div class="form-group">
					<div style="margin-left:20px;">
						<input name="send" type="submit" value="提交" class="btn btn-primary" id="btn1" />
					</div>
				</div>
			</div>
			<table class="table table-striped table-bordered table-hove">
				<thead>
					<tr>
						<td>ID</td>
						<td>收货人姓名</td>          
						<td>所在地</td>
						<td>详细地址</td>       
						<td>手机号码</td>
						<td>是否为默认</td>
						<td>操作</td>
					</tr>
				</thead>
				<tbody>
					<input class="EDIT" name="uid" type="hidden" value="<?php echo \think\Request::instance()->param('id'); ?>" />	
					<?php if(is_array($data['address']) || $data['address'] instanceof \think\Collection || $data['address'] instanceof \think\Paginator): $i = 0; $__LIST__ = $data['address'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
						<tr>
							<td>
								<?php echo $vo['address_id']; ?>
							</td>
							<td>
								<?php echo $vo['name']; ?>
							</td>          
							<td>
								<?php echo get_area_name($vo['province_id']); ?>
				            	<?php echo get_area_name($vo['city_id']); ?>
				            	<?php echo get_area_name($vo['country_id']); ?>
							</td>        
							<td>
								<?php echo $vo['address']; ?>
							</td>   
							<td>
								<?php echo $vo['telephone']; ?>
							</td>
							<td>
								<?php if($vo['default'] == 1): ?>
									否
								<?php elseif($vo['default'] == 2): ?>
									是
								<?php endif; ?>
							</td>
							<td>
								<a class="btn btn-xs btn-info" id="edit1" href="<?php echo url('MemberBackend/editAddress',array('id'=>$vo['address_id'],'uid'=>\think\Request::instance()->param('id'))); ?>">
									<i class="fa fa-edit bigger-120"></i>
								</a>
								<a class="delete btn btn-xs btn-danger" id="remove" href="<?php echo url('MemberBackend/remove',array('id'=>$vo['address_id'])); ?>">
									<i class="fa fa-trash bigger-120"></i>
								</a> 
							</td>
						</tr>
					<?php endforeach; endif; else: echo "" ;endif; ?>  
				</tbody>
			</table>  
			
  		</div>	
  		<div class="tab-pane" id="tab-money">
			<table class="table table-binfoed">
				<input class="WALLET" name="uid" type="hidden" value="<?php echo \think\Request::instance()->param('id'); ?>" />	
				<tr>
				    <td>钱包ID</td>
				    <td><?php echo $wallet['id']; ?></td>
				</tr>
				<tr>
				    <td>用户ID</td>
				    <td><?php echo $wallet['uid']; ?></td>
				</tr>
				<tr>
				    <td>可提现余额</td>
				    <td><input class="WALLET" name="principal" type="number" style="width:400px;" value="<?php echo $wallet['principal']; ?>" /></td>
				</tr> 
				<tr>
				    <td>返现余额</td>
				    <td><input class="WALLET" name="interest" type="number" style="width:400px;" value="<?php echo $wallet['interest']; ?>" /></td>
				</tr> 
			</table>
			<div class="form-group">
				<div style="margin-left:20px;">
					<input name="send" type="submit" value="提交" class="btn btn-primary" id="btn2" />
				</div>
			</div>   
		</div>	
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
var back_index="<?php echo url('member_backend/index'); ?>";

//会员基本资料
$('#btn').click(function(){
	if($('#pwd').val()==''){
		alert('密码必填');
		return false;
	};
	if($('#pwd').val().length<6){
		alert('密码长度必须大于等于6位！！');
		return false;
	};
	if($(".USER[name='pay_password']").val().length != 6){
		alert('安全密码为6位数！！');
		return false;
	};
	$.post(
		'<?php echo url("MemberBackend/edit"); ?>',
		{
			status:$('.USER:radio:checked').val(),
			user_phone:$(".USER[name='user_phone']").val(),
			user_name:$(".USER[name='user_name']").val(),
			password:$(".USER[name='password']").val(),
			password1:$(".USER[name='password1']").val(),
			pay_password:$(".USER[name='pay_password']").val(),
			pay_password1:$(".USER[name='pay_password1']").val(),
			image:$(".USER[name='image']").val(),
			user_id:$(".USER[name='user_id']").val(),
		},
		function(d){
			art_dialog(d,back_index);
		}
	);
});

//会员收货地址
$('#btn1').click(function(){
	if($('#name').val()==''){
		alert('收货人姓名必填');
		return false;
	};
	if($('#address').val()==''){
		alert('详细地址必填');
		return false;
	};
	if($('#telephone').val()==''){
		alert('手机号码必填');
		return false;
	};
	$.post(
		'<?php echo url("MemberBackend/addAddress"); ?>',
		$('.ADDRESS'),
		function(d){
			art_dialog(d,"<?php echo url('member_backend/edit',['id'=>\think\Request::instance()->param('id')]); ?>");
		}
	);
});

//会员资产
$('#btn2').click(function(){
	$.post(
		'<?php echo url("MemberBackend/setWallet"); ?>',
		$('.WALLET'),
		function(d){
			art_dialog(d,"<?php echo url('member_backend/edit',['id'=>\think\Request::instance()->param('id')]); ?>");
		}
	);
});

//添加
$('#addbut').click(function(){
	$('#add_box').toggle('slow');
});
	
//城市选择
$('#province').bind("change",function(){
	$('#province option[value="change"]').remove();
	var province_id = $('#province option:selected').val();
	//var city = JSON.stringify(<?php echo $json_city; ?>);
	var city = <?php echo $json_city; ?>;
	var len = city.length;
	$("#city").empty();
	for(var i = 0;i<len;i++){
		if(city[i].area_parent_id == province_id){
			var Value = city[i].area_id;
			var Text = city[i].area_name;
			$("#city").append("<option value='"+Value+"'>"+Text+"</option>");
		}
	}
	$('#city').show();
});

$('#city').bind("change",function(){
	$('#city option[value="change"]').remove();
	var city_id = $('#city option:selected').val();
	//var city = JSON.stringify(<?php echo $json_city; ?>);
	var country = <?php echo $json_country; ?>;
	var len = country.length;
	$("#country").empty();
	for(var i = 0;i<len;i++){
		if(country[i].area_parent_id == city_id){
			var Value = country[i].area_id;
			var Text = country[i].area_name; 
			$("#country").append("<option value='"+Value+"'>"+Text+"</option>");
		}
	}
	$('#country').show();
});

</script>							

	</body>
</html>
