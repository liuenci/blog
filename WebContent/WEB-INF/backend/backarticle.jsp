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
<title>所有文章</title>
</head>
<body>
	<div class="wrap">
		<h1 class="inline-title">所有文章</h1>
		<div class="table-box">
			<table class="draft-table">
				<thead>
					<tr>
						<td>序号</td>
						<td>文章名</td>
						<td>分类名</td>
						<td>日期</td>
						<td>阅读量</td>
						<td>评论数</td>
						<td>用户名</td>
						<td>操作</td>
					</tr>
				</thead>
				<tbody id="body-box">
					<c:forEach items="${backArticle }" var="backArticle">
						<tr>
							<td>${backArticle.id }</td>
							<td>${backArticle.title }</td>
							<td>${backArticle.categories }</td>
							<td>${backArticle.date }</td>
							<td>${backArticle.views }</td>
							<td>${backArticle.discuss }</td>
							<td>${backArticle.name }</td>
							<td>
								<button type="button" class="btn btn-primary look-btn">查看文章</button>
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
					<p>是否删除该篇文章？</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary confirm"
						data-dismiss="modal" id="confirm">确定</button>
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
<script type="text/javascript" src="js/backend/backarticle.js"></script>
</html>