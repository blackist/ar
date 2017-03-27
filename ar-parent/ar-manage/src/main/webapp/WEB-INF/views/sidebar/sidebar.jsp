<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<ul class="am-list admin-sidebar-list">
	<!-- 首页 bar -->
	<%@ include file="/WEB-INF/views/sidebar/bar-home.jsp"%>
	<!-- 班级管理 -->
	<%@ include file="/WEB-INF/views/sidebar/bar-class.jsp"%>
	<!-- 校友动态 -->
	<%@ include file="/WEB-INF/views/sidebar/bar-news.jsp"%>
	<!-- 校友组织 -->
	<%@ include file="/WEB-INF/views/sidebar/bar-org.jsp"%>
	<!-- 校友论坛 -->
	<%@ include file="/WEB-INF/views/sidebar/bar-forum.jsp"%>
	<!-- 招聘管理 -->
	<%@ include file="/WEB-INF/views/sidebar/bar-job.jsp"%>
	<!-- 权限管理 -->
	<%@ include file="/WEB-INF/views/sidebar/bar-right.jsp"%>
	<!-- 系统设置 -->
	<%@ include file="/WEB-INF/views/sidebar/bar-system.jsp"%>
	<!-- ... -->
	<li><a href="login/logout.action"><span
			class="am-icon-sign-out"></span> 注销</a></li>
</ul>

<!-- 公告 bookmark -->
<%@ include file="/WEB-INF/views/global/bookmark.jsp"%>

<!-- 社群 wiki -->
<%@ include file="/WEB-INF/views/global/wiki.jsp"%>

<script src="assets/script/sidebar/sidebar.js"></script>