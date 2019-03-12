<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/global/common-taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="/WEB-INF/views/global/base-path.jsp"%>
<title>发布招聘-后台管理</title>
<%@ include file="/WEB-INF/views/global/manage-meta.jsp"%>
<%@ include file="/WEB-INF/views/global/common-css.jsp"%>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/global/header.jsp"%>

	<!-- 主管理区域 admin-main -->
	<div class="am-cf admin-main">
		<!-- 侧边栏 side bar start -->
		<div class="admin-sidebar">
			<%@ include file="/WEB-INF/views/global/sidebar.jsp"%>
		</div>
		<!-- side bar end -->

		<!-- 内容区域 content start -->
		<div class="admin-content" id="admin-content">
			<div class="am-cf am-padding">
				<div class="am-fl am-cf">
					<strong class="am-text-primary am-text-lg">职业招聘</strong> / <small><a
						href="${pageContext.request.contextPath}/job.action">招聘信息</a></small> / <small>发布招聘</small>
				</div>
			</div>
			<div class="am-tabs am-margin">
				<ul class="am-tabs-nav am-nav am-nav-tabs">
					<li><a href="javascript:;">单位信息</a></li>
					<li class="am-active"><a href="javascript:;">招聘信息</a></li>
					<li><a href="javascript:;">完成发布</a></li>
				</ul>

				<div class="am-tabs-bd">
					<br>
					<div
						class="am-progress am-progress-striped am-progress-sm am-active mymargin">
						<div class="am-progress-bar am-progress-bar-secondary"
							style="width: 66.6%"></div>
					</div>
					<div class="am-tab-panel am-fade am-in am-active" id="job-tag">
						<form class="am-form" id="jobForm"
							action="${pageContext.request.contextPath}/job/createJobSubmit.action" method="post">
							<div class="am-u-sm-1 am-text-right">
								<strong>基本信息</strong>
							</div>
							<br>
							<hr>
							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">*招聘标题</div>
								<div class="am-u-sm-4 am-text-left">
									<input class="am-input-sm" maxlength="20" name="title"
										id="title"
										data-am-popover="{content:'2-20字之间',trigger:'hover focus'}"
										type="text">
								</div>
								<div class="am-u-sm-6 am-text-right"></div>
							</div>

							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">*招聘人数</div>
								<div class="am-u-sm-4 am-text-left">
									<input class="am-input-sm" maxlength="4" type="text"
										name="members" id="members"
										onkeyup='this.value=this.value.replace(/\D/gi,"")'>
								</div>
								<div class="am-u-sm-6 am-text-left"></div>
							</div>


							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">*学历要求</div>
								<div class="am-u-sm-4 am-text-left">
									<select data-am-selected="{btnSize: 'sm'}" class="am-input-sm"
										id="prof" name="prof" required="required">
										<option value="">请选择</option>
										<c:forEach items="${jobProf}" var="prof">
											<option value="${prof.value}">${prof.name}</option>
										</c:forEach>
									</select>
								</div>
								<div class="am-u-sm-6 am-text-left">及以上</div>
							</div>

							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">*每月薪资</div>
								<div class="am-u-sm-4 am-text-left">
									<select data-am-selected="{btnSize: 'sm'}" class="am-input-sm"
										id="salary" name="salary" required="required">
										<option value="">请选择</option>
										<c:forEach items="${jobSalary}" var="salary">
											<option value="${salary.value}">${salary.name}</option>
										</c:forEach>
									</select>
								</div>
								<div class="am-u-sm-6 am-text-left"></div>
							</div>
							<br>


							<div class="am-u-sm-1 am-text-right">
								<strong>职位信息</strong>
							</div>
							<br>
							<hr>
							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">*职位名称</div>
								<div class="am-u-sm-4 am-text-left">
									<input class="am-input-sm" maxlength="20" name="posName"
										id="posName"
										data-am-popover="{content:'2-20字之间',trigger:'hover focus'}"
										type="text">
								</div>
								<div class="am-u-sm-6 am-text-left"></div>
							</div>

							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">*职位描述</div>
								<div class="am-u-sm-8">
									<textarea rows="10" maxlength="500"
										data-am-popover="{content:'50-500字之间',trigger:'hover focus'}"
										id="posDesc" name="posDesc">${job.posDesc}</textarea>
								</div>
								<div class="am-u-sm-2"></div>
							</div>

							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">福利待遇</div>
								<div class="am-u-sm-8 am-text-left">
									<c:forEach items="${jobBenefit}" var="benefit">
										<input type="checkbox" class="am-checkbox-inline"
											name="benefit" value="${benefit.value}">${benefit.name}
									</c:forEach>
								</div>
								<div class="am-u-sm-2 am-text-left"></div>
							</div>

							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">*工作地址</div>
								<div class="am-u-sm-4 am-text-left">
									<input class="am-input-sm" maxlength="20" name="workPlace"
										id="workPlace"
										data-am-popover="{content:'工作地点在2-50字之间',trigger:'hover focus'}"
										type="text">
								</div>
								<div class="am-u-sm-6 am-text-left"></div>
							</div>

							<div class="am-u-sm-1 am-text-right">
								<strong>联系方式</strong>
							</div>
							<br>
							<hr>
							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">*联系人</div>
								<div class="am-u-sm-4 am-text-left">
									<input class="am-input-sm" maxlength="20" name="leaderName"
										id="leaderName"
										data-am-popover="{content:'2-20字之间',trigger:'hover focus'}"
										type="text">
								</div>
								<div class="am-u-sm-6 am-text-left"></div>
							</div>

							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">*联系方式</div>
								<div class="am-u-sm-4 am-text-left">
									<input class="am-input-sm" maxlength="20" name="leaderPhone"
										id="leaderPhone"
										data-am-popover="{content:'30字之间',trigger:'hover focus'}"
										type="text">
								</div>
								<div class="am-u-sm-6 am-text-left"></div>
							</div>

							<div class="am-u-sm-1 am-text-right">
								<strong>状态设置</strong>
							</div>
							<br>
							<hr>
							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">是否置顶</div>
								<div class="am-u-sm-4 am-text-left">
									<div class="am-btn-group" data-am-button="">
										<label class="am-btn am-btn-default am-btn-xs"> <input
											type="radio" name="isTop" value="1"> 是
										</label> <label class="am-btn am-btn-default am-btn-xs am-active">
											<input type="radio" name="isTop" value="0" checked="checked">
											否
										</label>
									</div>
								</div>
								<div class="am-u-sm-6 am-text-left"></div>
							</div>
							<input type="hidden" name="unitId" value="${unitId}">
						</form>
					</div>
				</div>
			</div>

			<div class="am-margin">
				<div class="am-u-sm-10 am-text-right">
					<button type="button" class="am-btn am-btn-primary am-btn-xs" onclick="createJobSubmit()" id="subBtn">下一步</button>
				</div>
				<br>
			</div>
		</div>
		<!-- content end -->
	</div>

	<!-- footer -->
	<%@ include file="/WEB-INF/views/global/footer.jsp"%>
	<!-- 控制js -->
	<%@ include file="/WEB-INF/views/global/common-js.jsp"%>
	<script src="${pageContext.request.contextPath}/assets/script/job/job-add.js"></script>
</body>
</html>

