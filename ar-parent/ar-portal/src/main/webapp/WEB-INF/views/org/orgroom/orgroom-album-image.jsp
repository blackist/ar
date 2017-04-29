<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/views/portal-common/portal-tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>${orgroom.originName}相册-信电校友录</title>
<%@ include file="/WEB-INF/views/portal-common/portal-meta.jsp"%>
<link rel="stylesheet" href="assets/css/album.css" />
</head>

<body>
	<%@ include file="/WEB-INF/views/portal-common/header.jsp"%>
	<div class="container higher" id="container">
		<%@ include file="/WEB-INF/views/org/orgroom/orgroom-pageheader.jsp"%>
		<div class="mb5"></div>
		<!-- nav tab -->
		<%@ include file="/WEB-INF/views/org/orgroom/orgroom-nav.jsp"%>
		<input type="hidden" value="${orgroom.originId}" id="originId">
		<!-- Tab panes -->
		<div class="tab-content" style="background-color: #ddd;">
			<div class="album" style="width: 780px">
				<a class="album-pic" href="assets/images/photos/media2.png" title="Lion Rock"></a>
				<a class="album-pic" href="assets/images/photos/media4.png" title="Holsten Gate"></a>
				<a class="album-pic" href="assets/images/photos/media2.png" title="Blue Hour"></a>
				<a class="album-pic" href="assets/images/photos/media4.png" title="Holsten Gate"></a>
				<a class="album-pic" href="assets/images/photos/media2.png" title="Blue Hour"></a>
			</div>

			<%@ include file="/WEB-INF/views/portal-common/pagination.jsp"%>
		</div>
		<!-- Tab panes -->

	</div>
	<!-- container -->

	<%@ include file="/WEB-INF/views/portal-common/footer.jsp"%>

</body>
<%@ include file="/WEB-INF/views/portal-common/portal-js.jsp"%>
<script src="assets/js/album.js"></script>
<script src="assets/script/org/orgroom/orgroom-album-image.js"></script>
</html>