<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${cxt }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/portal/style.css">
<title>注册</title>
</head>
<body>

	<div class="register-container">
		<h1>博客</h1>

		<div class="connect">
			<p>Link the world. Share to world.</p>
		</div>

		<form action="portal/register" method="post" id="registerForm">
			<div class="reg-msg">${error }</div>
			<div>
				<input type="text" name="username" class="username"
					placeholder="您的用户名" autocomplete="off" />
			</div>
			<div>
				<input type="password" name="password" class="password"
					placeholder="输入密码" oncontextmenu="return false"
					onpaste="return false" />
			</div>
			<div>
				<input type="password" name="confirm_password"
					class="confirm_password" placeholder="再次输入密码"
					oncontextmenu="return false" onpaste="return false" />
			</div>
			<div>
				<input type="text" name="phone_number" class="phone_number"
					placeholder="输入手机号码" autocomplete="off" id="number" />
			</div>
			<div>
				<input type="email" name="email" class="email" placeholder="输入邮箱地址"
					oncontextmenu="return false" onpaste="return false" />
			</div>

			<button id="submit" type="submit">注 册</button>
		</form>
		<a href="portal/login">
			<button type="button" class="register-tis">已经有账号？</button>
		</a>

	</div>

</body>
<script type="text/javascript" src="js/common/jquery-3.2.1.js"></script>
<script src="js/portal/common.js"></script>
<script src="js/portal/jquery.validate.min.js?var1.14.0"></script>
</html>