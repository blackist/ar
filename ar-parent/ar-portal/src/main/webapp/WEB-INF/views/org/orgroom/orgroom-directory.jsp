<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/views/portal-common/portal-tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>${orgroom.originName}通讯录-信电校友录</title>
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
			<div class="tab-pane active" id="classroom-content">
				<ul class="letter-list">
					<c:forEach items="${letters}" var="letter">
						<li><a href="javascript:;">${letter}</a></li>
					</c:forEach>
				</ul>

				<div class="mb20"></div>

				<div class="people-list">
					<c:forEach items="${page.beanList}" var="directory">
						<div class="col-md-6">
							<div class="people-item">
								<div class="media">
									<a href="ta/show.action?userId=${directory.userId}"
										class="pull-left"> <img alt=""
										src="${directory.portrait}" class="thumbnail media-object">
									</a>
									<div class="media-body">
										<h4 class="person-name">${directory.trueName}</h4>
										<div class="text-muted">
											<i class="fa fa-map-marker"></i> ${directory.address}
										</div>
										<div class="text-muted">
											<i class="fa fa-briefcase"></i> 软件工程师 就职于<a href="javascript:;">上海证券交易所</a>
										</div>
										<ul class="social-list">
											<c:if test="${directory.phone!=null}">
												<li><a href="javascript:;" class="tooltips"
													data-toggle="tooltip" data-placement="top"
													title="手机：${directory.phone}"><i class="fa fa-mobile"></i></a></li>
											</c:if>
											<c:if test="${directory.email!=null}">
												<li><a href="javascript:;" class="tooltips"
													data-toggle="tooltip" data-placement="top"
													title="邮箱：${directory.email}"><i
														class="fa fa-envelope-o"></i></a></li>
											</c:if>
											<c:if test="${directory.qq!=null}">
												<li><a href="javascript:;" class="tooltips"
													data-toggle="tooltip" data-placement="top"
													title="QQ：${directory.qq}"><i class="fa fa-qq"></i></a></li>
											</c:if>
											<c:if test="${directory.wechat!=null}">
												<li><a href="javascript:;" class="tooltips"
													data-toggle="tooltip" data-placement="top"
													title="微信：${directory.wechat}"><i class="fa fa-wechat"></i></a></li>
											</c:if>
											<c:if test="${directory.microblog!=null}">
												<li><a href="javascript:;" class="tooltips"
													data-toggle="tooltip" data-placement="top"
													title="新浪微博：${directory.microblog}"><i
														class="fa fa-weibo"></i></a></li>
											</c:if>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!-- col-md-6 -->
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
<script src="assets/script/org/orgroom/orgroom-directory.js"></script>
</html>