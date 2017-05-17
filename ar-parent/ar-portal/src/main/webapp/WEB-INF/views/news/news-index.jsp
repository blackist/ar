<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/views/portal-common/portal-tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>新闻中心-信电校友录</title>
    <%@ include file="/WEB-INF/views/portal-common/portal-meta.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/portal-common/header.jsp" %>
<%@ include file="/WEB-INF/views/portal-common/navmenu.jsp" %>
<div class="container higher" id="container">
    <section>
        <!-- 导航栏 -->
        <div class="header">
            <ol class="breadcrumb">
                <li><i class="fa fa-home"></i>&nbsp;<a href="index.action">主页</a></li>
                <li class="active">新闻中心</li>
            </ol>
        </div>

        <div class="col-md-9">

            <!-- 校友新闻 -->
            <div class="panel panel-default panel-alt widget-messaging">
                <div class="panel-heading">
                    <div class="panel-btns">
                        <a href="forum.action" class="panel-edit"><i class="fa fa-chevron-right"></i></a>
                    </div>
                    <h1 class="panel-title">校友新闻</h1>
                </div>
                <div class="panel-body">
                    <ul>
                        <c:forEach items="${page.beanList}" var="info">
                            <li>
                                <small class="pull-right">
                                    <fmt:formatDate value="${info.createTime}" pattern="M月d日"></fmt:formatDate>
                                </small>
                                <a href="news/detail.action?infoId=${info.infoId}"><h4
                                        class="sender">${info.infoTitle}</h4>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div><!-- panel-body -->
            </div><!-- panel -->
            <%@include file="/WEB-INF/views/portal-common/pagination.jsp"%>
        </div>
        <!-- col-md-9 -->

        <div class="col-md-3" id="news-outline"></div>
    </section>
</div>

<%@ include file="/WEB-INF/views/portal-common/footer.jsp" %>

</body>
<%@ include file="/WEB-INF/views/portal-common/portal-js.jsp" %>
<script src="assets/script/news/news-index.js"></script>
</html>