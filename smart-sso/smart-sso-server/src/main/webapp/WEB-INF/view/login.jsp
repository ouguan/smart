<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%
    response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>登录-${_systemName}</title>
<meta name="description" content="User login page" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<link type="images/x-icon" rel="shortcut icon" href="${_staticPath}/custom/assets/favicon.png">

<script type="text/javascript">
  var url = window.location.href;
  if (url.indexOf('${loginUrl}') == -1) {
    window.location.href = '${_path}${loginUrl}';
  }
  //验证是否存在错误消息(el表达式在服务端执行必,javascript是客户端执行,所以必须放置在JSP中)
  var fail = '${errorMessage}';
  if (fail != null && fail != '') {
    alert(fail);
  }
</script>
<script type="text/javascript">
  window.jQuery
          || document.write("<script src='${_staticPath}/assets/js/jquery.js'>"
                  + "<"+"/script>");
</script>

<!-- <![endif]-->

<!--[if IE]>
		<script type="text/javascript">
		 window.jQuery || document.write("<script src='${_staticPath}/assets/js/jquery1x.js'>"+"<"+"/script>");
		</script>
		<![endif]-->

<script type="text/javascript">
  if ('ontouchstart' in document.documentElement)
    document
            .write("<script src='${_staticPath}/assets/js/jquery.mobile.custom.js'>"
                    + "<"+"/script>");
</script>

<script type="text/javascript" src="${_staticPath}/assets/js/smart/login.js"></script>
<script type="text/javascript" src="${_staticPath}/custom/jquery.cookie.js"></script>
<script type="text/javascript" src="${_staticPath}/custom/jquery.form.min.js"></script>
<script type="text/javascript" src="${_staticPath}/custom/jquery.validate-2.0.min.js"></script>
<script type="text/javascript" src="${_staticPath}/custom/jquery.validate-2.0.custom.min.js"></script>

<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="${_staticPath}/assets/css/bootstrap.css" />
<link rel="stylesheet" href="${_staticPath}/assets/css/font-awesome.css" />

<!-- text fonts -->
<link rel="stylesheet" href="${_staticPath}/assets/css/ace-fonts.css" />

<!-- ace styles -->
<link rel="stylesheet" href="${_staticPath}/assets/css/ace.css" />

<!--[if lte IE 9]>
			<link rel="stylesheet" href="${_staticPath}/assets/css/ace-part2.css" />
		<![endif]-->
<link rel="stylesheet" href="${_staticPath}/assets/css/ace-rtl.css" />
<!-- Theme style -->
<link rel="stylesheet" href="${_staticPath}/assets/css/AdminLTE.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="${_staticPath}/assets/css/skins/_all-skins.min.css">
<!-- Google Font -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<link rel="stylesheet" href="${_staticPath}/assets/css/home.css" />
</head>
<body class="hold-transition skin-blue height-auto">
	<div class="main-header">
		<!-- Header Navbar: style can be found in header.less -->
		<div class="nav">
			<!-- Sidebar toggle button-->
			<div class="pull-left">
				<a href="http://www.huaweicloud.com/?locale=zh-cn" class="navbar-brand"> <img id="logo" src="${_staticPath}/custom/assets/favicon.png">
				</a> <span class="navbar-brand blue font-light">${_systemName}</span>
			</div>
			<div class="pull-right">
				<ul class="navbar-nav">
					<!-- Messages: style can be found in dropdown.less-->
					<li class="dropdown"><a href="http://www.xugucn.com/" class="navbar-brand" data-toggle="dropdown"> <i class="fa fa-envelope-o"></i> <span class="blue font-light">首页</span>
					</a></li>
					<!-- Notifications: style can be found in dropdown.less -->
					<li class="dropdown"><a href="#" class="navbar-brand" data-toggle="dropdown"> <i class="fa fa-bell-o"></i> <span class="blue font-light">帮助中心</span>
					</a></li>
					<!-- Tasks: style can be found in dropdown.less -->
					<li class="dropdown"><a href="#" class="navbar-brand" data-toggle="dropdown"> <i class="fa fa-flag-o"></i> <span class="blue font-light">云社区</span>
					</a></li>
					<!-- User Account: style can be found in dropdown.less -->
					<li class="dropdown"><a href="#" class="navbar-brand" data-toggle="dropdown"><i class="fa fa-bookmark-o"></i><span class="blue font-light">注册</span> </a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="wrap main-container">
		<div class="banner-show" id="js_ban_content">
			<div class="cell bns-01">
				<div class="con"></div>
			</div>
			<div class="cell bns-02" style="display: none;">
				<div class="con">
					<a href="http://sc.chinaz.com" target="_blank" class="banner-link"> <i>圈子</i></a>
				</div>
			</div>
			<div class="cell bns-03" style="display: none;">
				<div class="con">
					<a href="http://sc.chinaz.com" target="_blank" class="banner-link"> <i>企业云</i></a>
				</div>
			</div>
		</div>
		<div class="banner-control" id="js_ban_button_box">
			<a href="javascript:;" class="left">左</a> <a href="javascript:;" class="right">右</a>
		</div>

		<div class="container">
			<div id="login-box" class="register-box login-box visible widget-box no-border">
				<div class="reg-slogan">
					<div class="reg-form">
						<h4 class="page-header blue lighter bigger">
							<i class="ace-icon fa fa-coffee green"></i> 请填写登录信息
						</h4>

						<div class="space-6"></div>

						<form id="_loginForm" action="${_path}/login" method="post" validate="true" vmessage="false">
							<input type="hidden" name="backUrl" value="${backUrl}" />
							<fieldset>
								<div class="ace">
									<label class="block clearfix form-group"> <span class="block input-icon input-icon-right"> <input id="_account" name="account" type="text" class="form-control" style="height: 48px" placeholder="登录名" required="true"
											minlength='4' /> <i class="ace-icon fa fa-user" style="vertical-align: middle; font-size: 20px; font-family: !important;"></i>
									</span>
									</label>
								</div>

								<div class="ace">
									<label class="block clearfix form-group"> <span class="block input-icon input-icon-right"> <input id="_password" name="password" type="password" class="form-control" style="height: 48px" placeholder="密码" required="true"
											minlength='6' maxlength='16' /> <i class="ace-icon fa fa-lock" style="vertical-align: middle; font-size: 20px; font-family: !important;"></i>
									</span>
									</label>
								</div>

								<%-- <div class="ace">
								    <label class="block clearfix form-group"> 
								    <span class="block input-icon input-icon-right"> 
								        <input id="_captcha" name="captcha" type="text" class="pager pull-left" placeholder="验证码" required="true" /> 
								        <img alt="" src="${_path}/captcha">
								    </span>
								    </label>
								</div> --%>

								<div class="ace">
									<button id="_loginButton" type="button" class="form-control pull-right btn btn-sm btn-primary" style="height: 48px">
										<i class="ace-icon fa fa-key"></i> <span class="bigger-110">登录</span>
									</button>
								</div>

								<div class="space-4"></div>

								<div class="ace">
									<label class="block clearfix form-group"> <span class="block input-icon input-icon-right"> <span class="pager pull-right">忘记密码?</span>
									</span>
									</label>
								</div>
								<!-- <div class="space-4"></div> -->
							</fieldset>
						</form>
					</div>
				</div>
				<!-- /.widget-body -->
			</div>
			<!-- /.login-box -->
		</div>
	</div>
	<div class="footer">
		<div class="footer-inner">
			<!-- #section:basics/footer -->
			<div class="footer-content">
				<div class="col-md-6">
					<span class="right-space ng-binding">版权所有 &copy; ${_companyName} 2018</span> <span class="right-space ng-binding">保留一切权利</span> <span class="right-space ng-scope"> <a class="link ng-binding" href="http://www.miitbeian.gov.cn"
						target="_blank" rel="nofollow">${_copyRight}</a>
					</span>
				</div>
				<div class="col-md-6">
					<span>
						<div>
							<a target="_blank" rel="noopener noreferrer" href="http://www.huaweicloud.com/declaration/statement.html" class="ng-scope ng-binding">法律声明</a> <span class="ng-scope">|</span> <a target="_blank" rel="noopener noreferrer"
								href="http://www.huaweicloud.com/declaration/sa_prp.html" class="ng-scope ng-binding">隐私政策声明</a> <span class="ng-scope">|</span> <a target="_blank" rel="noopener noreferrer" href="https://portal.huaweicloud.com/feedback?type=jubao"
								class="ng-scope ng-binding">举报不良信息</a> <span class="ng-scope">|</span> <a target="_blank" rel="noopener noreferrer" href="http://www.huaweicloud.com/declaration/sa_nisr.html" class="ng-scope ng-binding">可接受的使用政策</a> <span class="ng-scope">|</span>
							<a target="_blank" rel="noopener noreferrer" href="http://www.huaweicloud.com/declaration/sa_cua.html" class="ng-scope ng-binding">虚谷云用户协议</a>
						</div>
					</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>