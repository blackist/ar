<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/views/portal-common/portal-tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>${classroom.className}相册-信电校友录</title>
<%@ include file="/WEB-INF/views/portal-common/portal-meta.jsp"%>
</head>

<body>
	<%@ include file="/WEB-INF/views/portal-common/header.jsp"%>
	<div class="container higher" id="container">
		<%@ include file="/WEB-INF/views/class/classroom/classroom-pageheader.jsp"%>
		<div class="mb5"></div>
		<!-- nav tab -->
		<%@ include file="/WEB-INF/views/class/classroom/classroom-nav.jsp"%>
		<input type="hidden" value="${classroom.classId}" id="classId">
		<!-- Tab panes -->
		<div class="tab-content" style="background-color: #ddd;">

			
		</div>
		<!-- Tab panes -->

	</div>
	<!-- container -->

	<%@ include file="/WEB-INF/views/portal-common/footer.jsp"%>

</body>
<%@ include file="/WEB-INF/views/portal-common/portal-js.jsp"%>
<script src="assets/script/class/classroom/classroom-album.js"></script>
</html>