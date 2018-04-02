<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'index.jsp' starting page</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" href="css/pintuer.css">
		<link rel="stylesheet" href="css/admin.css">
		<script src="js/jquery.js"></script>
	</head>

	<body style="background-color: #f2f9fd;">
		<div class="header bg-main">
			<div class="logo margin-big-left fadein-top">
				<h1>
					<img src="images/y.jpg" class="radius-circle rotate-hover"
						height="50" alt="" />
					图书商城后台管理
				</h1>
			</div>
			<div class="head-l">
				<a class="button button-little bg-green" href="" target="_blank"><span
					class="icon-home"></span> 前台首页</a> &nbsp;&nbsp;
				<!--<a href="##" class="button button-little bg-blue"><span
					class="icon-wrench"></span> 清除缓存</a> &nbsp;&nbsp;
				<a class="button button-little bg-red" href="login.html"><span
					class="icon-power-off"></span> 退出登录</a>
			--></div>
		</div>
		<div class="leftnav">
			<div class="leftnav-title">
				<strong><span class="icon-list"></span>菜单列表</strong>
			</div>
			<h2>
				<span class="icon-user"></span>基本设置
			</h2>
			<ul style="display: block">
				<li>
					<a href="jsp/admin/list.jsp" target="right"><span
						class="icon-caret-right"></span>管理员设置</a>
				</li>
				
			</ul>
			<h2>
				<span class="icon-pencil-square-o"></span>商品管理
			</h2>
			<ul>
				<li>
					<a href="bookType/toList.do" target="right"><span
						class="icon-caret-right"></span>书籍分类管理</a>
				</li>
				<li>
					<a href="book/toList.do" target="right"><span
						class="icon-caret-right"></span>图书管理</a>
				</li>
			</ul>
		</div>
		<script type="text/javascript">
	$(function() {
		$(".leftnav h2").click(function() {
			$(this).next().slideToggle(200);
			$(this).toggleClass("on");
		})
		$(".leftnav ul li a").click(function() {
			$("#a_leader_txt").text($(this).text());
			$(".leftnav ul li a").removeClass("on");
			$(this).addClass("on");
		})
	});
</script>
		<ul class="bread">
			<li>
				<a href="{:U('Index/info')}" target="right" class="icon-home">
					首页</a>
			</li>
            	<a href="javascript: window.parent.right.history.go(0);">
				<!--<img src="images/Header_refresh.gif" width="24" height="24" style="margin-top: -8px;"/>
				--><b>刷新(IE、Chrome)</b>		
			</a>
			<a href="javascript: window.parent.right.location.reload(true);">
				<!--<img src="images/Header_refresh.gif" width="24" height="24" style="margin-top: -8px;"/>
				--><b>刷新(Firefox)</b>		
			</a>
		</ul>
		<div class="admin">
			<iframe scrolling="auto" rameborder="0" src="jsp/admin/list.jsp" name="right"
				width="100%" height="100%"></iframe>
		</div>
		<div style="text-align: center;">
			<p>
				来源:
				<a href="http://www.mycodes.net/" target="_blank">源码之家</a>
			</p>
		</div>
	</body>
</html>
