<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/global/common-taglib.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@ include file="/WEB-INF/views/global/base-path.jsp" %>
    <title>${origin.originName}-后台管理</title>
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
                <strong class="am-text-primary am-text-lg">班级 / 校友组织 </strong>
                <small><a href="${pageContext.request.contextPath}/origin.action"> / 组织管理</a></small>
                <small> / 组织主页</small>
            </div>
        </div>
        <hr/>
        <div class="am-tabs am-margin">
            <ul class="am-tabs-nav am-nav am-nav-tabs">
                <li class="am-active"><a href="javascript:;">主页</a></li>
                <li><a href="origin/member.action?originId=${origin.originId}">成员</a></li>
            </ul>
            <br>

            <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
                <div class="am-panel am-panel-default">
                    <div class="am-panel-bd">
                        <div class="am-g">
                            <div class="am-u-md-4">
                                <img class="am-img-circle" src="${origin.mgrPortrait}"/>
                            </div>
                            <div class="am-u-md-8">
                                <p>管理员：<a href="${pageContext.request.contextPath}/user/detail.action?userId=${origin.mgrId}">${origin.mgrName}</a></p>
                                <p class="am-form-help">${origin.mgrIntroduce}</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="am-panel am-panel-default">
                    <div class="am-panel-bd">
                        <div class="user-info">
                            <p>等级信息</p>
                            <div class="am-progress am-progress-sm">
                                <div class="am-progress-bar" style="width: 60%"></div>
                            </div>
                            <p class="user-info-order">当前等级：<strong>LV8</strong> 活跃天数：<strong>587</strong>
                                距离下一级别：<strong>160</strong></p>
                        </div>
                        <div class="user-info">
                            <p>信用信息</p>
                            <div class="am-progress am-progress-sm">
                                <div class="am-progress-bar am-progress-bar-success" style="width: 80%"></div>
                            </div>
                            <p class="user-info-order">信用等级：正常当前 信用积分：<strong>80</strong></p>
                        </div>
                    </div>
                </div>

            </div>

            <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
                <form class="am-form am-form-horizontal" method="post" action="origin/update.action">

                    <div class="am-form-group">
                        <label for="originName" class="am-u-sm-3 am-form-label">名称 </label>
                        <div class="am-u-sm-9">
                            <input type="text" id="originName" name="originName" value="${origin.originName}" required>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="originType" class="am-u-sm-3 am-form-label">类型 </label>
                        <div class="am-u-sm-9">
                            <select name="originType" id="originType"
                                    data-am-selected="{btnSize:'sm'}" class="am-input-sm" required>
                                <c:forEach items="${types}" var="type">
                                    <option value="${type.value}"
                                            <c:if test="${type.value == origin.originType}">selected</c:if>>${type.name}</option>
                                </c:forEach>
                            </select>
                            <span class="error_span" id="origin-type-span"></span>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="originGrade" class="am-u-sm-3 am-form-label">年级 </label>
                        <div class="am-u-sm-9">
                            <select name="originGrade" id="originGrade" required
                                    data-am-selected="{btnSize:'sm'}" class="am-input-sm">
                                <option value="">请选择...</option>
                                <c:forEach items="${grades}" var="grade">
                                    <option value="${grade.value}"
                                            <c:if test="${grade.value == origin.originGrade}">selected</c:if>>${grade.value}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="originDesc" class="am-u-sm-3 am-form-label">简介 </label>
                        <div class="am-u-sm-9">
                            <textarea rows="5" id="originDesc" name="originDesc">
                                ${origin.originDesc}
                            </textarea>
                        </div>
                    </div>

                    <input hidden name="originId" value="${origin.originId}">

                    <div class="am-form-group">
                        <div class="am-u-sm-9 am-u-sm-push-3">
                            <button type="submit" class="am-btn am-btn-primary am-btn-xs">提交修改</button>
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>
    <!-- content end -->
</div>

<!-- footer -->
<%@ include file="/WEB-INF/views/global/footer.jsp" %>
<!-- 控制js -->
<%@ include file="/WEB-INF/views/global/common-js.jsp" %>
<script src="${pageContext.request.contextPath}/assets/script/origin/origin-home.js"></script>
</body>
</html>

