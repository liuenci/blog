<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<base href="${cxt }/">
<link rel="stylesheet" href="css/portal/myblog.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>盗版CSDN</title>
</head>
<body>
	<div class="toolbar">
		<div class="main-page-img">
			<a href="myblog"><img src="img/portal/csdn.png"></a>
		</div>
		<ol class="nav-ol">
			<li>博客</li>
			<li>学院</li>
			<li>下载</li>
			<li>GitChat</li>
			<li>论坛</li>
			<li>问答</li>
			<li>商城</li>
			<li>VIP</li>
			<li>活动</li>
			<li>招聘</li>
			<li>ITeye</li>
			<li>CSTO</li>
		</ol>
		<input type="text" placeholder="搜索" class="search">
		<ol class="blog-ol">
			<li>写博客</li>
			<li>发chat</li>
			<li><a href="portal/login" id="btn-login">登录</a></li>
			<li id="btn-register"><a href="portal/register">注册</a></li>
		</ol>
	</div>
	<div class="nav_com">
		<ol class="cate_list">
			<li class="special">推荐</li>
			<li>最新文章</li>
			<li>关注</li>
			<li>咨询</li>
			<li>人工智能</li>
			<li>云计算/大数据</li>
			<li>区块链</li>
			<li>数据库</li>
			<li>程序人生</li>
			<li>游戏开发</li>
			<li>研发管理</li>
			<li>前端</li>
			<li>移动开发</li>
			<li>物联网</li>
			<li>运维</li>
			<li>计算机基础</li>
			<li>编程语言</li>
			<li>架构</li>
			<li>音视频开发</li>
			<li>安全</li>
			<li>其他</li>
		</ol>
	</div>
	<div class="center-box">
		<div class="carousel">
			<div class="carousel-left">
				<img alt="" src="img/portal/qukuailian.png">
			</div>
			<div class="carousel-right">
				<div class="carousel-top">
					<img alt="" src="img/portal/xianka.png">
				</div>
				<div class="carousel-bottom">
					<img alt="" src="img/portal/kuaiyingyong.png">
				</div>
			</div>
		</div>
		<div class="article-box">
			<ol class="article-ol">
				<c:forEach items="${artList}" var="art">
					<li>
						<div class="list_con">
							<div class="article-left">
								<div class="title">
									<input type="hidden" value="${art.id }" class="hidden-id">
									<span>${art.title }</span>
								</div>
								<dl class="list_userbar">
									<dd class="art_name">${art.name }</dd>
									<dd>${art.date }</dd>
									<dd>${art.cate }</dd>
								</dl>
							</div>
							<div class="read_num">
								<p class="num">${art.readNum }</p>
								<p class="text">阅读量</p>
							</div>
						</div>
					</li>
				</c:forEach>
			</ol>
		</div>
	</div>
	<div class="right-box">
		<h3 class="new-title">今日推荐</h3>
		<ol class="groom">
			<li>
				<div class="img-box">
					<img alt="" src="img/portal/groom.png">
				</div>
				<div class="groom-title">
					<p>升级区块链认知六问及行动路径3/24孟岩公开课</p>
				</div>
			</li>
			<li>
				<div class="img-box">
					<img alt="" src="img/portal/groom.png">
				</div>
				<div class="groom-title">
					<p>孟岩亮相TokenSky，首谈通证的多维、多阶、多</p>
				</div>
			</li>
			<li>
				<div class="img-box">
					<img alt="" src="img/portal/groom.png">
				</div>
				<div class="groom-title">
					<p>警方披露Uber撞人案细节，解密Uber自动驾驶系</p>
				</div>
			</li>
			<li>
				<div class="img-box">
					<img alt="" src="img/portal/groom.png">
				</div>
				<div class="groom-title">
					<p>一文告诉你Facebook的计算机视觉有多强</p>
				</div>
			</li>
			<li>
				<div class="img-box">
					<img alt="" src="img/portal/groom.png">
				</div>
				<div class="groom-title">
					<p>新世相难看的吃相：昨天你交智商税了吗？</p>
				</div>
			</li>
			<li>
				<div class="img-box">
					<img alt="" src="img/portal/groom.png">
				</div>
				<div class="groom-title">
					<p>开发者究竟想从云中得到什么？</p>
				</div>
			</li>
			<li>
				<div class="img-box">
					<img alt="" src="img/portal/groom.png">
				</div>
				<div class="groom-title">
					<p>我该跳槽吗？ 频繁跳槽能快速完成个人发展的跃</p>
				</div>
			</li>
			<li>
				<div class="img-box">
					<img alt="" src="img/portal/groom.png">
				</div>
				<div class="groom-title">
					<p>漫画：什么是八皇后问题？</p>
				</div>
			</li>
			<li>
				<div class="img-box">
					<img alt="" src="img/portal/groom.png">
				</div>
				<div class="groom-title">
					<p>OpenStack 快速进阶教程</p>
				</div>
			</li>
			<li>
				<div class="img-box">
					<img alt="" src="img/portal/groom.png">
				</div>
				<div class="groom-title">
					<p>【限时特价】《原则》</p>
				</div>
			</li>
		</ol>
	</div>
</body>
<script type="text/javascript" src="js/common/jquery-3.2.1.js"></script>
<script src="js/portal/myblog.js"></script>
</html>