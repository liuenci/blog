<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${cxt }/">
<meta charset="utf-8">
<title>eating your blog</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- CSS -->
<link rel="stylesheet" href="css/backend/reset.css">
<link rel="stylesheet" href="css/backend/supersized.css">
<link rel="stylesheet" href="css/backend/style.css">
<title>login</title>
</head>
<body oncontextmenu="return false">

	<div class="page-container">
		<h1>博客</h1>
		<form action="backend/login" method="post" id="loginform">
			<div>
				<input type="text" name="username" class="username"
					placeholder="用户名" autocomplete="off" />
			</div>
			<div>
				<input type="password" name="password" class="password"
					placeholder="密码" oncontextmenu="return false"
					onpaste="return false" />
			</div>
			<button id="login" type="button">登录</button>
		</form>
		<div class="connect">
			<p>If we can only encounter each other rather than stay with each
				other,then I wish we had never encountered.</p>
			<p style="margin-top: 20px;">如果只是遇见，不能停留，不如不遇见。</p>
		</div>
	</div>
	<div class="alert" style="display: none">
		<h2>消息</h2>
		<div class="alert_con">
			<p id="ts"></p>
			<p style="line-height: 70px">
				<a class="btn">确定</a>
			</p>
		</div>
	</div>

	<!-- Javascript -->
	<script src="http://apps.bdimg.com/libs/jquery/1.6.4/jquery.min.js"
		type="text/javascript"></script>
	<script src="js/backend/supersized.3.2.7.min.js"></script>
	<script src="js/backend/supersized-init.js"></script>
	<script>
		$(".btn").click(function() {
			is_hide();
		})
		var u = $("input[name=username]");
		var p = $("input[name=password]");
		$("#login").live('click', function() {
			if (u.val() == '' || p.val() == '') {
				$("#ts").html("用户名或密码不能为空~");
				is_show();
				return false;
			} else {
				var reg = /^[0-9A-Za-z]+$/;
				if (!reg.exec(u.val())) {
					$("#ts").html("用户名错误");
					is_show();
					return false;
				}else{
					$("#loginform").submit();
					return;
				}
			}
		});
		window.onload = function() {
			$(".connect p").eq(0).animate({
				"left" : "0%"
			}, 600);
			$(".connect p").eq(1).animate({
				"left" : "0%"
			}, 400);
		}
		function is_hide() {
			$(".alert").animate({
				"top" : "-40%"
			}, 300)
		}
		function is_show() {
			$(".alert").show().animate({
				"top" : "45%"
			}, 300)
		}
	</script>
</body>
</html>