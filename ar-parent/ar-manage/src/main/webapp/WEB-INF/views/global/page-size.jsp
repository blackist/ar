<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<select id="_pageSize">
	<option value="5" <c:if test="${page.pageSize==5}">selected</c:if>>5条</option>
	<option value="10" <c:if test="${page.pageSize==10}">selected</c:if>>10条</option>
	<option value="20" <c:if test="${page.pageSize==20}">selected</c:if>>20条</option>
	<option value="50" <c:if test="${page.pageSize==50}">selected</c:if>>50条</option>
</select>/页&nbsp;&nbsp;&nbsp;&nbsp;
