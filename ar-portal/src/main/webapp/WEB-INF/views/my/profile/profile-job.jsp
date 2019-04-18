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
                <li><a href="${pageContext.request.contextPath}/my/profile/basic.action"><span
                        class="glyphicon glyphicon-th-list"></span>&nbsp;<strong>基本资料</strong></a></li>
                <li class="active"><a href="javascript:;"><span
                        class="glyphicon glyphicon-briefcase"></span>&nbsp;<strong>工作信息</strong></a></li>
                <li><a href="${pageContext.request.contextPath}/my/profile/portrait.action"><span
                        class="glyphicon glyphicon-picture"></span>&nbsp;<strong>头像设置</strong></a></li>
            </ul>
            <!-- Nav Tab -->

            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane active" id="tab-job">
                    <div class="table-responsive">
                        <table class="table mb30">
                            <thead>
                            <tr>
                                <th>职位/职务</th>
                                <th>所在单位</th>
                                <th>工作时间</th>
                                <th width="100px">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${userJobs}" var="job">
                                <tr>
                                    <td>${job.jobName}</td>
                                    <td>${job.jobUnit}</td>
                                    <td>${job.jobDate}</td>
                                    <td>
                                        <button class="btn btn-danger btn-xs" onclick="deleteJob(${job.jobId})">删除
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div><!-- table-responsive -->

                    <form method="post" action="${pageContext.request.contextPath}/my/profile/job/add.action">
                        <div class="col-lg-4">
                            <input type="text" name="jobName" placeholder="职位/职务" maxlength="30" class="form-control"/>
                        </div>
                        <div class="col-lg-4">
                            <input type="text" name="jobUnit" placeholder="所在单位" maxlength="30" class="form-control"/>
                        </div>
                        <div class="col-lg-4">
                            <input type="text" name="jobDate" placeholder="工作时间" maxlength="30" class="form-control"/>
                        </div>
                        <div class="col-lg-12 text-right">
                            <br>
                            <button class="btn btn-primary">添加</button>
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
<script src="${pageContext.request.contextPath}/assets/script/my/profile/profile-job.js"></script>
</html>