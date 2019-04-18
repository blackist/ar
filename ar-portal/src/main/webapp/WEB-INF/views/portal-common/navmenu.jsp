<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- navmenu -->
<div class="mega_nav">
	<div class="container">
		<div class="menu_sec">
			<!-- start header menu -->
			<ul class="megamenu skyblue">
				<li id="nav-home"><a class="color1" href="${pageContext.request.contextPath}/index.action">首页</a></li>
				<li id="nav-news"><a class="color1" href="${pageContext.request.contextPath}/news.action">新闻中心</a></li>
				<li id="nav-class"><a class="color1" href="${pageContext.request.contextPath}/class.action">班级录</a></li>
				<li id="nav-org"><a class="color1" href="${pageContext.request.contextPath}/org/institute.action">校友组织</a></li>
				<li id="nav-forum"><a class="color1" href="${pageContext.request.contextPath}/forum.action">校友论坛</a></li>
				<li id="nav-recruit"><a class="color1" href="${pageContext.request.contextPath}/recruit.action">职业招聘</a></li>
				<li id="nav-contact"><a class="color1" href="${pageContext.request.contextPath}/service.action">校园服务</a></li>
				<li>
					<div class="search" style="max-width: 300px;">
						<input type="text" value="" placeholder="搜索 ...">
						<input type="submit" value="" onclick="superSearch()">
					</div>
				</li>
			</ul>
			<div class="clearfix"></div>
		</div>
		<!-- -->
	</div>
</div>
<!-- navmenu -->

<!-- js -->
<script src="${pageContext.request.contextPath}/assets/script/portal-common/navmenu.js"></script>
