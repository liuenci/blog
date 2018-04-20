<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${cxt }/">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/common/bootstrap.min.css">
<link rel="stylesheet" href="css/portal/main.css" type="text/css">
<title>首页</title>
</head>
<body>
	<div id="warp">
		<%@ include file="head.jsp"%>
		<div class="background_img_div">
			<div class="header-left">
				<div class="header-left-name">${name }</div>
				<div class="header-left-des">${description }</div>
			</div>
			<div class="header-right">
				<button type="button" class="btn btn-primary bsize">修改个人资料</button>
				<button type="button" class="btn btn-primary bsize">管理博客</button>
			</div>
			<div class="container">
				<div class="left">
					<div class="blog-control">
						<div class="only-user">
							<button type="button" class="btn btn-primary user-button">只看原创</button>
						</div>
						<div class="search-article">
							<input type="text" placeholder="搜博主文章" class="search-input" />
						</div>
					</div>
					<c:forEach items="${art }" var="art">
						<div class="blog-unit">
							<div class="blog-title">
								<a href="portal/article/detail?id=${art.id}">${art.title }</a>
							</div>
							<div class="blog-content">${art.content }...</div>
							<div class="blog-bottom">
								<span class="yc">原创</span> <span class="sj">${art.date }</span>
								<div class="read-box">
									<img alt="" src="img/portal/read.png" class="read-img"> <span
										class="yds">${art.cNum }</span>
								</div>
								<div class="comment-box">
									<img alt="" src="img/portal/comment.png" class="comment-img">
									<span class="pls">${art.dNum }</span>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="right">
					<div class="user-info">
						<div class="info-bar">
							<img alt="" src="img/portal/logo.jpg" class="img-box">
							<h4 class="blog-name">${name }</h4>
						</div>
						<div class="info-num">
							<dl class="info-cate first-cate">
								<dt>原创</dt>
								<dd>5</dd>
							</dl>
							<dl class="info-cate">
								<dt>粉丝</dt>
								<dd>5</dd>
							</dl>
							<dl class="info-cate">
								<dt>喜欢</dt>
								<dd>5</dd>
							</dl>
							<dl class="info-cate">
								<dt>评论</dt>
								<dd>5</dd>
							</dl>
						</div>
					</div>
					<div class="article-cate">
						<h3 class="cate-header">文章分类</h3>
						<div class="cate-list">
							<ol class="cate-ol">
								<c:forEach items="${cateNumList }" var="cateNumList">
									<li><span class="cate-name"><a>${cateNumList.name }</a></span><span
										class="cate-num">${cateNumList.num }篇</span></li>
								</c:forEach>
							</ol>
						</div>
					</div>
					<div class="article-archive">
						<h3 class="arch-header">文章存档</h3>
						<div class="arch-list">
							<ol class="arch-ol">
								<c:forEach items="${monthNumList }" var="monthNumList">
									<li><span class="cate-name"><a>${monthNumList.month }</a></span><span
										class="cate-num">${monthNumList.num }篇</span></li>
								</c:forEach>
							</ol>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>