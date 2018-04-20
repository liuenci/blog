<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${cxt }/">
<!-- 这个文件用来转换 Markdown 到Html 显示 -->
<!-- 参数: ${article.content} -->
</head>

<!-- preview的css -->
<link rel="stylesheet" href="editormd/css/style.css" />
<link rel="stylesheet" href="editormd/css/editormd.preview.css" />

<!-- 引入editormd相关 -->
<script src="editormd/js/zepto.min.js"></script>
<script src="editormd/js/editormd.js"></script>

<script src="editormd/js/jquery.min.js"></script>
<script src="editormd/lib/marked.min.js"></script>
<script src="editormd/lib/prettify.min.js"></script>
<script src="editormd/lib/raphael.min.js"></script>
<script src="editormd/lib/underscore.min.js"></script>
<script src="editormd/lib/sequence-diagram.min.js"></script>
<script src="editormd/lib/flowchart.min.js"></script>
<script src="editormd/lib/jquery.flowchart.min.js"></script>
<script src="editormd/editormd.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="css/common/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link href="css/portal/detail.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文章细节</title>
</head>
<body>
	<c:import url="head.jsp"></c:import> 
	<div class="wrap">
		<div class="post-header">
			<h1 class="post-title">${detail.title }</h1>
			<div class="post-data">
				日期： ${detail.date }&nbsp;&nbsp;&nbsp;&nbsp;分类： ${detail.cate }&nbsp;&nbsp;&nbsp;&nbsp;标签：
				<c:forEach items="${tagList }" var="tag">${tag.name }/</c:forEach>
				&nbsp;&nbsp;&nbsp;&nbsp;阅读数： ${detail.readNum }&nbsp;&nbsp;&nbsp;&nbsp;评论数：
				${detail.commentNum }
			</div>
		</div>
		<div class="post-content" id="mdView" style="overflow-y: hidden">
			<textarea id="article_content">${detail.content}</textarea>
		</div>
		<div class="post-info">
			<p>
				本文由<a href="#">cier</a>创作，除注明转载/出处外，均为本站原创，转载前请务必署名
			</p>
		</div>
		<div class="comment-box">
			<form action="portal/add-new-comment" id="comment-form" method="post">
				<input type="hidden" id="hidden-article-id" value="${detail.id }"
					name="id"> <span class="tip"></span>
				<textarea class="comment-content" rows="" cols=""
					placeholder="说点什么吧.." name="content"></textarea>
			</form>
			<button type="button" class="btn btn-primary" id="commit-comment">提交评论</button>
		</div>
		<div class="comment">
			<c:forEach items="${comment }" var="comment">
				<div class="comment-view">
					<div class="comment-header">
						<p>评论人：${comment.name==null?"游客":comment.name }</p>
					</div>
					<div class="comment-context">
						<p>评论内容：${comment.content }</p>
					</div>
					<div class="comment-date">
						<p>评论时间：${comment.date }</p>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function mdToHtml() {
		//获取要显示的内容
		//var content = $("#article_content").text();
		editormd.markdownToHTML("mdView", {
			htmlDecode : "style,script,iframe",
			emoji : true,
			taskList : true,
			tex : true, // 默认不解析
			flowChart : true, // 默认不解析
			sequenceDiagram : true, // 默认不解析			
		});
	});
</script>
<script type="text/javascript" src="js/portal/detail.js"></script>
</html>