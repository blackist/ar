<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>我的单位-信电校友录</title>
    <%@ include file="/WEB-INF/views/portal-common/portal-meta.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/portal-common/header.jsp" %>
<div class="container higher" id="container">
    <div class="pageheader">
        <h2>
            <i class="fa fa-user"></i> 个人中心 <span>我的招聘</span><span>我的单位</span>
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
            <%@ include file="/WEB-INF/views/my/my-side.jsp" %>
        </div>
        <!-- 侧边栏 -->

        <div class="col-sm-8 col-lg-10">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs">
                <li><a href="my/recruit.action"><span
                        class="fa fa-archive"></span>&nbsp;<strong>我的招聘</strong></a></li>
                <li><a href="my/resume/posted.action"><span
                        class="fa fa-chain"></span>&nbsp;<strong>我的投递</strong></a></li>
                <li><a href="my/resume.action"><span
                        class="fa fa-file-text-o"></span>&nbsp;<strong>我的简历</strong></a></li>
                <li class="active"><a href="unit/my.action"><span
                        class="fa fa-institution"></span>&nbsp;<strong>我的单位</strong></a></li>
            </ul>
            <!-- Nav Tab -->

            <!-- Tab panes -->
            <div class="tab-content">
                <div class="panel-heading">
                    <h4 class="panel-title">招聘单位信息</h4>
                </div>
                <div class="panel-body panel-body-nopadding">
                    <!-- BASIC WIZARD -->
                    <div id="progressWizard" class="basic-wizard">

                        <div class="tab-content">
                            <form class="form" id="unitForm" method="post" action="unit/update.action">
                                <div class="form-group">
                                    <label class="col-sm-4"><span class="asterisk">*</span>公司名称</label>
                                    <div class="col-sm-4">
                                        <input class="form-control tooltips" type="text" value="${unit.unitName}"
                                               name="unitName" id="unitName" data-trigger="hover"
                                               data-toggle="tooltip" data-original-title="公司名称不超过30字符"
                                               maxlength="30"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-4"><span class="asterisk">*</span>所属行业</label>
                                    <div class="col-sm-4">
                                        <select class="select2" name="industry" id="industry">
                                            <option value="">--</option>
                                            <c:forEach items="${unitIndustry}" var="industry">
                                                <option value="${industry.value}"
                                                        <c:if test="${industry.value == unit.industry}">selected</c:if>> ${industry.name }</option>
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
                                                <option value="${property.value}"
                                                        <c:if test="${property.value == unit.property}">selected</c:if>>${property.name}</option>
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
                                                <option value="${scale.value }"
                                                        <c:if test="${scale.value == unit.scale}">selected</c:if>>${scale.name }</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-4 control-label"><span
                                            class="asterisk">* </span>公司描述</label>
                                    <div class="col-sm-7">
                                        <textarea rows="7" style="height: 150.4px;" name="unitDesc" id="unitDesc"
                                                  placeholder="50-500字" class="form-control tooltips"
                                                  data-trigger="hover"
                                                  data-toggle="tooltip" data-original-title="50-500字" maxlength="500">
                                            ${unit.unitDesc}
                                        </textarea>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-4">公司网站</label>
                                    <div class="col-sm-7">
                                        <div class="input-group mb15">
                                            <span class="input-group-addon">HTTP://</span>
                                            <input class="form-control tooltips" type="text" value="${unit.unitWeb}"
                                                   name="unitWeb" id="unitWeb" data-trigger="hover"
                                                   data-toggle="tooltip" data-original-title="公司网站不超过30字符"
                                                   maxlength="30">
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" value="${unit.unitId}" name="unitId">

                                <div class="form-group">
                                    <label class="col-sm-4"></label>
                                    <div class="col-sm-4">
                                        <button type="button" onclick="addUnitSubmit()" class="btn btn-primary">保存</button>
                                    </div>
                                </div>

                            </form>

                        </div>
                        <!-- tab-content -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- row -->
</div>
<!-- container -->

<%@ include file="/WEB-INF/views/portal-common/footer.jsp" %>

</body>
<%@ include file="/WEB-INF/views/portal-common/portal-js.jsp" %>
<script src="assets/script/my/recruit/unit-my.js"></script>
</html>