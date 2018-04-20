<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${cxt }/">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/common/bootstrap.min.css">
<link rel="stylesheet" href="css/portal/comment.css">
<title></title>
</head>
<body>
	<div class="dpl">
		<div class="zpl">
			<div class="cpl">评论</div>

			<table border="0" cellspacing="0" cellpadding="0" class="zz">
				<thead id="head-box">
					<tr>
						<td><div class="tz">评论者</div></td>
						<td><div class="plj">评论</div></td>
						<td><div class="wzm">文章名</div></td>
						<td><div class="sjj">时间</div></td>
						<td>操作</td>
					</tr>
				</thead>
				<tbody class="body-box">
					<c:forEach items="${discuss }" var="dis">
						<tr>
							<td><div class="tz">${dis.name }</div></td>
							<td><div class="plj">${dis.content }</div></td>
							<td><div class="wzm">${dis.title }</div></td>
							<td><div class="sjj">${dis.date }</div></td>
							<td><input type="hidden" value="${dis.id }"
								class="hidden-comment-id">
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
					<p>是否删除该条评论？</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary confirm"
						data-dismiss="modal" id="save-tag">确定</button>
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
<script src="js/usercenter/comment.js" type="text/javascript"></script>
</html>