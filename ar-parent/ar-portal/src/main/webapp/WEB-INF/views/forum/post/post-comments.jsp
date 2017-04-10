<%--
  User: black
  Date: 2017/4/10
  Time: 19:19
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%--comment list--%>
<c:forEach items="${page.beanList}" var="comment" varStatus="status">
    <li class="media">
        <a class="pull-left" href="ta/show.action?userId=${comment.userId}">
            <img class="thumbnail img-responsive center-block" src="${comment.portrait}" style="width: 65px"/>
        </a>
        <div class="media-body">
            <a href="" class="btn btn-primary btn-xs pull-right reply">回复</a>
            <h4>#${(page.pageIndex-1)*10 + status.index + 1} &nbsp;&nbsp; ${comment.trueName}</h4>
            <small class="text-muted"><fmt:formatDate value="${comment.createTime}" pattern=" Y-M-d  HH:mm "></fmt:formatDate></small>
            <p>${comment.content}</p>
        </div>
    </li><!-- media -->
</c:forEach>
<%--btn-load-more--%>
<c:if test="${page.beanList.size()>=10}">
<button class="btn btn-default btn-sm btn-block" onclick="loadMoreComment(${page.pageIndex+1})" id="btn-load-more"><i class="fa fa-plus-square-o"></i> 加载更多</button>
</c:if>
