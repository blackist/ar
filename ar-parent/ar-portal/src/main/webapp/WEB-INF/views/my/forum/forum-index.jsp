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
            <i class="fa fa-user"></i> 个人中心 <span>我的论坛</span>
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

            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane active" id="tab-basic">

                    <table class="table table-hover mb20">
                        <thead>
                        <tr>
                            <th>帖子标题</th>
                            <th>评论 / 浏览</th>
                            <th>发布时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${page.beanList}" var="post">
                            <tr>
                                <td><ar:sub value="${post.infoTitle}" length="10"></ar:sub></td>
                                <td>${post.comments} / ${post.views}</td>
                                <td><fmt:formatDate value="${post.createTime}"
                                                    pattern="YYYY-MM-dd HH:mm"></fmt:formatDate></td>
                                <td>
                                    <a class="btn btn-primary btn-xs" href="post/detail.action?postId=${post.infoId}">详情</a>
                                    <button class="btn btn-danger btn-xs" onclick="deleteMyPost(${post.infoId})">删除
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

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
<script src="assets/script/my/forum/forum-index.js"></script>
</html>