<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${cxt}/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>仪表盘</title>
</head>
<frameset rows="50px,*" border="0" framespacing="1">
	<frame src="backend/header" name="top" scrolling="no"/>
	<frameset cols="160px,*">
		<frame src="backend/left" scrolling="no" name="left" />
		<frame src="backend/show" name="right"/>
	</frameset>
</frameset>
</html>