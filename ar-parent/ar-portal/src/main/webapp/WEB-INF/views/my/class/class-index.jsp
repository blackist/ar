<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>个人中心-信电校友录</title>
    <%@ include file="/WEB-INF/views/portal-common/portal-meta.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/portal-common/header.jsp" %>
<div class="container higher" id="container">
    <div class="pageheader">
        <h2>
            <i class="fa fa-user"></i> 个人中心 <span>我的班级</span>
        </h2>
        <div class="breadcrumb-wrapper">
            <span class="label"></span>
            <ol class="breadcrumb">
                <li><a href="index.action">主页</a></li>
                <li><a href="my.action">个人中心</a></li>
                <li class="active">我的班级</li>
            </ol>
        </div>
    </div>
    <div class="mb5"></div>
    <div class="row">
        <!-- 侧边栏 -->
        <div class="col-sm-4 col-lg-2">
            <%@ include file="/WEB-INF/views/my/my-side.jsp" %>
        </div>
        <!-- 侧边栏 -->

        <div class="col-sm-8 col-lg-10">

            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane active" id="tab-basic">

                    <%--班级列表--%>
                    <div class="people-list">
                        <c:forEach items="${classes}" var="clazz">
                            <div class="col-md-6">
                                <div class="people-item">
                                    <div class="media">
                                        <a href="classroom.action?classId=${clazz.originId}" class="pull-left"
                                           style="color: black">
                                            <h1><i class="fa fa-mortar-board"></i></h1>
                                        </a>
                                        <div class="media-body">
                                            <a href="classroom.action?classId=${clazz.originId}" style="color: black">
                                                <h4 class="person-name">${clazz.originName}</h4>
                                            </a>
                                            <div class="text-muted">
                                                <i class="fa fa-users"></i>班级成员： ${clazz.members}
                                            </div>
                                            <div class="text-muted">
                                                <i class="fa fa-calendar"></i>最近活动：
                                                <fmt:formatDate value="${clazz.stateTime}"
                                                                pattern="YYYY-MM-dd"></fmt:formatDate>
                                            </div>
                                            <ul class="social-list">
                                                <c:if test="${clazz==null}">
                                                    <li><a href="javascript:;" class="tooltips" data-toggle="tooltip"
                                                           data-placement="top" title="手机："><i
                                                            class="fa fa-mobile"></i></a></li>
                                                </c:if>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- col-md-6 -->
                        </c:forEach>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!-- row -->
</div>
<!-- container -->

<%@ include file="/WEB-INF/views/portal-common/footer.jsp" %>

</body>
<%@ include file="/WEB-INF/views/portal-common/portal-js.jsp" %>
<script src="assets/script/my/class/class-index.js"></script>
</html>