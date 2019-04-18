<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>个人中心-信电校友录</title>
    <%@ include file="/WEB-INF/views/portal-common/portal-meta.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/portal-common/header.jsp" %>
<div class="container higher" id="container">
    <div class="pageheader">
        <h2>
            <i class="fa fa-user"></i> 个人中心 <span>我的简历</span><span>登记简历</span>
        </h2>
        <div class="breadcrumb-wrapper">
            <span class="label"></span>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/index.action">主页</a></li>
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
                <li><a href="${pageContext.request.contextPath}/my/recruit.action"><span
                        class="fa fa-archive"></span>&nbsp;<strong>我的招聘</strong></a></li>
                <li><a href="${pageContext.request.contextPath}/my/resume/posted.action"><span
                        class="fa fa-chain"></span>&nbsp;<strong>我的投递</strong></a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/my/resume.action"><span
                        class="fa fa-file-text-o"></span>&nbsp;<strong>我的简历</strong></a></li>
                <li><a href="${pageContext.request.contextPath}/unit/my.action"><span
                        class="fa fa-institution"></span>&nbsp;<strong>我的单位</strong></a></li>
            </ul>
            <!-- Nav Tab -->

            <!-- Tab panes -->
            <div class="tab-content">
                <div class="panel-heading">
                    <h4 class="panel-title"><i class="fa fa-plus"></i> 登记简历</h4>
                </div>
                <div class="panel-body panel-body-nopadding">

                    <div id="progressWizard" class="basic-wizard">

                        <div class="tab-content">
                            <div class="tab-pane active" id="tab-recruit">
                                <form class="form" id="resumeForm" method="post"
                                      action="${pageContext.request.contextPath}/my/resume/addResumeSubmit.action">

                                    <div class="panel panel-default">
                                        <h5 class="panel-title">职位信息</h5>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4"><span class="asterisk">*</span> 简历标题</label>
                                        <div class="col-sm-4">
                                            <input type="text" name="resumeTitle" id="resumeTitle" maxlength="20"
                                                   class="form-control tooltips" data-trigger="hover"
                                                   data-toggle="tooltip" data-original-title="2-20字"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4"><span class="asterisk">*</span> 职业类型</label>
                                        <div class="col-sm-4">
                                            <input type="text" name="profType" id="profType" maxlength="20"
                                                   class="form-control tooltips" data-trigger="hover"
                                                   data-toggle="tooltip" data-original-title="2-20字"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4"><span class="asterisk">*</span> 期望工资</label>
                                        <div class="col-sm-4">
                                            <div class="input-group">
                                                <span class="input-group-addon">￥</span>
                                                <select class="select2" name="expSalary" id="expSalary">
                                                    <option value="">--</option>
                                                    <c:forEach items="${positionSalary}" var="salary">
                                                        <option value="${salary.value}">${salary.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="panel panel-default">
                                        <h5 class="panel-title">个人信息</h5>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4"><span class="asterisk">*</span> 姓名</label>
                                        <div class="col-sm-4">
                                            <input type="text" name="name" id="name"
                                                   class="form-control tooltips" data-trigger="hover"
                                                   data-toggle="tooltip" data-original-title="2-10字"
                                                   maxlength="10"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4"><span class="asterisk">*</span> 性别</label>
                                        <div class="col-sm-4">
                                            <div class="rdio rdio-primary">
                                                <input type="radio" value="1" id="1" name="sex" checked/>
                                                <label for="1">男</label>
                                            </div>
                                            <div class="rdio rdio-primary">
                                                <input type="radio" value="0" id="0" name="sex">
                                                <label for="0">女</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4"><span class="asterisk">*
														</span>现居住地</label>
                                        <div class="col-sm-7">
                                            <input type="text" name="domicile" id="domicile"
                                                   class="form-control tooltips" data-trigger="hover"
                                                   data-toggle="tooltip" data-original-title="必填，且不超过50字"
                                                   maxlength="50"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4"><span class="asterisk">*
														</span>联系方式</label>
                                        <div class="col-sm-4">
                                            <input type="text" name="contact" id="contact"
                                                   class="form-control tooltips" data-trigger="hover"
                                                   data-toggle="tooltip" data-original-title="必填，且不超过30字"
                                                   placeholder="手机/固定电话" maxlength="30"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label"><span
                                                class="asterisk">* </span>个人简介</label>
                                        <div class="col-sm-7">
                                            <textarea rows="7" style="height: 150.4px;" name="introduce" id="introduce"
                                                      class="form-control tooltips" data-trigger="hover"
                                                      data-toggle="tooltip" data-original-title=不超过500字"
                                                      maxlength="500"></textarea>
                                        </div>
                                    </div>

                                </form>
                            </div>

                        </div>
                        <!-- tab-content -->

                        <ul class="pager wizard">
                            <li><a href="javascript:;" onclick="addResumeSubmit()" id="submitBtn">提交</a></li>
                            &nbsp;&nbsp;&nbsp;
                            <li><a href="${pageContext.request.contextPath}/my/resume.action" id="cancelBtn">放弃</a></li>
                        </ul>
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
<script src="${pageContext.request.contextPath}/assets/script/my/recruit/resume.js"></script>
</html>