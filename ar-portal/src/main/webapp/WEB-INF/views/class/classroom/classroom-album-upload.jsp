<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/views/portal-common/portal-tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>上传照片-信电校友录</title>
    <%@ include file="/WEB-INF/views/portal-common/portal-meta.jsp" %>
</head>

<body>
<%@ include file="/WEB-INF/views/portal-common/header.jsp" %>
<div class="container higher" id="container">
    <%@ include file="/WEB-INF/views/class/classroom/classroom-pageheader.jsp" %>
    <div class="mb5"></div>
    <!-- nav tab -->
    <%@ include file="/WEB-INF/views/class/classroom/classroom-nav.jsp" %>
    <!-- Tab panes -->
    <div class="tab-content" style="background-color: #ddd;">
        <form method="post" action="${pageContext.request.contextPath}/classroom/album/image/upload.action" enctype="multipart/form-data">
            <div class="panel-footer" id="picUploadBox">
                <input class="file" type="file" id="uploadInput" multiple data-max-file-count="12"
                           name="images" accept=".bmp,.jpg,.gif,.png,.jpeg"> <br>
                <button class="btn btn-default btn-block" type="submit" > <i class="fa fa-upload"></i> 上传照片</button>
                <input hidden id="classId" name="classId" value="${classroom.classId}">
                <input hidden id="albumId" name="albumId" value="${album.albumId}">
            </div>
        </form>
    </div>
    <!-- Tab panes -->

</div>
<!-- container -->

<%@ include file="/WEB-INF/views/portal-common/footer.jsp" %>

</body>
<%@ include file="/WEB-INF/views/portal-common/portal-js.jsp" %>
<script src="${pageContext.request.contextPath}/assets/script/class/classroom/classroom-album-upload.js"></script>
</html>