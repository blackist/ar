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
				<i class="fa fa-user"></i> 个人中心 <span>我的简历</span>
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
					<li><a href="my/recruit.action"><span
							class="fa fa-archive"></span>&nbsp;<strong>我的招聘</strong></a></li>
					<li><a href="my/resume/posted.action"><span
							class="fa fa-chain"></span>&nbsp;<strong>我的投递</strong></a></li>
					<li class="active"><a href="my/resume.action"><span
							class="fa fa-file-text-o"></span>&nbsp;<strong>我的简历</strong></a></li>
				</ul>
				<!-- Nav Tab -->

				<!-- Tab panes -->
				<div class="tab-content">
					<ul class="filemanager-options">
						<li>
							<div class="ckbox ckbox-default">
								<input type="checkbox" id="selectall" value="1" />
								<label for="selectall">Select All</label>
							</div>
						</li>
						<li><a href="my/resume/addResume.action" class="itemopt"><i class="fa fa-plus"></i> 登记简历</a></li>
						<li><a href="" class="itemopt"></a></li>
						<li><a href="" class="itemopt"></a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- row -->
	</div>
	<!-- container -->

	<%@ include file="/WEB-INF/views/portal-common/footer.jsp"%>

</body>
<%@ include file="/WEB-INF/views/portal-common/portal-js.jsp"%>
<script src="assets/script/my/recruit/resume-index.js"></script>
</html>