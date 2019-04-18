<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/portal-common/portal-tag.jsp"%>

<c:if test="${operateRemarks != null && operateRemarks!=''}">
	<div class="alert alert-info fade in nomargin">
		<button class="close" type="button" data-dismiss="alert"
			aria-hidden="true">×</button>
		<h4>说明!</h4>
		<p>${operateRemarks}</p>
	</div>
</c:if>