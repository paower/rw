<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:42:"./themes/default/member/finance\index.html";i:1562582025;s:34:"./shop/admin/view/public/base.html";i:1562121180;}*/ ?>
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
							

<ul class="nav nav-tabs">
	<li class="active"><a href="#tab-recharge" data-toggle="tab">充值</a></li>
	 
	<li><a href="#tab-withdrawal" data-toggle="tab">提现</a></li>
</ul>
<div class="tab-content">	
	<div class="tab-pane active" id="tab-recharge">
		<table class="table table-striped table-bordered table-hover search-form">
			<thead>
				<input name="type" type="hidden" value="1" />
				<th><input name="uid" type="text" placeholder="输入会员id" value="<?php echo input('param.uid'); ?>" /></th>	
				<th>    				
					<?php $search_state=input('param.state'); ?>	
					<select name="state">
						<option value="">-选择状态-</option>
						<option <?php if($search_state==1){echo ' selected="selected"';} ?> value="1">待审核</option>
						<option <?php if($search_state==2){echo ' selected="selected"';} ?> value="2">已完成</option>
						<option <?php if($search_state==3){echo ' selected="selected"';} ?> value="3">已取消</option>
					</select>
				</th>
				<th>
					<a class="btn btn-primary" href="javascript:;" id="search" url="<?php echo url('Finance/index'); ?>">查询</a>
				</th>
			</thead>
		</table>	
			
		<div class="row">
			<div class="col-xs-12">	
				<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>											
								<th>ID</th>
								<th>会员ID</th> 
								<th>会员账户ID</th>
								<th>类型</th> 						
								<th>金额</th>					
								<th>状态</th>	
								<th>生成时间</th>
								<th>完成时间</th>	
								<th>操作</th>	
							</tr>
						</thead>
						<tbody>
							<?php if(is_array($rechargelist) || $rechargelist instanceof \think\Collection || $rechargelist instanceof \think\Paginator): $i = 0; $__LIST__ = $rechargelist;if( count($__LIST__)==0 ) : echo "$empty" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
								<tr>						
									<td><?php echo $v['finance_id']; ?></td>
									<td>
										<?php echo $v['uid']; ?>
									</td>	
									<td>
										<?php echo $v['user_bank_id']; ?>
									</td>
									<td>
										<?php if($v['type'] == 1): ?>
											充值
										<?php else: ?>
											提现
										<?php endif; ?>
									</td>						
									<td>
										¥<?php echo $v['price']; ?>
									</td>
									<td>
										<?php if($v['state'] == 1): ?>
											待审核
										<?php elseif($v['state'] == 2): ?>
											已完成
										<?php elseif($v['state'] == 3): ?>
											已取消
										<?php endif; ?>
									</td>
									<td>
										<?php echo date('Y-m-d H:i:s',$v['creation_time']); ?>
									</td>
									<td>
										<?php if($v['complete_time'] == ''): ?>
											暂无
										<?php else: ?>
											<?php echo date('Y-m-d H:i:s',$v['complete_time']); endif; ?>
									</td>
									<td>
										<a  class="btn btn-xs btn-info" href='<?php echo url("Finance/show",array("id"=>$v["finance_id"])); ?>'>
											<i class="fa fa-eye bigger-120"></i>
										</a> 
										<?php if($v['state'] == 1): ?>
										<a  class="delete btn btn-xs btn-info" href='<?php echo url("Finance/setState",array("id"=>$v["finance_id"],"type"=>1)); ?>'>
											<i class="fa fa-check bigger-120"></i>
										</a> 
										<a  class="delete btn btn-xs btn-danger" href='<?php echo url("Finance/refuse",array("id"=>$v["finance_id"],"type"=>1)); ?>'>
											<i class="fa fa-remove bigger-120"></i>
										</a> 
										<?php endif; ?>
									</td>
								</tr>
							<?php endforeach; endif; else: echo "$empty" ;endif; ?>	
								
								<tr>
									<td colspan="20" class="page"><?php echo $rechargelist->render(); ?></td>
								</tr>
						</tbody>
						
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="tab-pane" id="tab-withdrawal">
		<table class="table table-striped table-bordered table-hover search-form2">
			<thead>
				<input name="type" type="hidden" value="2" />
				<th><input name="uid" type="text" placeholder="输入会员id" value="<?php echo input('param.uid'); ?>" /></th>	
				<th>    				
					<?php $search_state=input('param.state'); ?>	
					<select name="state">
						<option value="">-选择状态-</option>
						<option <?php if($search_state==1){echo ' selected="selected"';} ?> value="1">待审核</option>
						<option <?php if($search_state==2){echo ' selected="selected"';} ?> value="2">已完成</option>
						<option <?php if($search_state==3){echo ' selected="selected"';} ?> value="3">已取消</option>
					</select>
				</th>
				<th>
					<a class="btn btn-primary" href="javascript:;" id="search2" url="<?php echo url('Finance/index'); ?>">查询</a>
				</th>
			</thead>
		</table>	
			
		<div class="row">
			<div class="col-xs-12">	
				<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>											
								<th>ID</th>
								<th>会员ID</th> 
								<th>会员账户ID</th>
								<th>类型</th> 						
								<th>金额</th>					
								<th>状态</th>	
								<th>生成时间</th>
								<th>完成时间</th>	
								<th>操作</th>	
							</tr>
						</thead>
						<tbody>
							<?php if(is_array($withdrawallist) || $withdrawallist instanceof \think\Collection || $withdrawallist instanceof \think\Paginator): $i = 0; $__LIST__ = $withdrawallist;if( count($__LIST__)==0 ) : echo "$empty" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
								<tr>						
									<td><?php echo $v['finance_id']; ?></td>
									<td>
										<?php echo $v['uid']; ?>
									</td>	
									<td>
										<?php echo $v['user_bank_id']; ?>
									</td>
									<td>
										<?php if($v['type'] == 1): ?>
											充值
										<?php else: ?>
											提现
										<?php endif; ?>
									</td>						
									<td>
										¥<?php echo $v['price']; ?>
									</td>
									<td>
										<?php if($v['state'] == 1): ?>
											待审核
										<?php elseif($v['state'] == 2): ?>
											已完成
										<?php elseif($v['state'] == 3): ?>
											已取消
										<?php endif; ?>
									</td>
									<td>
										<?php echo date('Y-m-d H:i:s',$v['creation_time']); ?>
									</td>
									<td>
										<?php if($v['complete_time'] == ''): ?>
											暂无
										<?php else: ?>
											<?php echo date('Y-m-d H:i:s',$v['complete_time']); endif; ?>
									</td>
									<td>
										<a  class="btn btn-xs btn-info" href='<?php echo url("Finance/show",array("id"=>$v["finance_id"])); ?>'>
											<i class="fa fa-eye bigger-120"></i>
										</a> 
										<?php if($v['state'] == 1): ?>
										<a  class="delete btn btn-xs btn-info" href='<?php echo url("Finance/setState",array("id"=>$v["finance_id"],"type"=>2)); ?>'>
											<i class="fa fa-check bigger-120"></i>
										</a> 
										<a  class="delete btn btn-xs btn-danger" href='<?php echo url("Finance/refuse",array("id"=>$v["finance_id"],"type"=>2)); ?>'>
											<i class="fa fa-remove bigger-120"></i>
										</a> 
										<?php endif; ?>
									</td>
								</tr>
							<?php endforeach; endif; else: echo "$empty" ;endif; ?>	
								
								<tr>
									<td colspan="20" class="page"><?php echo $rechargelist->render(); ?></td>
								</tr>
						</tbody>
						
					</table>
				</div>
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
$(function(){
   $("#search").click(function () {
        var url = $(this).attr('url');
        var query = $('.search-form').find('input,select').serialize();
        query = query.replace(/(&|^)(\w*?\d*?\-*?_*?)*?=?((?=&)|(?=$))/g, '');
        query = query.replace(/^&/g, '');
        if (url.indexOf('?') > 0) {
            url += '&' + query;
        } else {
            url += '?' + query;
        }
        window.location.href = url;
    });	
    
    $("#search2").click(function () {
        var url = $(this).attr('url');
        var query = $('.search-form2').find('input,select').serialize();
        query = query.replace(/(&|^)(\w*?\d*?\-*?_*?)*?=?((?=&)|(?=$))/g, '');
        query = query.replace(/^&/g, '');
        if (url.indexOf('?') > 0) {
            url += '&' + query;
        } else {
            url += '?' + query;
        }
        window.location.href = url;
    });	
});
</script>

	</body>
</html>
