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
    <li class="media" id="comment-li-${comment.commentId}">
        <a class="pull-left" href="ta/show.action?userId=${comment.userId}">
            <img class="thumbnail img-responsive center-block" src="${comment.portrait}" style="width: 65px"/>
        </a>
        <div class="media-body">
            <a href="javascript:;" class="btn btn-primary btn-xs pull-right reply"
               onclick="replyComment('回复 #${(page.pageIndex-1)*10 + status.index + 1} ${comment.trueName}：')">回复
            </a>
            <c:if test="${comment.userId == SESSION_USER.userId}">
            <a href="javascript:;" class="btn btn-danger btn-xs pull-right reply" style="margin-right: 5px"
               onclick="deleteComment(${comment.commentId})">删除
            </a>&nbsp;&nbsp;
            </c:if>
            <p class="pull-right"> #${(page.pageIndex-1)*10 + status.index + 1} &nbsp;</p>
            <h4> ${comment.trueName}</h4>
            <small class="text-muted"><fmt:formatDate value="${comment.createTime}" pattern=" Y-M-d  HH:mm "></fmt:formatDate></small>
            <p>${comment.content}</p>
        </div>
    </li><!-- media -->
</c:forEach>
    <%--btn-load-more--%>
<c:if test="${page.beanList.size()>=10}">
    <button class="btn btn-default btn-sm btn-block" onclick="loadMoreComment(${page.pageIndex+1})" id="btn-load-more">
        <i class="fa fa-plus-square-o"></i> 加载更多
    </button>
</c:if>
<c:if test="${page.beanList == null || page.beanList.size() == 0}">
    <span>暂无更多评论</span>
</c:if>

