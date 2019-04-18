<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/global/common-taglib.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@ include file="/WEB-INF/views/global/base-path.jsp" %>
    <title>发布招聘-后台管理</title>
    <%@ include file="/WEB-INF/views/global/manage-meta.jsp" %>
    <%@ include file="/WEB-INF/views/global/common-css.jsp" %>
</head>
<body>
<!-- header -->
<%@ include file="/WEB-INF/views/global/header.jsp" %>

<!-- 主管理区域 admin-main -->
<div class="am-cf admin-main">
    <!-- 侧边栏 side bar start -->
    <div class="admin-sidebar">
        <%@ include file="/WEB-INF/views/global/sidebar.jsp" %>
    </div>
    <!-- side bar end -->

    <!-- 内容区域 content start -->
    <div class="admin-content" id="admin-content">
        <div class="am-cf am-padding">
            <div class="am-fl am-cf">
                <strong class="am-text-primary am-text-lg">职业招聘</strong> /
                <small><a href="${pageContext.request.contextPath}/job.action">招聘信息</a></small>
                /
                <small>发布招聘</small>
            </div>
        </div>
        <div class="am-tabs  am-margin">
            <ul class="am-tabs-nav am-nav am-nav-tabs">
                <li><a href="javascript:;">单位信息</a></li>
                <li><a href="javascript:;">招聘信息</a></li>
                <li class="am-active"><a href="javascript:;">完成发布</a></li>
            </ul>

            <div class="am-tabs-bd">
                <br>
                <div
                        class="am-progress am-progress-striped am-progress-sm mymargin">
                    <div class="am-progress-bar am-progress-bar-secondary"
                         style="width: 100%"></div>
                </div>
                <div class="am-tab-panel am-fade  am-in am-active" id="flat-tag">
                    <form class="am-form">
                        <div class="am-g am-margin-top">
                            <div class="am-u-sm-4 am-text-left">
                                <strong>${_message}</strong> <br>
                                <hr>
                                <button type="button"
                                        onclick="javascript:_start();location.href='job/createJob.action';"
                                        class="am-btn am-btn-default am-btn-block am-btn-sm">继续发布
                                </button>
                            </div>
                            <div class="am-u-sm-8 am-text-right"></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="am-margin">
            <div class="am-u-sm-10 am-text-right">
                <a href="${pageContext.request.contextPath}/job.action" class="am-btn am-btn-primary am-btn-xs">完成</a>
            </div>
            <br>
        </div>
    </div>
    <!-- content end -->
</div>

<!-- footer -->
<%@ include file="/WEB-INF/views/global/footer.jsp" %>
<!-- 控制js -->
<%@ include file="/WEB-INF/views/global/common-js.jsp" %>
<script src="${pageContext.request.contextPath}/assets/script/job/flat/flat-select.js"></script>
</body>
</html>

