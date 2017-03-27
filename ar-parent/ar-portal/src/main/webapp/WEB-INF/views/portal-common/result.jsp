<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/portal-common/portal-tag.jsp"%>



<c:if test="${_message!=null&&_message!=''}">
	<blockquote>
		<i class="fa fa-quote-center"></i>
		<p>${_message}</p>
	</blockquote>
</c:if>