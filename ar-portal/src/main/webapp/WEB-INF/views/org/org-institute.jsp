<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/views/portal-common/portal-tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>院系分会-信电校友录</title>
<%@ include file="/WEB-INF/views/portal-common/portal-meta.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/views/portal-common/header.jsp"%>

	<%@ include file="/WEB-INF/views/portal-common/navmenu.jsp"%>

	<div class="container higher" id="container">
		<section>
			<!-- 导航栏 -->
			<div class="header">
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i>&nbsp;<a href="${pageContext.request.contextPath}/index.action">主页</a></li>
					<li class="active">校友组织</li>
				</ol>
			</div>
			<div class="row">
				<div class="col-sm-9">
					<%@include file="/WEB-INF/views/org/org-tab.jsp"%>
					<div id="bloglist" class="row" style="position: relative;">
						<c:forEach items="${masses}" var="mass">
							<div class="col-sm-3">
								<div class="blog-item">
									<div class="blog-details">
										<h5 class="blog-title">
											<a href="${pageContext.request.contextPath}/orgroom.action?originId=${mass.originId}"><i class="fa fa-institution"></i> <ar:sub length="10" value="${mass.originName}" /></a>
										</h5>
										<ul class="blog-meta">
											<li>最近活动：<fmt:formatDate value="${mass.stateTime}" pattern="YYYY-MM-dd"></fmt:formatDate></li>
											<li>成员：<a href="${pageContext.request.contextPath}/orgroom/members.action?originId=${mass.originId}">${mass.members}</a></li>
										</ul>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<%--outline div--%>
				<div class="col-sm-3" id="org-outline">
					<img src="${pageContext.request.contextPath}/assets/images/icon/loading/loader.gif" class="center-block">
				</div>
				<%--outline div--%>
			</div>
		</section>
	</div>

	<%@ include file="/WEB-INF/views/portal-common/footer.jsp"%>

</body>
<%@ include file="/WEB-INF/views/portal-common/portal-js.jsp"%>
<script src="${pageContext.request.contextPath}/assets/script/org/org-institute.js"></script>
</html>