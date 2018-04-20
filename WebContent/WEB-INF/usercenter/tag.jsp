<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${cxt }/">
<link rel="stylesheet" href="css/common/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/usercenter/tag.css">
<title>标签</title>
</head>
<body>
	<div class="bq">
		<form action="usercenter/tag-manage" method="post">
			<div class="bq1">
				<div class="bqt">标签</div>
				<div class="tjbq">添加新标签</div>
				<div class="bqxg">
					<input class="bqmc add" type="text" name="label" placeholder="请输入标签"/>
				</div>
				<div class="bqtj">
					<button class="tjwc btn btn-primary" id="add">添加新标签</button>
				</div>
			</div>
		</form>
		<div class="bq2">
			<div class="bqt">显示标签</div>
			<table cellspacing="0" cellpadding="0" id="tag-table">
				<thead>
					<tr>
						<td>序号</td>
						<td>名称</td>
						<td>操作</td>
					</tr>
				</thead>
				<tbody id="tag-tbody">
					<c:set value="1" var="st" />
					<c:forEach items="${allTag }" var="tag">
						<tr>
							<td>${st}<c:set value="${st+1 }" var="st" /></td>
							<td>${tag.name }</td>
							<td><button class="btn btn-primary updateBtn" type="button">修改</button>
								<button class="btn btn-danger deleteBtn" type="button">删除</button>
								<input type="hidden" value="${tag.id }" class="hiddenId" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="modal" id="mymodal">
		<div class="modal-dialog">
			<form action="usercenter/update-tag" method="post" id="update-name-form">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">提示</h4>
					</div>
					<div class="modal-body">
						<h4>请输入标签名：</h4>
						<input type="hidden" value="" name="id" id="tag-hidden-id">
						<input type="text" value="" name="name" id="tag-origin-name">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary confirm"
							data-dismiss="modal" id="save-tag">确定修改</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消修改</button>
					</div>
				</div>
			</form>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
</body>
<script src="js/common/jquery-3.2.1.js" type="text/javascript"></script>
<script src="js/common/bootstrap.min.js" type="text/javascript"></script>
<script src="js/usercenter/tag.js" type="text/javascript"></script>
</html>