<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/views/portal-common/portal-tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>班级录-信电校友录</title>
    <%@ include file="/WEB-INF/views/portal-common/portal-meta.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/portal-common/header.jsp" %>

<%@ include file="/WEB-INF/views/portal-common/navmenu.jsp" %>

<div class="banner-bottom">
    <div class="container higher" id="container">
        <section>
            <!-- 导航栏 -->
            <div class="header">
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i>&nbsp;<a href="${pageContext.request.contextPath}/index.action">主页</a></li>
                    <li class="active">班级录</li>
                </ol>
            </div>
            <div class="row">
                <div class="col-sm-9">
                    <%@ include file="/WEB-INF/views/class/query-form.jsp" %>
                    <h3>&nbsp;班级录</h3>
                    <hr>
                    <div class="table-responsive">
                        <table class="table table-primary mb30">
                            <thead>
                            <tr>
                                <th>入学年份</th>
                                <th>班级名称</th>
                                <th>人数</th>
                                <th>创建时间</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${page.beanList}" var="clazz">
                                <tr>
                                    <td>${clazz.originGrade}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/classroom.action?classId=${clazz.originId}">${clazz.originName}</a>
                                    </td>
                                    <td>${clazz.members}</td>
                                    <td><fmt:formatDate value="${clazz.createTime}" pattern="yyyy-MM-dd"/></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <c:if test="${page.totalRows < 1}">
                        <div class="alert alert-info">
                            <button class="close" aria-hidden="true" data-dismiss="alert" type="button">×</button>
                            <strong>抱歉，没有相关班级!</strong>
                        </div>
                    </c:if>
                    <c:if test="${page.totalRows > 0}">
                        <%@ include file="/WEB-INF/views/portal-common/pagination.jsp" %>
                    </c:if>
                </div>
                <div class="col-sm-3" id="class-outline"></div>
            </div>
        </section>
    </div>
</div>

<%@ include file="/WEB-INF/views/portal-common/footer.jsp" %>

</body>
<%@ include file="/WEB-INF/views/portal-common/portal-js.jsp" %>
<script src="${pageContext.request.contextPath}/assets/script/class/class-query.js"></script>
</html>