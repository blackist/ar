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
												<form class="form">

													<div class="form-group">
														<label class="col-sm-4"><span class="asterisk">*
														</span>选择聘职公司</label>
														<div class="col-sm-4">
															<select class="select2" name="unitId" id="unitId">
																<c:forEach items="${unitList}" var="unit">
																	<option value="${unit.unitId}">${unit.unitName}</option>
																</c:forEach>
															</select>

															<div class="btn-demo">
																<br> <a class="btn btn-darkblue"
																	href="${pageContext.request.contextPath}/unit/addUnit.action"><span
																	class="fa fa-plus-square-o">&nbsp;</span>新建公司信息</a>
															</div>
														</div>
													</div>

												</form>
											</div>


										</div>
										<!-- tab-content -->

										<ul class="pager wizard">
											<li class="next"><a href="javascript:;"
												onclick="selectUnit()">下一步</a></li>
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
<script src="${pageContext.request.contextPath}/assets/script/recruit/unit/unit-select.js"></script>

</html>