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
			<div class="row filemanager">
				<c:forEach items="${page.beanList}" var="album" >
					<div class="col-xs-6 col-sm-4 col-md-3 document">
						<div class="thmb" style="min-height: 228px">
							<div class="thmb-prev">
								<a href="classroom/album/image.action?albumId=${album.albumId}&classId=${album.originId}">
									<img src="${album.coverImage}" class="img-responsive center-block" style="min-height: 160px"/>
								</a>
							</div>
							<h5 class="fm-title">
								<a href="classroom/album/image.action?albumId=${album.albumId}&classId=${album.originId}">${album.albumName}</a>
							</h5>
							<small class="text-muted">更新于:<fmt:formatDate value="${album.stateTime}" pattern="yyyy-MM-dd HH:mm" /></small>
						</div><!-- thmb -->
					</div><!-- col-xs-6 -->
				</c:forEach>
			</div><!-- file manager -->
			<%@ include file="/WEB-INF/views/portal-common/pagination.jsp"%>
		</div>
		<!-- Tab panes -->

	</div>
	<!-- container -->

	<%@ include file="/WEB-INF/views/portal-common/footer.jsp"%>

</body>
<%@ include file="/WEB-INF/views/portal-common/portal-js.jsp"%>
<script src="assets/script/class/classroom/classroom-album.js"></script>
</html>