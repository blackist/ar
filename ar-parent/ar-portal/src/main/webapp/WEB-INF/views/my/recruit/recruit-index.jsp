<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>我的招聘-信电校友录</title>
    <%@ include file="/WEB-INF/views/portal-common/portal-meta.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/portal-common/header.jsp" %>
<div class="container higher" id="container">
    <div class="pageheader">
        <h2>
            <i class="fa fa-user"></i> 个人中心 <span>我的招聘</span>
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
                <li class="active"><a href="my/recruit.action"><span
                        class="fa fa-archive"></span>&nbsp;<strong>我的招聘</strong></a></li>
                <li><a href="my/resume/posted.action"><span
                        class="fa fa-chain"></span>&nbsp;<strong>我的投递</strong></a></li>
                <li><a href="my/resume.action"><span
                        class="fa fa-file-text-o"></span>&nbsp;<strong>我的简历</strong></a></li>
                <li><a href="unit/my.action"><span
                        class="fa fa-institution"></span>&nbsp;<strong>我的单位</strong></a></li>
            </ul>
            <!-- Nav Tab -->

            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane active" id="tab-basic">

                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>招聘标题</th>
                                <th>简历投递</th>
                                <th>发布时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${page.beanList}" var="recruit">
                                <tr>
                                    <td>
                                        <a href="/recruit/detailRecruit.action?recruitId=${recruit.recruitId}">${recruit.title}</a>
                                    </td>
                                    <td>${recruit.resumes}</td>
                                    <td><fmt:formatDate value="${recruit.stateTime}"
                                                        pattern="YY-MM-DD HH:mm"></fmt:formatDate></td>
                                    <td>
                                        <div class="btn-group mr5">
                                            <button onclick="location='recruit/detailRecruit.action?recruitId=${recruit.recruitId}'"
                                                    class="btn btn-sm btn-white tooltips" type="button"
                                                    data-toggle="tooltip" title="详情"><i class="fa fa-bars"></i></button>
                                            <button onclick="deleteMyRecruit(${recruit.recruitId})"
                                                    class="btn btn-sm btn-white tooltips" type="button"
                                                    data-toggle="tooltip" title="删除"><i class="fa fa-trash-o"></i>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div><!-- table-responsive -->

                    <%@include file="/WEB-INF/views/portal-common/pagination.jsp"%>

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
<script src="assets/script/my/recruit/recruit.js"></script>
</html>