<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/portal-common/portal-tag.jsp"%>
<c:if test="${SESSION_USER.userId!=null}">
	<div class="media">
		<a class="pull-left" href="${pageContext.request.contextPath}/ta/show.action?userId=${SESSION_USER.userId}">
			<img class="thumbnail img-responsive center-block" src="${SESSION_USER.portrait}"  style="max-width: 65px"/>
		</a>
		<div class="media-body event-body">
			<h4 class="subtitle">${SESSION_USER.trueName}</h4>
			<p><ar:sub length="20" value="${SESSION_USER.introduce}" /></p>
		</div>
	</div>
</c:if>