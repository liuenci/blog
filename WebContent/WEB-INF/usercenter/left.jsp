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
			<a href="usercenter/information" target="right"><li><img alt="" src="img/usercenter/info.png" class="img-size">信息管理</li></a>
			<a href="usercenter/edit" target="right"><li><img alt="" src="img/usercenter/write.png" class="img-size">写文章</li></a>
			<a href="usercenter/draft" target="right"><li><img alt="" src="img/usercenter/draft.png" class="img-size">草稿管理</li></a>
			<a href="usercenter/all-article" target="right"><li><img alt="" src="img/usercenter/article.png" class="img-size">文章管理</li></a>
			<a href="usercenter/tag-manage" target="right"><li><img alt="" src="img/usercenter/tag.png" class="img-size">标签管理</li></a>
			<a href="usercenter/comment" target="right"><li><img alt="" src="img/usercenter/comment.png" class="img-size">评论管理</li></a>
			<a href="usercenter/update-password" target="right"><li><img alt="" src="img/usercenter/password.png" class="img-size">密码管理</li></a>
			<a><li id="exit_btn"><img alt="" src="img/usercenter/exit.png" class="img-size">退出登录</li></a>
		</ol>
	</div>
</body>
<script type="text/javascript" src="js/common/jquery-3.2.1.js"></script>
<script type="text/javascript" src="js/usercenter/left.js"></script>
</html>