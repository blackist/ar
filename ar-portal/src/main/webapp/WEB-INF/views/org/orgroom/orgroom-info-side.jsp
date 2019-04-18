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

    <h5 class="subtitle"><ar:dictdata dictdata="${orgroom.originType}" dict="ot"></ar:dictdata>动态</h5>
    <p><ar:dictdata dictdata="${orgroom.originType}" dict="ot"></ar:dictdata>动态是了解校友近况的窗口</p>

    <div class="mb30"></div>

    <h5 class="subtitle">${orgroom.originName}动态：</h5>
    <c:choose>
        <c:when test="${originOtherInfos!=null && originOtherInfos.size() > 0}">
            <ul class="sidebar-list">
                <c:forEach items="${originOtherInfos}" var="originInfo">
                    <c:if test="${originInfo.infoId != infoId}">
                        <li>
                            <a href="${pageContext.request.contextPath}/orgroom/infoDetail.action?originId=${orgroom.originId}&infoId=${originInfo.infoId}">
                                <i class="fa fa-angle-right"></i> <ar:sub length="15" value="${originInfo.infoTitle}" />
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
                            <a href="${pageContext.request.contextPath}/orgroom/infoDetail.action?originId=${orgroom.originId}&infoId=${authorInfo.infoId}">
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