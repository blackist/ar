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
													src="assets/images/photos/profile-2.jpg"
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
<script src="assets/script/my/my-index.js"></script>
</html>