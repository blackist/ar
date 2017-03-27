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
				<i class="fa fa-user"></i> 个人中心 <span>个人资料</span>
			</h2>
			<div class="breadcrumb-wrapper">
				<span class="label"></span>
				<ol class="breadcrumb">
					<li><a href="index.action">主页</a></li>
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
				<!-- Nav tabs -->
				<ul class="nav nav-tabs">
					<li><a href="my/profile/basic.action"><span
							class="glyphicon glyphicon-th-list"></span>&nbsp;<strong>基本资料</strong></a></li>
					<li><a href="my/profile/detail.action"><span
							class="glyphicon glyphicon-paperclip"></span>&nbsp;<strong>详细资料</strong></a></li>
					<li class="active"><a href="javascript:;"><span
							class="glyphicon glyphicon-briefcase"></span>&nbsp;<strong>工作信息</strong></a></li>
					<li><a href="my/profile/portrait.action"><span
							class="glyphicon glyphicon-picture"></span>&nbsp;<strong>头像设置</strong></a></li>
				</ul>
				<!-- Nav Tab -->

				<!-- Tab panes -->
				<div class="tab-content">
					<div class="tab-pane active" id="tab-job"></div>
				</div>
			</div>
		</div>
		<!-- row -->
	</div>
	<!-- container -->

	<%@ include file="/WEB-INF/views/portal-common/footer.jsp"%>

</body>
<%@ include file="/WEB-INF/views/portal-common/portal-js.jsp"%>
<script src="assets/script/my/profile/profile-job.js"></script>
</html>