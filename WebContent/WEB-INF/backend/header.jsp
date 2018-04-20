<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${cxt }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/common/jquery-3.2.1.js"></script>
	<script type="text/javascript" src="js/backend/main.js"></script>
<link rel="stylesheet" href="css/usercenter/header.css" type="text/css">
<title>头部</title>
</head>
<body>
	<div id="header">
		<div>
			<div class="site" id="go_to_site">
				<img alt="" src="img/usercenter/site.png" class="site_img">
				<span id="go-to-site">查看首页</span>
			</div>
			<label>嗨,${name }</label>
		</div>

	</div>
</body>
</html>