<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:35:"./shop/admin\view\public\login.html";i:1563025499;}*/ ?>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>登录 - 后台管理系统</title>

		<meta name="description" content="User login page" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<!-- basic styles -->

		<link href="/public/static/js/bt/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="/public/static/view_res/admin/ace/font-awesome/4.2.0/css/font-awesome.min.css" />

		<!--[if IE 7]>
		  <link rel="stylesheet" href="/public/static/view_res/admin/ace/css/font-awesome-ie7.min.css" />
		<![endif]-->

		<!-- ace styles -->

		<link rel="stylesheet" href="/public/static/view_res/admin/ace/css/ace.min.css" />
		<link rel="stylesheet" href="/public/static/view_res/admin/ace/css/ace-rtl.min.css" />
	
		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="/public/static/view_res/admin/ace/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

		<!--[if lt IE 9]>
		<script src="/public/static/view_res/admin/ace/js/html5shiv.js"></script>
		<script src="/public/static/view_res/admin/ace/js/respond.min.js"></script>
		<![endif]-->
	</head>

	<body class="login-layout">
		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container">
							<div class="center">
								<h1>
									<i class="fa fa-leaf已经安装"></i>
									<span class="red"><?php echo \think\Config::get('SITE_NAME'); ?></span>
									<span class="white">网站管理</span>
								</h1>
								<h4 class="blue">
								&nbsp;&nbsp;&nbsp;&nbsp;
								</h4>
							</div>

							<div class="space-6"></div>

							<div class="position-relative">
								<div id="login-box" class="login-box visible widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger">
												<i class="fa fa-coffee green"></i>
												请输入你的登录信息
											</h4>

											<div class="space-6"></div>

											<form action="<?php echo url('Login/login'); ?>" method="post" class="login-form">
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input name="username" type="text" class="form-control" placeholder="用户名" />
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" name="password" class="form-control" placeholder="密码" />
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>

													<div class="space"></div>

													<div class="clearfix">
														<label class="inline">
															<input type="checkbox" class="ace" />
															<span class="lbl"> 记住我</span>
														</label>

														<button type="submit" class="login-btn width-35 pull-right btn btn-sm btn-primary">
															<i class="fa fa-key"></i>
															登录
														</button>
														<div class="check-tips" style="color:red;"></div>
													</div>

													<div class="space-4"></div>
												</fieldset>
											</form>

											

									
										</div><!-- /widget-main -->

									
									</div><!-- /widget-body -->
								</div><!-- /login-box -->

								

							</div><!-- /position-relative -->
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div>
		</div><!-- /.main-container -->

		<!-- basic scripts -->


		<script src="/public/static/js/jquery/jquery-2.0.3.min.js"></script>

		<!-- inline scripts related to this page -->

		<script type="text/javascript">
			function show_box(id) {
			 jQuery('.widget-box.visible').removeClass('visible');
			 jQuery('#'+id).addClass('visible');
			}
		</script>
		<script type="text/javascript">
    	
    	//表单提交


    	$("form").submit(function(){
    		var self = $(this);
    		$.post(self.attr("action"), self.serialize(), success, "json");
    		return false;

    		function success(data){
    			if(data.code==1){
    				window.location.href = data.url;
    			} else {
    				self.find(".check-tips").text(data.msg);
    				
    			}
    		}
    	});

	
    </script>
	</body>
</html>
