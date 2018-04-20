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
<link rel="stylesheet" href="css/backend/classification.css">
<title>分类标签</title>
</head>
<body>
	<div class="wrap">
		<h1 class="inline-title">分类标签</h1>
		<div><button type="button" class="btn btn-primary tj">添加标签</button></div>
		<div class="table-box">
			<table class="draft-table">
				<thead>
					<tr>
						<td>序号</td>
						<td>分类名</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${cate }" var="cate">
						<tr>
							<td>${cate.id }</td>
							<td>${cate.name }</td>
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
				    <form action="backend/classification" method="post" id="add">
					<h4>请输入新标签<input type="text" name="catename"/></h4>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary confirm" data-dismiss="modal" id="save-tag" onclick="updateClassification()">确定</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
</body>

<script src="js/common/jquery-3.2.1.js" type="text/javascript"></script>
<script src="js/common/bootstrap.min.js" type="text/javascript"></script>
<script src="js/backend/classification.js" type="text/javascript"></script>
</html>