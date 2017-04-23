<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/views/portal-common/portal-tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>${orgroom.originName}-信电校友录</title>
<%@ include file="/WEB-INF/views/portal-common/portal-meta.jsp"%>
</head>
<body>

	<%@ include file="/WEB-INF/views/portal-common/header.jsp"%>

	<div class="container higher" id="container">
		<%@ include file="/WEB-INF/views/org/orgroom/orgroom-pageheader.jsp"%>
		<div class="mb5"></div>
		<!-- nav tab -->
		<%@ include file="/WEB-INF/views/org/orgroom/orgroom-nav.jsp"%>

		<!-- Tab panes -->
		<div class="tab-content" style="background-color: #ddd;">
			<div class="tab-pane active" id="orgroom-content">
				<!-- 动态编写 -->
				<div class="panel panel-dark panel-alt timeline-post" id="infoBox">
					<form action="orgroom/publishInfo.action" method="post" enctype="multipart/form-data" id="originInfoForm">
						<div class="panel-body" style="border-bottom: solid 5px #ddd">
							<input class="form-control" name="infoTitle" id="infoTitle" placeholder="标题">
						</div>
						<div class="mb5"></div>
						<div class="panel-body">
							<textarea class="form-control" placeholder="分享你的生活..." id="infoBoxText" maxlength="500" name="content"></textarea>
						</div>
						<div class="panel-footer" hidden="true" id="infoBoxEditor">
							<div class="timeline-btns pull-left">
								<a class="tooltips" data-toggle="tooltip" id="picUploadBtn" href="javascript:;"
								   data-original-title="添加图片"> <i class="glyphicon glyphicon-picture"></i></a>
								<a class="tooltips" title="" data-toggle="tooltip" href="javascript:;"
								   data-original-title="视频连接"> <i class="glyphicon glyphicon-facetime-video"></i></a>
								<a class="tooltips" title="" data-toggle="tooltip" href="javascript:;" data-original-title="定位">
								<i class="glyphicon glyphicon-map-marker"></i></a>
							</div>
							<button class="btn btn-primary pull-right" id="infoPostBtn"
								type="button" onclick="infoPublishValid()">发布动态</button>
						</div>
						<div class="panel-footer" hidden="true" id="picUploadBox">
							<div class="col-sm-4">
								<input class="file" type="file" id="uploadInput" multiple
									data-max-file-count="1" name="infoImage"
									accept=".bmp,.jpg,.gif,.png,.jpeg"> <br>
							</div>
						</div>
						<input type="hidden" name="originId" value="${orgroom.originId}">
					</form>
				</div>
				<!-- 动态列表 -->
				<div id="bloglist" class="row">
					<c:forEach items="${page.beanList}" var="info" varStatus="status">
						<div class="col-md-12">
							<div class="blog-item">
								<%----%>
								<c:if test="${info.infoImg!=null&&info.infoImg!=''}">
									<a href="classroom/infoDetail.action?classId=${orgroom.originId}&infoId=${info.infoId}" class="blog-img" target="blank">
										<img src="${info.infoImg}" class="img-responsive" style="max-height: 230px;" />
									</a>
								</c:if>
								<div class="blog-details">
									<div class="blog-summary">
										<ar:sub length="40" value="${info.infoTitle}" />
										<c:if test="${info.isTop == 1}">
											<span class='badge badge-danger'>置顶</span>
										</c:if>
										<br>
										<ul class="blog-meta">
											<li>By: <a href="ta/show.action?userId=${info.userId}">${info.trueName}</a></li>
											<li><fmt:formatDate value="${info.createTime}" pattern="yyyy-MM-dd HH:mm" /></li>
											<li><a href="orgroom/infoDetail.action?originId=${orgroom.originId}&infoId=${info.infoId}">评论(${info.comments})</a></li>
										</ul>
										<button class="btn btn-sm btn-white"
											onclick="javascript:location.href='orgroom/infoDetail.action?originId=${orgroom.originId}&infoId=${info.infoId}';">查看详情</button>
									</div>
								</div>
							</div>
							<!-- blog-item -->
						</div>
						<c:if test="${(status.index+1)%4==0}">
							<div class="row"></div>
						</c:if>
						<!-- col-xs-6 -->
					</c:forEach>
				</div>
				<input type="hidden" value="${orgroom.originId}" id="originId">
			</div>
			<%@ include file="/WEB-INF/views/portal-common/pagination.jsp"%>
		</div>
		<!-- Tab panes -->

	</div>
	<!-- container -->

	<%@ include file="/WEB-INF/views/portal-common/footer.jsp"%>

</body>
<%@ include file="/WEB-INF/views/portal-common/portal-js.jsp"%>
<script src="assets/script/org/orgroom/orgroom-info.js"></script>
</html>