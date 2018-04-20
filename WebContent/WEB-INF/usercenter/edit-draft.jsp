<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<base href="${cxt }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Custom styles for this template -->

<link rel="stylesheet" href="editormd/css/style.css" />
<link rel="stylesheet" href="editormd/css/editormd.css" />
<script src="editormd/js/zepto.min.js"></script>
<script src="editormd/js/editormd.js"></script>
<link rel="stylesheet" href="css/common/bootstrap.min.css" />
<link rel="stylesheet" href="css/usercenter/edit.css" />
</head>
<body>
	<form action="usercenter/write-article" method="post"
		id="write_article_form">
		<div class="warp">
			<div class="left">
				<h1 class="heading-inline">编辑草稿</h1>
				<div class="title-div">
					<input type="hidden" value="${draft.id }" id="draft-id" name="id">
					<input type="text" autocomplete="off" placeholder="在此输入标题"
						name="title" value="${draft.title }">
				</div>
				<div class="editormd" id="mdView">
					<textarea name="content">${draft.content }</textarea>
				</div>
			</div>
			<div class="right">
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
	</form>
</body>
<script type="text/javascript">
	var testEditor;
	var jQuery = Zepto;
	$(function() {
		testEditor = editormd("mdView", {
			width : 800,
			height : 520,
			path : 'editormd/lib/',
			codeFold : true,
			searchReplace : true,
			saveHTMLToTextarea : true, // 保存 HTML 到 Textarea                   
			htmlDecode : "style,script,iframe|on*", // 开启 HTML 标签解析，为了安全性，默认不开启
			emoji : true,
			taskList : true,
			tocm : true,
			tex : true,
			flowChart : true,
			sequenceDiagram : true,
			imageUpload : true,
			imageFormats : [ "jpg", "jpeg", "gif", "png", "bmp", "webp" ],
			imageUploadURL : "/Blog/UploadPic",
			//后台只需要返回一个 JSON 数据				      
			onload : function() {
				//console.log("onload =>", this, this.id, this.settings);
			}
		});
		editor.setToolbarAutoFixed(false);//工具栏自动固定定位的开启与禁用               
	});
</script>
<script type="text/javascript" src="js/common/jquery-3.2.1.js"></script>
<script type="text/javascript" src="js/usercenter/edit-draft.js"></script>
</html>