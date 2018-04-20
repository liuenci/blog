<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${cxt }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/usercenter/left.css" type="text/css">
<title>左侧栏</title>
</head>
<body>
	<div id="left">
		<ol id="nav-ol">
			<a href="usercenter/show" target="right"><li><img alt="" src="img/usercenter/main.png" class="img-size">首页</li></a>
			<a href="backend/user" target="right"><li><img alt="" src="img/usercenter/info.png" class="img-size">用户管理</li></a>
			<a href="backend/backarticle" target="right"><li><img alt="" src="img/usercenter/write.png" class="img-size">文章管理</li></a>
			<a href="backend/classification" target="right"><li><img alt="" src="img/usercenter/draft.png" class="img-size">分类管理</li></a>
			<a><li id="exit_btn"><img alt="" src="img/usercenter/exit.png" class="img-size">退出登录</li></a>
		</ol>
	</div>
</body>
<script type="text/javascript" src="js/common/jquery-3.2.1.js"></script>
<script type="text/javascript" src="js/backend/main.js"></script>
</html>