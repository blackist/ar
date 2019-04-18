<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/ar-taglib" prefix="ar"%>
<!DOCTYPE html>
<html>
<head>
<title>校园服务-信电校友录</title>
<%@ include file="/WEB-INF/views/portal-common/portal-meta.jsp"%>
</head>
<body>
	<!-- 页头 -->
	<%@ include file="/WEB-INF/views/portal-common/header.jsp"%>

	<!-- 导航栏 -->
	<%@ include file="/WEB-INF/views/portal-common/navmenu.jsp"%>

	<!-- contact -->
	<div class="container higher">
		<div class="col-md-9 project1">
			<!-- 导航栏 -->
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i>&nbsp;<a href="${pageContext.request.contextPath}/index.action">主页</a></li>
				<li>&nbsp;<a href="${pageContext.request.contextPath}/service.action">校园服务</a></li>
				<li class="active">${service.infoTitle}</li>
			</ol>
			<img src="${pageContext.request.contextPath}/assets/images/e.jpg" class="img-responsive center-block"/>
			<p style="font-size: 16px">${service.content}</p>
		</div>
		<%@include file="/WEB-INF/views/service/service-list.jsp"%>
		<div class="clearfix"></div>
	</div>
	<!-- //contact -->

	<!-- 页脚 -->
	<%@ include file="/WEB-INF/views/portal-common/footer.jsp"%>
</body>
<%@ include file="/WEB-INF/views/portal-common/portal-js.jsp"%>
<script src="${pageContext.request.contextPath}/assets/script/message/contact-us.js"></script>
</html>