<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="/WEB-INF/views/global/base-path.jsp"%>
<title>职业招聘-后台管理</title>
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
					<strong class="am-text-primary am-text-lg"> 职业招聘 </strong> / <small><a
						href="${pageContext.request.contextPath}/job.action">招聘信息 </a></small> / <small>招聘详情</small>
				</div>
			</div>

			<div class="am-tabs am-margin" data-am-tabs>
				<ul class="am-tabs-nav am-nav am-nav-tabs">
					<li><a href="#flat">单位信息</a></li>
					<li class="am-active"><a href="#job-tag">招聘信息</a></li>
					<li><a href="#about">相关内容</a></li>
				</ul>

				<div class="am-tabs-bd">
					<div class="am-tab-panel am-fade" id="flat">
						<form class="am-form">
							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">单位名称：</div>
								<div class="am-u-sm-2 am-text-left">${job.unitName}</div>
								<div class="am-u-sm-8 am-text-left"></div>
							</div>

							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">行业：</div>
								<div class="am-u-sm-2 am-text-left">
									<ar:dictdata dictdata="${job.industry}" dict="ind" />
								</div>
								<div class="am-u-sm-8 am-text-left"></div>
							</div>

							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">性质：</div>
								<div class="am-u-sm-2 am-text-left">
									<ar:dictdata dictdata="${job.property}" dict="pro" />
								</div>
								<div class="am-u-sm-8 am-text-left"></div>
							</div>

							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">规模：</div>
								<div class="am-u-sm-2 am-text-left">
									<ar:dictdata dictdata="${job.scale}" dict="sca" />
								</div>
								<div class="am-u-sm-8 am-text-left"></div>
							</div>

							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">单位描述：</div>
								<div class="am-u-sm-8">
									<textarea rows="10">${job.unitDesc}</textarea>
								</div>
								<div class="am-u-sm-2"></div>
							</div>

						</form>
					</div>

					<div class="am-tab-panel am-fade am-in am-active" id="job-tag">
						<form class="am-form">
							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">招聘标题：</div>
								<div class="am-u-sm-4 am-text-left">${job.title}</div>
								<div class="am-u-sm-6 am-text-right">
									更新于
									<fmt:formatDate value="${job.stateTime}" pattern="M月d日"></fmt:formatDate>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${job.resumes}人投递
								</div>
							</div>

							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">薪资待遇：</div>
								<div class="am-u-sm-2 am-text-left">
									<ar:dictdata dictdata="${job.salary}" dict="sl" />
								</div>
								<div class="am-u-sm-8 am-text-left"></div>
							</div>

							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">招聘人数：</div>
								<div class="am-u-sm-2 am-text-left">${job.members}</div>
								<div class="am-u-sm-8 am-text-left"></div>
							</div>

							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">招聘职位：</div>
								<div class="am-u-sm-2 am-text-left">${job.posName}</div>
								<div class="am-u-sm-8 am-text-left"></div>
							</div>

							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">学历要求：</div>
								<div class="am-u-sm-4 am-text-left">
									<ar:dictdata dictdata="${job.prof}" dict="prof" />
								</div>
								<div class="am-u-sm-6 am-text-left"></div>
							</div>

							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">职位描述：</div>
								<div class="am-u-sm-8">
									<textarea rows="10">${job.posDesc}</textarea>
								</div>
								<div class="am-u-sm-2"></div>
							</div>

							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">福利待遇：</div>
								<div class="am-u-sm-8 am-text-left">
									<c:forEach items="${benefits}" var="benefit">
										<ar:dictdata dictdata="${benefit}" dict="be" />
									</c:forEach>
								</div>
								<div class="am-u-sm-6 am-text-left"></div>
							</div>

							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">工作地址：</div>
								<div class="am-u-sm-4 am-text-left">${job.workPlace}</div>
								<div class="am-u-sm-6 am-text-left"></div>
							</div>

							<hr>

							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">联系人：</div>
								<div class="am-u-sm-4 am-text-left">${job.leaderName}</div>
								<div class="am-u-sm-6 am-text-left"></div>
							</div>

							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">联系方式：</div>
								<div class="am-u-sm-4 am-text-left">${job.leaderPhone}</div>
								<div class="am-u-sm-6 am-text-left"></div>
							</div>

						</form>
					</div>

					<div class="am-tab-panel am-fade" id="about">
						<form class="am-form">
							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">申请记录：</div>
								<div class="am-u-sm-6 am-text-left">
									<a href="${pageContext.request.contextPath}/user/userInfo?userId=${userId}" target="blank">black</a>
									申请于 3月26号 <br>
								</div>
								<div class="am-u-sm-4 am-text-left"></div>
							</div>
						</form>
					</div>

				</div>
			</div>

			<div class="am-margin">
				<c:if test="${job.isTop==0}">
					<button type="button"
						onclick="javascript:setTopJob('${job.recruitId}')"
						class="am-btn am-btn-primary am-btn-xs">置顶</button>
				</c:if>
				<c:if test="${job.state=='D'}">
					<button type="button"
						onclick="javascript:auditJob('${job.recruitId}')"
						class="am-btn am-btn-primary am-btn-xs">审核</button>
				</c:if>
				<c:if test="${job.state!='X'}">
					<button type="button"
						onclick="javascript:removeJob('${job.recruitId}')"
						class="am-btn am-btn-primary am-btn-xs">删除</button>
				</c:if>
				<c:if test="${job.state=='X'}">
					<button type="button"
						onclick="javascript:recoverJob('${job.recruitId}')"
						class="am-btn am-btn-primary am-btn-xs">恢复</button>
				</c:if>
			</div>
		</div>
		<!-- content end -->

	</div>

	<!-- footer -->
	<%@ include file="/WEB-INF/views/global/footer.jsp"%>

	<!-- 控制js -->
	<%@ include file="/WEB-INF/views/global/common-js.jsp"%>
	<script src="${pageContext.request.contextPath}/assets/script/job/job-detail.js"></script>
</body>
</html>