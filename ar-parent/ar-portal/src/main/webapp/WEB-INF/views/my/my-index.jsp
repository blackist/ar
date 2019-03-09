<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<title>个人中心-信电校友录</title>
<%@ include file="/WEB-INF/views/portal-common/portal-meta.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/views/portal-common/header.jsp"%>
	<div class="container higher" id="container">
		<div class="pageheader">
			<h2>
				<i class="fa fa-user"></i> 个人中心 <span>个人主页</span>
			</h2>
			<div class="breadcrumb-wrapper">
				<span class="label"></span>
				<ol class="breadcrumb">
					<li><a href="index.action">首页</a></li>
					<li class="active">个人中心</li>
				</ol>
			</div>
		</div>
		<div class="mb5"></div>
		<div class="row">
			<!-- 侧边栏 -->
			<div class="col-sm-4 col-lg-2">
				<%@ include file="/WEB-INF/views/my/my-side.jsp"%>
			</div>
			<!-- 侧边栏 -->

			<div class="col-sm-8 col-lg-10">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="pull-right">
							<div class="btn-group mr10">
								<button class="btn btn-sm btn-white tooltips" type="button"
										data-toggle="tooltip" title="Archive">
									<i class="glyphicon glyphicon-hdd"></i>
								</button>
								<button class="btn btn-sm btn-white tooltips" type="button"
										data-toggle="tooltip" title="Report Spam">
									<i class="glyphicon glyphicon-exclamation-sign"></i>
								</button>
								<button class="btn btn-sm btn-white tooltips" type="button"
										data-toggle="tooltip" title="Delete">
									<i class="glyphicon glyphicon-trash"></i>
								</button>
							</div>

							<div class="btn-group mr10">
								<div class="btn-group nomargin">
									<button data-toggle="dropdown"
											class="btn btn-sm btn-white dropdown-toggle tooltips"
											type="button" title="Move to Folder">
										<i class="glyphicon glyphicon-folder-close mr5"></i> <span
											class="caret"></span>
									</button>
									<ul class="dropdown-menu">
										<li><a href="#"><i
												class="glyphicon glyphicon-folder-open mr5"></i>
											Conference</a></li>
										<li><a href="#"><i
												class="glyphicon glyphicon-folder-open mr5"></i>
											Newsletter</a></li>
										<li><a href="#"><i
												class="glyphicon glyphicon-folder-open mr5"></i>
											Invitations</a></li>
										<li><a href="#"><i
												class="glyphicon glyphicon-folder-open mr5"></i>
											Promotions</a></li>
									</ul>
								</div>
								<div class="btn-group nomargin">
									<button data-toggle="dropdown"
											class="btn btn-sm btn-white dropdown-toggle tooltips"
											type="button" title="Label">
										<i class="glyphicon glyphicon-tag mr5"></i> <span
											class="caret"></span>
									</button>
									<ul class="dropdown-menu">
										<li><a href="#"><i
												class="glyphicon glyphicon-tag mr5"></i> Web</a></li>
										<li><a href="#"><i
												class="glyphicon glyphicon-tag mr5"></i> Photo</a></li>
										<li><a href="#"><i
												class="glyphicon glyphicon-tag mr5"></i> Video</a></li>
									</ul>
								</div>
							</div>

							<div class="btn-group">
								<button class="btn btn-sm btn-white" type="button">
									<i class="glyphicon glyphicon-chevron-left"></i>
								</button>
								<button class="btn btn-sm btn-white" type="button">
									<i class="glyphicon glyphicon-chevron-right"></i>
								</button>
							</div>
						</div>
						<!-- pull-right -->

						<h5 class="subtitle mb5">Inbox</h5>
						<p class="text-muted">Showing 1 - 15 of 230 messages</p>
						<div class="table-responsive">
							<table class="table table-email">
								<tbody>
									<tr>
										<td>
											<div class="ckbox ckbox-success">
												<input type="checkbox" id="checkbox15"> <label
													for="checkbox15"></label>
											</div>
										</td>
										<td><a href="javascript:;" class="star"><i
												class="glyphicon glyphicon-star"></i></a></td>
										<td>
											<div class="media">
												<a href="#" class="pull-left"> <img alt=""
													src="${SESSION_USER.portrait}"
													class="media-object">
												</a>
												<div class="media-body">
													<span class="media-meta pull-right">Jan 12 at 5:30am</span>
													<h4 class="text-primary">Yanda Cerona</h4>
													<small class="text-muted"></small>
													<p class="email-summary">
														<strong>Last Chance For Insurance</strong> Ut enim ad
														minim veniam, quis nostrud exercitation...
													</p>
												</div>
											</div>
										</td>
									</tr>

								</tbody>
							</table>
						</div>
						<!-- table-responsive -->

					</div>
					<!-- panel-body -->
				</div>
			</div>
			<!-- col-lg-10 -->
		</div>
		<!-- row -->
	</div>

	<%@ include file="/WEB-INF/views/portal-common/footer.jsp"%>

</body>
<%@ include file="/WEB-INF/views/portal-common/portal-js.jsp"%>
<script src="${pageContext.request.contextPath}/assets/script/my/my-index.js"></script>
</html>