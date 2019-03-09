<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/portal-common/portal-tag.jsp"%>

<div class="pageheader" style="max-height: 80px;">
	<h2><i class="fa fa-graduation-cap"></i>${orgroom.originName} <span>${orgroom.members}人加入</span></h2>
	<div class="breadcrumb-wrapper">
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/index.action">主页</a></li>
			<li><a href="${pageContext.request.contextPath}/org.action">校友组织</a></li>
			<li class="active">${orgroom.originName}</li>
		</ol>
	</div>
	<input id="originId" value="${orgroom.originId}" type="hidden">
</div>
<div class="mb5"></div>