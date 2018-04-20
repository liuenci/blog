<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${cxt }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="editor/ueditor.config.js"></script>
<script type="text/javascript" src="editor/ueditor.all.js"></script>
<link rel="stylesheet" href="editor/themes/default/css/ueditor.css">
<script type="text/javascript" charset="utf-8"
	src="ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<body>
	<textarea id="container" name="text" placeholder="请输入帖子正文内容"
		style="width: 847px; height: 400px; margin: 0 auto;">${draft.content }</textarea>
</body>
<script type="text/javascript">
	UE.getEditor("container");
</script>
</html>