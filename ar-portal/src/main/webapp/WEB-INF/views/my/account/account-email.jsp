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
            <i class="fa fa-user"></i> 个人中心 <span>账号设置</span><span>邮箱设置</span>
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
                <li><a href="${pageContext.request.contextPath}/my/account.action"><span
                        class="glyphicon glyphicon-th-list"></span>&nbsp;<strong>账号信息</strong></a></li>
                <li><a href="${pageContext.request.contextPath}/my/account/password.action"><span
                        class="glyphicon glyphicon-paperclip"></span>&nbsp;<strong>密码修改</strong></a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/my/account/email.action"><span
                        class="glyphicon glyphicon-briefcase"></span>&nbsp;<strong>邮箱设置</strong></a></li>
            </ul>
            <!-- Nav Tab -->

            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane active" id="tab-basic">
                    <form method="post" action="my/account/email/update.action">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">邮箱 <span class="asterisk">*</span></label>
                            <div class="col-sm-4">
                                <input type="email" name="email" value="${SESSION_USER.email}"
                                       class="form-control" maxlength="50" required/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2"></label>
                            <div class="col-sm-4">
                                <button class="btn btn-primary">设置邮箱</button>
                            </div>
                        </div>
                    </form>
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
<script src="${pageContext.request.contextPath}/assets/script/my/acount/account-email.js"></script>
</html>