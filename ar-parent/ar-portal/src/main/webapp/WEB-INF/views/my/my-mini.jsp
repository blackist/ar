<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/portal-common/portal-tag.jsp"%>
<c:if test="${SESSION_USER.userId!=null}">
	<div class="media">
		<a class="pull-left"
			href="ta/show.action?userId=${SESSION_USER.userId}"> <img
			class="media-object img-responsive" src="${SESSION_USER.headImg}"
			alt="" style="max-width: 100px;">
		</a>
		<div class="media-body">
			<h5>${SESSION_USER.userName}</h5>
			<p class="email-summary">
				<ar:sub length="20" value="${SESSION_USER.introduce}" />
			</p>
		</div>
	</div>
	<div class="row"></div>
</c:if>