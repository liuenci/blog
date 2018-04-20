<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<base href="${cxt }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/common/bootstrap.min.css">
<link rel="stylesheet" href="css/usercenter/write-article.css"
	type="text/css">
<title>右侧栏</title>
</head>
<body>
	<form action="usercenter/write-article" method="post"
		id="write_article_form">
		<div id="right">
			<div class="wrap">
				<h1 class="heading-inline">编辑草稿</h1>
				<div class="title_div">
					<input type="hidden" value="${draft.id }" id="draft-id" name="id">
					<input type="text" autocomplete="off" placeholder="在此输入标题"
						name="title" value="${draft.title }">
				</div>
				<div class="editor_area">
					<%@ include file="editor.jsp"%>
				</div>
				<div id="other">
					<div id="upload">
						<div class="upload_header">发布</div>
						<div class="upload_type">
							<button class="btn btn-primary save_draft" type="button">保存草稿</button>
							<button class="btn btn-primary  release" id="release_id"
								type="button">发布</button>
						</div>
					</div>
					<div id="article_type">
						<div class="a_header">分类</div>
						<input type="hidden" id="hidden-id" value="${draft.cateId }">
						<div class="art_type">
							<ol class="art_list">
								<c:forEach items="${cate }" var="cate">
									<li><input type="radio" value="${cate.id }" name="a_type"><span
										class="cate_class">${cate.name }</span></li>
								</c:forEach>
							</ol>
						</div>
					</div>
					<div id="article_tag">
						<div class="tag_header">标签</div>
						<div class="tag_div">
							<ol class="tag_list">
								<c:forEach items="${tag }" var="tag">
									<li><input type="checkbox" value="${tag.id }"
										name="tag_type"><span class="tag_class">${tag.name }</span></li>
								</c:forEach>
							</ol>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
<script type="text/javascript" src="js/common/jquery-3.2.1.js"></script>
<script type="text/javascript" src="js/usercenter/main.js"></script>
<script type="text/javascript" src="js/usercenter/write-draft.js"></script>
</html>