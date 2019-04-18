<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/global/common-taglib.jsp" %>

<div class="am-cf am-padding">
    <div class="am-fl am-cf">
        <strong class="am-text-primary am-text-lg">首页</strong> /
        <small>一些常用模块</small>
    </div>
</div>

<ul class="am-avg-sm-1 am-avg-md-4 am-margin am-padding am-text-center admin-content-list ">
    <li>
        <a href="${pageContext.request.contextPath}/info/add.action" class="am-text-warning">
            <span class="am-icon-btn am-icon-briefcase"></span><br/>发布新闻
        </a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/job/createJob.action" class="am-text-success">
            <span class="am-icon-btn am-icon-file-text"></span><br/>发布招聘
        </a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/origin.action" class="am-text-danger">
            <span class="am-icon-btn am-icon-recycle"></span><br/>组织管理
        </a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/user.action" class="am-text-secondary">
            <span class="am-icon-btn am-icon-user-md"></span><br/>用户管理
        </a>
    </li>
</ul>

<!-- 控制js -->
<script src="${pageContext.request.contextPath}/assets/script/main/welcome.js"></script>