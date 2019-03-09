<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/views/portal-common/portal-tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>${classroom.classGrade}级${classroom.className}-信电校友录</title>
<%@ include file="/WEB-INF/views/portal-common/portal-meta.jsp"%>
</head>
<body>

	<%@ include file="/WEB-INF/views/portal-common/header.jsp"%>

	<div class="container higher" id="container">
		<%@ include
			file="/WEB-INF/views/class/classroom/classroom-pageheader.jsp"%>
		<div class="mb5"></div>
		<!-- nav tab -->
		<%@ include file="/WEB-INF/views/class/classroom/classroom-nav.jsp"%>

		<!-- Tab panes -->
		<div class="tab-content" style="background-color: #ddd;">
			<div class="tab-pane active" id="classroom-content">
				<!-- 动态编写 -->
				<div class="panel panel-dark panel-alt timeline-post" id="infoBox">
					<form action="${pageContext.request.contextPath}/classroom/publishClassMessage.action" method="post"
						enctype="multipart/form-data" id="classMessagePublishForm">
						<div class="panel-body">
							<textarea class="form-control" placeholder="留言..."
								id="infoBoxText" maxlength="200" name="content"></textarea>
						</div>
						<div class="panel-footer" hidden="true" id="infoBoxEditor">
							<button class="btn btn-primary pull-right" id="infoPostBtn"
								type="button" onclick="publishClassMessage()">发布留言</button>
						</div>
						<input id="dad_asfasdfsa_" type="hidden" name="classId"
							value="${classroom.classId}">
					</form>
				</div>
				<div id="bloglist" class="row">
					<c:forEach items="${page.beanList}" var="message"
						varStatus="status">
						<div class="col-md-12">
							<div class="blog-item">
								<div class="blog-details">
									<div class="blog-summary">
										<ar:sub length="210" value="${message.content}" />
										<br>
										<ul class="blog-meta">
											<li>By: <a
												href="ta/show.action?userId=${message.userId}">${message.userName}</a></li>
											<li><fmt:formatDate value="${message.createTime}"
													pattern="yyyy-MM-dd HH:mm" /></li>
										</ul>
									</div>
								</div>
							</div>
							<!-- blog-item -->
						</div>
						<!-- col-xs-6 -->
					</c:forEach>
				</div>
				<input type="hidden" value="${classroom.classId}" id="classId">
			</div>
			<%@ include file="/WEB-INF/views/portal-common/pagination.jsp"%>
		</div>
		<!-- Tab panes -->
	</div>
	<!-- container -->
	<%@ include file="/WEB-INF/views/portal-common/footer.jsp"%>
</body>
<%@ include file="/WEB-INF/views/portal-common/portal-js.jsp"%>
<script src="${pageContext.request.contextPath}/assets/script/class/classroom/classroom-message.js"></script>
</html>