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
                <small><a
                        href="${pageContext.request.contextPath}/job.action">招聘信息</a></small>
                /
                <small>发布招聘</small>
            </div>
        </div>
        <div class="am-tabs  am-margin">
            <ul class="am-tabs-nav am-nav am-nav-tabs">
                <li class="am-active"><a href="javascript:;">单位信息</a></li>
                <li><a href="javascript:;">招聘信息</a></li>
                <li><a href="javascript:;">完成发布</a></li>
            </ul>

            <div class="am-tabs-bd">
                <br>
                <div
                        class="am-progress am-progress-striped am-progress-sm am-active mymargin">
                    <div class="am-progress-bar am-progress-bar-secondary"
                         style="width: 33.3%"></div>
                </div>
                <div class="am-tab-panel am-fade  am-in am-active" id="flat-tag">
                    <form id="unitIdForm" class="am-form" action="${pageContext.request.contextPath}/job/createJob.action" method="post">
                        <div class="am-g am-margin-top">
                            <div class="am-u-sm-2 am-text-right">选择招聘单位：</div>
                            <div class="am-u-sm-4 am-text-left">
                                <select data-am-selected="{btnSize: 'sm'}" class="am-input-sm"
                                        id="unitId" name="unitId" required="required">
                                    <option value="">请选择</option>
                                    <c:forEach items="${flatList}" var="flat">
                                        <option value="${flat.unitId}">${flat.unitName}</option>
                                    </c:forEach>
                                </select><br>
                                <a href="${pageContext.request.contextPath}/flat/createFlat.action" class="am-btn am-btn-default am-btn-block am-btn-sm">创建单位信息</a>
                            </div>
                            <div class="am-u-sm-8 am-text-left"></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="am-margin">
            <div class="am-u-sm-10 am-text-right">
                <button type="button" class="am-btn am-btn-primary am-btn-xs" onclick="createJob()">下一步</button>
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

