<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${cxt }/">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/portal/comment.css">
<title></title>
</head>
<body>
	<div class="dpl">
		<div class="zpl">
			<div class="cpl">评论</div>
			<table border="0" cellspacing="0" cellpadding="0" class="zz">
				<tr>
					<td><div class="fxk"></div></td>
					<td><div class="tz">评论者</div></td>
					<td><div class="plj">评论</div></td>
					<td><div class="wzm">文章名</div></td>
					<td><div class="sjj">时间</div></td>
				</tr>
				<c:forEach items="${discuss }" var="dis">
					<tr>
						<td><div class="fxk">
								<input type="checkbox" name="" id="" value="" class="fx" />
							</div></td>
						<td><div class="tz">${dis.name }</div></td>
						<td><div class="plj">${dis.content }</div></td>
						<td><div class="wzm">${dis.title }</div></td>
						<td><div class="sjj">${dis.date }</div></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>