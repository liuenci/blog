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
<title>用戶</title>
</head>
<body>
	<div class="wrap">
		<h1 class="inline-title">用户</h1>
		<div class="table-box">
			<table class="draft-table">
				<thead>
					<tr>
						<td>序号</td>
						<td>姓名</td>
						<td>电话号码</td>
						<td>email</td>
						<td>描述</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${user }" var="user">
						<tr>
							<td>${user.id }</td>
							<td>${user.name }</td>
							<td>${user.phone }</td>
							<td>${user.email }</td>
							<td>${user.description }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>