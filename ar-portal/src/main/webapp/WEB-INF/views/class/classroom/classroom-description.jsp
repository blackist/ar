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
				<div class="col-md-8">
					<form id="descForm" action="${pageContext.request.contextPath}/classroom/setDescription.action"
						class="form-horizontal" method="post">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">班级简介</h4>
							</div>
							<div class="panel-body">
								<div class="form-group">
									<div class="col-sm-12">
										<textarea rows="5" class="form-control" name="description"
											id="description" placeholder="为你的班级做个简介吧,200字以内"></textarea>
									</div>
								</div>
							</div>
							<input type="hidden" id="pastDesc" value="${classroom.classDesc}">
							<!-- panel-body -->
							<div class="panel-footer">
								<div class="row">
									<div class="col-sm-12 col-sm-offset-9">
										<button type="button" onclick="setDescription()"
											class="btn btn-primary">&nbsp;&nbsp;提&nbsp;交&nbsp;&nbsp;</button>
										<button type="reset" class="btn btn-default">&nbsp;&nbsp;重&nbsp;置&nbsp;&nbsp;</button>
									</div>
								</div>
							</div>
							<input id="dad_asfasdfsa_" type="hidden"
								value="${classroom.classId}" name="classId">
						</div>
						<!-- panel -->
					</form>
				</div>
			</div>
		</div>
		<!-- Tab panes -->
	</div>
	<!-- container -->
	<%@ include file="/WEB-INF/views/portal-common/footer.jsp"%>
</body>
<%@ include file="/WEB-INF/views/portal-common/portal-js.jsp"%>
<script src="${pageContext.request.contextPath}/assets/script/class/classroom/classroom-description.js"></script>
</html>