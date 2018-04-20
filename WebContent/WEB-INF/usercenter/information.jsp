<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${cxt }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/usercenter/informaton.css">
<link rel="stylesheet" href="css/common/bootstrap.min.css">
<title>个人信息</title>
</head>
<body style="background-color: #E6E6E6;">
	<div>
		<form action="usercenter/information" method="post">
			<table class="biao">
				<tr>
					<td class="yh">用&nbsp;&nbsp;户&nbsp;&nbsp;名：</td>
					<td><input type="text" class="in update" name="umane"
						readonly="readonly" value="${user.name }"></td>
				</tr>
				<tr>
					<td class="yh">手机号码：</td>
					<td><input type="text" class="in update" name="phone"
						value="${user.phone }"></td>
				</tr>
				<tr>
					<td class="yh">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</td>
					<td><input type="text" class="in update" name="email"
						value="${user.email }"></td>
				</tr>
				<tr>
					<td class="lefttd yh">个人说明：</td>
					<td><textarea class="ta update" name="personal">${user.description }</textarea></td>
				</tr>
			</table>
			<button class="gx btn btn-success" id="update">更新个人资料</button>
		</form>
	</div>
</body>
</html>