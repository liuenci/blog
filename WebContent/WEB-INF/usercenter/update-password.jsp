<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${cxt }/">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="css/common/bootstrap.min.css">
<link rel="stylesheet" href="css/usercenter/update-password.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>update-password</title>
</head>
<body>
	<div class="table-box">
		<form method="post" action="usercenter/update-password" id="update-form">
			<table class="password-table">
				<tbody>
					<tr class="ts-tr">
						<td class="frist"></td>
						<td class="second ts">${error }</td>
						<td class="third"></td>
					</tr>
					<tr>
						<td class="frist">旧密码：</td>
						<td class="second"><input type="password" id="old-password" name="old-password"></td>
						<td class="third"><span class="old-ts">*</span></td>
					</tr>
					<tr>
						<td class="frist">新密码：</td>
						<td class="second"><input type="password" id="new-password" name="new-password"></td>
						<td class="third"><span class="new-ts">*</span></td>
					</tr>
					<tr>
						<td class="frist">新密码：</td>
						<td class="second"><input type="password"
							id="repeat-password" name="repeat-password"></td>
						<td class="third"><span class="repeat-ts">*</span></td>
					</tr>
				</tbody>
			</table>
			<button type="button" class="btn btn-success btn-confirm">确认更新</button>
		</form>
	</div>
</body>
<script src="js/common/jquery-3.2.1.js" type="text/javascript"></script>
<script src="js/usercenter/update-password.js" type="text/javascript"></script>
</html>