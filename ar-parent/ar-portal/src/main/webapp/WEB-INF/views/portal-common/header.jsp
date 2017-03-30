<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/ar-taglib" prefix="ar"%>

<!-- header -->
<div class="top_bg">
	<div class="container">
		<div class="header_top-sec">
			<div class="top_right">
				<ul>
					<li><a href="index.action"><i class="fa fa-home"></i>&nbsp;首页</a></li>
					<li>|</li>
					<li><a href="message/contactUs.action">联系我们</a></li>
				</ul>
			</div>
			<div class="top_left">
				<ul>
					<c:choose>
						<c:when test="${SESSION_USER != null}">
							<li class="top_link"><a href="my.action" target="blank"><i class="fa fa-user"></i> ${SESSION_USER.userName}</a></li>
							<li>|</li>
							<li class="top_link"><a href="login/logout.action">退出</a></li>
							<input class="logoutStyle" name="-gfj_jkb-fsjvbkcjadkcnkjsdnzxc"
								type="hidden" id="_sfhk_jbkjb_sfhk_"
								value="${SESSION_USER.userId}">
						</c:when>
						<c:otherwise>
							<li class="top_link"><a href="login.action">登录</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<!-- header -->

<%@ include file="/WEB-INF/views/portal-main/login-alert.jsp"%>