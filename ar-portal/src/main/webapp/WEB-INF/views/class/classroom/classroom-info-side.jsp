<%--
  TODO: 
  User: 董亮亮 1075512174@qq.com
  Date: 2017/4/23
  Time: 17:21
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ar" uri="/ar-taglib"%>

<div class="blog-sidebar">

    <h5 class="subtitle">班级动态</h5>
    <p>班级动态是了解校友近况的窗口</p>

    <div class="mb30"></div>

    <h5 class="subtitle">${classroom.className}动态：</h5>
    <c:choose>
        <c:when test="${classOtherInfos!=null && classOtherInfos.size() > 0}">
            <ul class="sidebar-list">
                <c:forEach items="${classOtherInfos}" var="classInfo">
                    <c:if test="${classInfo.infoId != infoId}">
                        <li>
                            <a href="${pageContext.request.contextPath}/classroom/infoDetail.action?classId=${classroom.classId}&infoId=${classInfo.infoId}">
                                <i class="fa fa-angle-right"></i> <ar:sub length="15" value="${classInfo.infoTitle}" />
                            </a>
                        </li>
                    </c:if>
                </c:forEach>
            </ul>
        </c:when>
        <c:otherwise>
            没有更多！
        </c:otherwise>
    </c:choose>

    <div class="mb30"></div>

    <h5 class="subtitle">${author.trueName}的相关动态：</h5>
    <c:choose>
        <c:when test="${authorOtherInfos != null && authorOtherInfos.size() > 0}">
            <ul class="sidebar-list">
                <c:forEach items="${authorOtherInfos}" var="authorInfo">
                        <li>
                            <a href="${pageContext.request.contextPath}/classroom/infoDetail.action?classId=${classroom.classId}&infoId=${authorInfo.infoId}">
                            <i class="fa fa-angle-right"></i> <ar:sub length="15" value="${authorInfo.infoTitle}" /> </a>
                        </li>
                </c:forEach>
            </ul>
        </c:when>
        <c:otherwise>
            没有更多！
        </c:otherwise>
    </c:choose>

</div>
<!-- blog-sidebar -->