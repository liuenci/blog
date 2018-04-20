<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${cxt }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<link rel="stylesheet" href="css/portal/style.css">
</head>
<body>
	<div class="login-container">
		<h1>博客</h1>

		<div class="connect">
			<p>Link the world. Share to world.</p>
		</div>
		<form action="portal/login" method="post" id="loginForm">
		<div class="msg">${error }</div>
			<div>
				<input type="text" name="username" class="username"
					placeholder="用户名" autocomplete="off" />
			</div>
			<div>
				<input type="password" name="password" class="password"
					placeholder="密码" oncontextmenu="return false"
					onpaste="return false" />
			</div>
			<button id="submit" type="submit">登 陆</button>
		</form>

		<a href="portal/register">
			<button type="button" class="register-tis">还没有账号？</button>
		</a>

	</div>

</body>
<script type="text/javascript" src="js/common/jquery-3.2.1.js"></script>
<script src="js/portal/common.js"></script>
<script src="js/portal/jquery.validate.min.js?var1.14.0"></script>
</html>