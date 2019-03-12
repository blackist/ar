<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/global/common-taglib.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@ include file="/WEB-INF/views/global/base-path.jsp" %>
    <title>${origin.originId}成员-后台管理</title>
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
                <small> / 组织成员</small>
            </div>
        </div>
        <hr/>

        <div class="am-tabs am-margin">
            <ul class="am-tabs-nav am-nav am-nav-tabs">
                <li><a href="${pageContext.request.contextPath}/origin/home.action?originId=${origin.originId}">主页</a></li>
                <li class="am-active"><a href="javascript:;">成员</a></li>
            </ul>
            <br>

            <div class="am-g">
                <form class="am-form">

                    <input hidden id="originId" value="${origin.originId}">

                    <table class="am-table am-table-striped am-table-hover table-main">
                        <thead>
                        <tr>
                            <th class="table-check"><input type="checkbox" class="alls"/></th>
                            <th class="table-title">成员名</th>
                            <th class="table-detail">加入时间</th>
                            <th class="table-detail">加入状态</th>
                            <th class="table-set">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${page.beanList}" var="member">
                            <tr>
                                <td><input type="checkbox" value="${member.userId}"/></td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/origin/home.action?originId=${member.userId}"
                                       target="blank">${member.trueName}</a>
                                    <c:if test="${member.userId == origin.mgrId}">
                                        &nbsp;<span class="am-badge am-badge-success">管理员</span>
                                    </c:if>
                                </td>
                                <td><fmt:formatDate value="${origin.stateTime}"
                                                    pattern="YYYY-M-d HH:mm"></fmt:formatDate></td>
                                <td><ar:dictdata dictdata="${origin.state}" dict="state"/></td>
                                <td>
                                    <div class="am-btn-toolbar">
                                        <div class="am-btn-group am-btn-group-xs">
                                            <c:if test="${member.userId != origin.mgrId && member.state=='A'}">
                                                <button type="button"
                                                        onclick="javascript:removeMember('${member.userId}')"
                                                        class="am-btn am-btn-default am-btn-xs am-text-danger confirm">
                                                    <span class="am-icon-trash-o"></span> 踢出
                                                </button>
                                            </c:if>
                                            <c:if test="${member.userId != origin.mgrId}">
                                                <a href="origin/update.action?mgrId=${member.userId}&originId=${origin.originId}"
                                                   class="am-btn am-btn-default am-btn-xs">
                                                    <i class="am-icon-recycle"></i> 设为管理员
                                                </a>
                                            </c:if>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <!-- 页码 -->
                    <%@ include file="/WEB-INF/views/global/page-index.jsp" %>
                    <!-- 页面操作备注 -->
                    <%@ include file="/WEB-INF/views/global/operate-remarks.jsp" %>
                </form>
            </div>
        </div>
        <!-- content end -->
    </div>
</div>

<!-- footer -->
<%@ include file="/WEB-INF/views/global/footer.jsp" %>
<!-- 控制js -->
<%@ include file="/WEB-INF/views/global/common-js.jsp" %>
<script src="${pageContext.request.contextPath}/assets/script/origin/origin-home-member.js"></script>
</body>
</html>

