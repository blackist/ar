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
            <%@ include file="/WEB-INF/views/my/my-side.jsp" %>
        </div>
        <!-- 侧边栏 -->

        <div class="col-sm-8 col-lg-10">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs">
                <li class="active"><a href="javascript:;"><span
                        class="glyphicon glyphicon-th-list"></span>&nbsp;<strong>基本资料</strong></a></li>
                <li><a href="my/profile/detail.action"><span
                        class="glyphicon glyphicon-paperclip"></span>&nbsp;<strong>详细资料</strong></a></li>
                <li><a href="my/profile/job.action"><span
                        class="glyphicon glyphicon-briefcase"></span>&nbsp;<strong>工作信息</strong></a></li>
                <li><a href="my/profile/portrait.action"><span
                        class="glyphicon glyphicon-picture"></span>&nbsp;<strong>头像设置</strong></a></li>
            </ul>
            <!-- Nav Tab -->

            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane active" id="tab-basic">
                    <div class="panel panel-default">
                        <h5 class="panel-title">基本信息</h5>
                    </div>
                    <div class="tab-pane active" id="tab-recruit">
                        <form class="form" id="basic-form" method="post"
                              action="recruit/addRecruitSubmit.action">
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><span class="asterisk">*</span> 性别 </label>
                                <div class="col-sm-9">
                                    <div class="rdio rdio-primary">
                                        <input type="radio" id="m" value="1" name="sex" />
                                        <label for="m">男</label>
                                    </div><!-- rdio -->
                                    <div class="rdio rdio-primary">
                                        <input type="radio" id="f" value="0" name="sex" />
                                        <label for="f">女</label>
                                    </div><!-- rdio -->
                                    <label class="error" for="gender"></label>
                                </div>
                            </div><!-- form-group -->

                            <div class="form-group">
                                <label class="col-sm-3">
                                    <span class="asterisk">* </span>招聘标题</label>
                                <div class="col-sm-4">
                                    <input type="text" name="title" id="title" maxlength="20"
                                           class="form-control tooltips" data-trigger="hover"
                                           data-toggle="tooltip" data-original-title="2-20字"/>
                                </div>
                            </div>
                        </form>
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
<script src="assets/script/my/profile/profile-basic.js"></script>
</html>