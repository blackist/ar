<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="/WEB-INF/views/global/base-path.jsp" %>
<%@ include file="/WEB-INF/views/global/manage-title.jsp"%>
<%@ include file="/WEB-INF/views/global/manage-meta.jsp"%>
<%@ include file="/WEB-INF/views/global/common-css.jsp"%>
<%@ include file="/WEB-INF/views/global/common-js.jsp"%>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/global/header.jsp" %>

	<!-- 主管理区域 admin-main -->
	<div class="am-cf admin-main">

		<!-- 侧边栏 side bar start -->
		<div class="admin-sidebar">

			<!-- bar -->
			<jsp:include page="/WEB-INF/views/global/sidebar.jsp"></jsp:include>

		</div>
		<!-- side bar end -->

		<!-- 内容区域 content start -->
		<div class="admin-content" id="admin-content"></div>
		<!-- content end -->

	</div>

	<!-- footer -->
	<%@ include file="/WEB-INF/views/global/footer.jsp" %>
	
	<!-- 控制js -->
	<script src="${pageContext.request.contextPath}/assets/script/main/index.js"></script>
</body>
</html>