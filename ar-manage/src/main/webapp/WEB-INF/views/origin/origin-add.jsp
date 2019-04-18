<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@ include file="/WEB-INF/views/global/base-path.jsp" %>
    <title>校友组织-后台管理</title>
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
                <strong class="am-text-primary am-text-lg">班级 / 校友组织</strong> /
                <small>新建组织</small>
            </div>
        </div>
        <div class="am-tabs  am-margin" data-am-tabs>
            <ul class="am-tabs-nav am-nav am-nav-tabs">
                <li class="am-active"><a href="javascript:;">组织信息</a></li>
            </ul>
            <div class="am-tabs-bd">
                <div class="am-tab-panel am-fade am-in am-active">
                    <form class="am-form" id="origin-form" method="post" action="origin/save.action">

                        <div class="am-g am-margin-top-sm">
                            <div class="am-u-sm-2 am-text-right">
                                <span class="error_span"> * </span>名称
                            </div>
                            <div class="am-u-sm-4 am-u-end">
                                <input type="text" name="originName" id="originName" class="am-input-sm" required>
                                <span class="error_span" id="origin-name-error"></span>
                            </div>
                        </div>

                        <div class="am-g am-margin-top-sm">
                            <div class="am-u-sm-2 am-text-right">
                                <span class="error_span"> * </span>类型
                            </div>
                            <div class="am-u-sm-4 am-u-end">
                                <select name="originType" id="originType" class="am-input-sm" required>
                                    <c:forEach items="${types}" var="type">
                                        <option value="${type.value}"
                                                <c:if test="${type.value == 'C'}">selected</c:if>>${type.name}</option>
                                    </c:forEach>
                                </select>
                                <span class="error_span" id="origin-type-span"></span>
                            </div>
                        </div>

                        <div class="am-g am-margin-top-sm">
                            <div class="am-u-sm-2 am-text-right">年级</div>
                            <div class="am-u-sm-4 am-u-end">
                                <select name="originGrade" id="originGrade" required
                                        data-am-selected="{btnSize:'sm'}" class="am-input-sm">
                                    <option value="">请选择...</option>
                                    <c:forEach items="${grades}" var="grade">
                                        <option value="${grade.value}">${grade.value}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="am-g am-margin-top-sm">
                            <div class="am-u-sm-2 am-text-right">描述</div>
                            <div class="am-u-sm-4 am-u-end">
                                <textarea rows="4" name="originDesc" id="originDesc"></textarea>
                                <span class="error_span" id="origin-desc-error"></span>
                            </div>
                        </div>

                    </form>
                </div>
            </div>

            <div class="am-margin">
                <button type="button" onclick="saveOrigin()" class="am-btn am-btn-primary am-btn-xs">提交</button>
                <a href="${pageContext.request.contextPath}/origin.action" class="am-btn am-btn-warning am-btn-xs">取消</a>
            </div>
            <%@ include file="/WEB-INF/views/global/operate-remarks.jsp" %>
        </div>
    </div>
    <!-- content end -->

</div>
<!-- footer -->
<%@ include file="/WEB-INF/views/global/footer.jsp" %>

<!-- 控制js -->
<%@ include file="/WEB-INF/views/global/common-js.jsp" %>
<script src="${pageContext.request.contextPath}/assets/script/origin/origin-add.js"></script>
</body>
</html>