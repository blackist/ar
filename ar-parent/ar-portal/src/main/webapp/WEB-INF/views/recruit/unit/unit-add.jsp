<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/views/portal-common/portal-tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>发布招聘-信电校友录</title>
<%@ include file="/WEB-INF/views/portal-common/portal-meta.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/views/portal-common/header.jsp"%>

	<%@ include file="/WEB-INF/views/portal-common/navmenu.jsp"%>


	<div class="banner-bottom">
		<div class="container higher" id="container">
			<section>
				<!-- 导航栏 -->
				<div class="header">
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i>&nbsp;<a href="index.action">主页</a></li>
						<li><a href="${pageContext.request.contextPath}/recruit.action">职业招聘</a></li>
						<li class="active">发布招聘</li>
					</ol>
				</div>

				<div class="contentpanel">

					<div class="row">

						<div class="col-md-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">填写招聘信息</h4>
									<p>公司信息</p>
								</div>
								<div class="panel-body panel-body-nopadding">

									<!-- BASIC WIZARD -->
									<div id="progressWizard" class="basic-wizard">

										<ul class="nav nav-pills nav-justified">
											<li class="active"><a href="#tab-unit" data-toggle="tab"><span>公司信息</span></a></li>
											<li><a href="javascript:;" data-toggle="tab"><span>招聘信息</span></a></li>
											<li><a href="javascript:;" data-toggle="tab"><span>完成发布</span></a></li>
										</ul>

										<div class="tab-content">
											<div class="progress progress-striped active">
												<div class="progress-bar progress-bar-primary"
													style="width: 33%" aria-valuemax="100" aria-valuemin="0"
													aria-valuenow="40" role="progressbar"></div>
											</div>
											<div class="tab-pane active" id="tab-unit">
												<form class="form" id="unitForm" method="post"
													action="${pageContext.request.contextPath}/unit/addUnitSubmit.action">
													<div class="form-group">
														<label class="col-sm-4"><span class="asterisk">*
														</span>公司名称</label>
														<div class="col-sm-4">
															<input class="form-control tooltips" type="text"
																name="unitName" id="unitName" data-trigger="hover"
																data-toggle="tooltip" data-original-title="公司名称不超过30字符"
																maxlength="30" />
														</div>
													</div>

													<div class="form-group">
														<label class="col-sm-4"><span class="asterisk">*
														</span>所属行业</label>
														<div class="col-sm-4">
															<select class="select2" name="industry" id="industry">
																<option value="">--</option>
																<c:forEach items="${unitIndustry}" var="industry">
																	<option value="${industry.value }">${industry.name }</option>
																</c:forEach>
															</select>
														</div>
													</div>

													<div class="form-group">
														<label class="col-sm-4"><span class="asterisk">*
														</span>公司性质</label>
														<div class="col-sm-4">
															<select class="select2" name="property" id="property">
																<option value="">--</option>
																<c:forEach items="${unitProperty}" var="property">
																	<option value="${property.value}">${property.name}</option>
																</c:forEach>
															</select>
														</div>
													</div>

													<div class="form-group">
														<label class="col-sm-4"><span class="asterisk">*
														</span>公司规模</label>
														<div class="col-sm-4">
															<select class="select2" name="scale" id="scale">
																<option value="">--</option>
																<c:forEach items="${unitScale}" var="scale">
																	<option value="${scale.value }">${scale.name }</option>
																</c:forEach>
															</select>
														</div>
													</div>

													<div class="form-group">
														<label class="col-sm-4 control-label"><span
															class="asterisk">* </span>公司描述</label>
														<div class="col-sm-7">
															<textarea rows="7" style="height: 150.4px;"
																name="unitDesc" id="unitDesc" placeholder="50-500字"
																class="form-control tooltips" data-trigger="hover"
																data-toggle="tooltip" data-original-title="50-500字"
																maxlength="500"></textarea>
														</div>
													</div>

													<div class="form-group">
														<label class="col-sm-4">公司网站</label>
														<div class="col-sm-7">
															<div class="input-group mb15">
																<span class="input-group-addon">HTTP://</span><input
																	class="form-control tooltips" type="text"
																	name="unitWeb" id="unitWeb" data-trigger="hover"
																	data-toggle="tooltip" data-original-title="公司网站不超过30字符"
																	maxlength="30">
															</div>
														</div>
													</div>
													<input type="hidden" value="1" name="isRecruiting">
												</form>
											</div>


										</div>
										<!-- tab-content -->

										<ul class="pager wizard">
											<li class="next"><a href="javascript:;"
												onclick="addUnitSubmit()">下一步</a></li>
										</ul>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</section>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/portal-common/footer.jsp"%>

</body>
<%@ include file="/WEB-INF/views/portal-common/portal-js.jsp"%>
<script src="${pageContext.request.contextPath}/assets/script/recruit/unit/unit-add.js"></script>

</html>