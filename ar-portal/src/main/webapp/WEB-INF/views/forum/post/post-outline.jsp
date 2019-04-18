<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/views/portal-common/portal-tag.jsp" %>

<h5 class="subtitle">作者相关帖子：</h5>
<ul class="sidebar-list">
    <c:forEach items="${posts}" var="post">
        <li><a href="${pageContext.request.contextPath}/post/detail.action?postId=${post.infoId}">
            <i class="fa fa-angle-right"></i> ${post.infoTitle}</a>
        </li>
    </c:forEach>
</ul>