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
					<li><a href="${pageContext.request.contextPath}/index.action"><i class="fa fa-home"></i>&nbsp;首页</a></li>
					<li>|</li>
					<li><a href="${pageContext.request.contextPath}/message/contactUs.action">联系我们</a></li>
				</ul>
			</div>                      
			<div class="top_left">
				<ul>
					<c:choose>
						<c:when test="${SESSION_USER != null}">
							<li class="top_link">
								<a href="${pageContext.request.contextPath}/my/profile/basic.action" target="blank">
									<%--<c:if test="${SESSION_USER.portrait != null}">--%>
										<%--<img src="${SESSION_USER.portrait}" width="20px" class="img-circle"/>--%>
									<%--</c:if>--%>
									<%--<c:if test="${SESSION_USER.portrait == null}"><i class="fa fa-user"></i></c:if>--%>

									<c:if test="${SESSION_USER.trueName != null}"><i class="fa fa-user"></i>&nbsp;${SESSION_USER.trueName}</c:if>
									<c:if test="${SESSION_USER.trueName == null}">${SESSION_USER.account}</c:if>
								</a>
							</li>
							<li>|</li>
							<li class="top_link"><a href="${pageContext.request.contextPath}/login/logout.action">退出</a></li>
							<input class="logoutStyle" name="-gfj_jkb-fsjvbkcjadkcnkjsdnzxc"
								type="hidden" id="_sfhk_jbkjb_sfhk_"
								value="${SESSION_USER.userId}">
						</c:when>
						<c:otherwise>
							<li class="top_link"><a href="${pageContext.request.contextPath}/login.action">登录</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- header -->

<%@ include file="/WEB-INF/views/portal-main/login-alert.jsp"%>