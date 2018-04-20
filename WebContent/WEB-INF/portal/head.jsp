<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${cxt }/">
<link rel="stylesheet" href="css/portal/head.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>head</title>
</head>
<body>
	<div class="toolbar">
		<div class="main-page-img">
			<a href="myblog"><img src="img/portal/csdn.png"></a>
		</div>
		<ol class="nav-ol">
			<li>博客</li>
			<li>学院</li>
			<li>下载</li>
			<li>GitChat</li>
			<li>论坛</li>
			<li>问答</li>
			<li>商城</li>
			<li>VIP</li>
			<li>活动</li>
			<li>招聘</li>
			<li>ITeye</li>
			<li>CSTO</li>
		</ol>
		<input type="text" placeholder="搜索" class="search">
		<ol class="blog-ol">
			<li>写博客</li>
			<li>发chat</li>
			<li><a href="portal/login" id="btn-login">登录</a></li>
			<li id="btn-register">注册</li>
		</ol>
	</div>
</body>
<script type="text/javascript" src="js/common/jquery-3.2.1.js"></script>
<script src="js/portal/myblog.js"></script>
</html>