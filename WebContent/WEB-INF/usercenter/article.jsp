<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${cxt}/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>撰写文章</title>
<link rel="stylesheet" href="..editormd.min.css" />
<link rel="stylesheet" type="text/css" href="css/usercenter/article.css">
</head>
<body>
	<div id="wrap">
		<h1 class="heading-inline">撰写新文章</h1>
		<input type="text" placeholder="在此输入标题">
		<div class="editor_area">
			<div class="editormd" id="mdView">
				<textarea name="content"></textarea>
			</div>
		</div>
	</div>
</body>
</html>