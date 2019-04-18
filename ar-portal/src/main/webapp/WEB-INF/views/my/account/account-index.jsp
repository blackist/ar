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
            <i class="fa fa-user"></i> 个人中心 <span>账号设置</span><span>账号信息</span>
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
                <li class="active"><a href="${pageContext.request.contextPath}/my/account.action"><span
                        class="glyphicon glyphicon-th-list"></span>&nbsp;<strong>账号信息</strong></a></li>
                <li><a href="${pageContext.request.contextPath}/my/account/password.action"><span
                        class="glyphicon glyphicon-paperclip"></span>&nbsp;<strong>密码修改</strong></a></li>
                <li><a href="${pageContext.request.contextPath}/my/account/email.action"><span
                        class="glyphicon glyphicon-briefcase"></span>&nbsp;<strong>邮箱设置</strong></a></li>
            </ul>
            <!-- Nav Tab -->

            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane active" id="tab-basic">
                    <div class="row padding5">
                        <div class="col-md-2 text-right">账号：</div>
                        <div class="col-md-2">${user.account}</div>
                    </div>
                    <div class="row padding5">
                        <div class="col-md-2 text-right">密码：</div>
                        <div class="col-md-2">******</div>
                        <div class="col-md-4">
                            <button class="btn btn-danger btn-xs" onclick="location.href='my/account/password.action'">
                                修改密码
                            </button>
                        </div>
                    </div>
                    <div class="row padding5">
                        <div class="col-md-2 text-right">邮箱：</div>
                        <div class="col-md-2">${user.email}</div>
                        <div class="col-md-8">
                            <c:if test="${user.email == null || user.email == ''}">
                                <button class="btn btn-primary btn-xs"
                                        onclick="location.href='my/account/email.action'">
                                    设置邮箱
                                </button>
                            </c:if>
                        </div>
                    </div>
                    <div class="row"></div>
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
<script src="${pageContext.request.contextPath}/assets/script/my/acount/account-password.js"></script>
</html>