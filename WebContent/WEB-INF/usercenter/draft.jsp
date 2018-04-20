<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${cxt }/">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/common/bootstrap.min.css">
<link rel="stylesheet" href="css/usercenter/draft.css">
<title>草稿箱</title>
</head>
<body>
	<div class="wrap">
		<h1 class="inline-title">草稿箱</h1>
		<div class="search">
			<input type="text" class="search-box" placeholder="文章名 分类 日期">
			<button type="button" class="btn btn-info search-btn">搜索</button>
		</div>
		<div class="table-box">
			<table class="draft-table">
				<thead>
					<tr>
						<td>作者</td>
						<td>文章名</td>
						<td>分类名</td>
						<td>日期</td>
						<td>阅读数</td>
						<td>操作</td>
					</tr>
				</thead>
				<tbody class="body-box">
					<c:forEach items="${draftList}" var="draft">
						<tr>
							<td>${draft.name }</td>
							<td>${draft.title }</td>
							<td>${draft.cate }</td>
							<td>${draft.date }</td>
							<td>${draft.cNum }</td>
							<td>
								<input type="hidden" value="${draft.id }" class="hidden-draft-id">
								<button type="button" class="btn btn-primary edit-btn">编辑文章</button>
								<button type="button" class="btn btn-danger delete-btn">删除</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="modal" id="mymodal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">提示</h4>
				</div>
				<div class="modal-body">
					<p>是否删除该篇草稿？</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary confirm" data-dismiss="modal">确定</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
</body>
<script type="text/javascript" src="js/common/jquery-3.2.1.js"></script>
<script src="js/common/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/usercenter/draft.js"></script>
</html>