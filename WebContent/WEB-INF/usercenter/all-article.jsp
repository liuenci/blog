<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${cxt }/">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/common/bootstrap.min.css">
<link rel="stylesheet" href="css/usercenter/allArticle.css">
<title>文章管理</title>
</head>
<body>
	<div class="dpl">
		<div class="zpl">
			<div class="cpl">文章</div>
			<div class="search-div">
				<input type="text" class="search-input" placeholder="标题 目录 日期">
				<button class="btn btn-info search" type="button">搜索</button>
			</div>
			<table border="0" cellspacing="0" cellpadding="0" class="zz">
				<thead class="art-hred">
					<tr>
						<td style="width: 15%">标题</td>
						<td style="width: 10%">作者</td>
						<td style="width: 10%">分类目录</td>
						<td style="width: 10%">评论数</td>
						<td style="width: 15%">日期</td>
						<td style="width: 10%">Views</td>
						<td style="width: 20%">操作</td>
					</tr>
				</thead>
				<tbody id="body-box">
					<c:forEach items="${allarticle }" var="allarticle">
						<tr>
							<td>${allarticle.title }</td>
							<td>${allarticle.name }</td>
							<td>${allarticle.directory }</td>
							<td>${allarticle.discusses }</td>
							<td>${allarticle.date }</td>
							<td>${allarticle.views }</td>
							<td><input type="hidden" value="${allarticle.id }">
								<button type="button" class="btn btn-primary delete-btn">删除</button>
								<button type="button" class="btn btn-success look-btn">查看</button>
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
<script type="text/javascript" src="js/usercenter/all-article.js"></script>
</html>