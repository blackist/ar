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

<div class="container higher" id="container">
    <section>
        <!-- 导航栏 -->
        <div class="header">
            <ol class="breadcrumb">
                <li><i class="fa fa-home"></i>&nbsp;<a href="${pageContext.request.contextPath}/index.action">主页</a>
                </li>
                <li class="active">班级录</li>
            </ol>
        </div>
        <div class="row">
            <div class="col-sm-9">
                <%@ include file="/WEB-INF/views/class/query-form.jsp" %>

                <h3>&nbsp;班级录</h3>
                <hr>
                <div id="bloglist" class="row" style="position: relative;">
                    <c:forEach items="${gradeList}" var="grade">
                        <div class="col-sm-3">
                            <div class="blog-item">
                                <div class="blog-details">
                                    <h4 class="blog-title">
                                        <a
                                                href="${pageContext.request.contextPath}/class/queryClasses.action?selectStr=${grade.gradeValue}">${grade.gradeValue}级</a>
                                    </h4>
                                    <ul class="blog-meta">
                                        <li>创建于:<fmt:formatDate value="${grade.createTime}"
                                                                pattern="yyyy-MM-dd"></fmt:formatDate>
                                        </li>
                                        <li><a
                                                href="${pageContext.request.contextPath}/class/queryClasses.action?selectStr=${grade.gradeValue}">${grade.classNum}个班级</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="col-sm-3" id="class-outline"></div>
        </div>
    </section>
</div>

<%@ include file="/WEB-INF/views/portal-common/footer.jsp" %>

</body>
<%@ include file="/WEB-INF/views/portal-common/portal-js.jsp" %>
<script src="${pageContext.request.contextPath}/assets/script/class/class-index.js"></script>
</html>