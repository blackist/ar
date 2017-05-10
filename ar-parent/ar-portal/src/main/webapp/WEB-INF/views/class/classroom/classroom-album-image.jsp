<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/views/portal-common/portal-tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${classroom.className}相册-信电校友录</title>
    <%@ include file="/WEB-INF/views/portal-common/portal-meta.jsp" %>
    <link rel="stylesheet" href="assets/css/prettyPhoto.css"/>
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

        <ul class="filemanager-options">
            <li>
                <div class="ckbox ckbox-default">
                    <input type="checkbox" id="selectall" value="1"/>
                    <label for="selectall">全选</label>
                </div>
            </li>
            <li><a href="classroom/album/upload.action?classId=${classroom.classId}&albumId=${album.albumId}"
                   class=""><i class="fa fa-upload"></i> 上传照片</a></li>
            <li><a href="javascript:;" class="itemopt disabled"><i class="fa fa-download"></i> 下载选中</a></li>
            <li><a href="javascript:;" class="itemopt disabled"><i class="fa fa-trash-o"></i> 删除选中</a></li>
            <li class="filter-type"><span style="font-size: 16px">${album.albumName} &nbsp; | &nbsp; <fmt:formatDate value="${album.createTime}"
                                                                         pattern="yyyy-MM-dd HH:mm"/></span></li>
        </ul>

        <div class="row filemanager">
            <c:forEach items="${page.beanList}" var="image">
                <div class="col-xs-6 col-sm-4 col-md-3 document">
                    <div class="thmb" style="min-height: 200px; text-align: center">
                        <div class="ckbox ckbox-default">
                            <input type="checkbox" id="check${image.imageId}" name="imageId" value="${image.imageId}"/>
                            <label for="check${image.imageId}"></label>
                        </div>
                        <div class="btn-group fm-group">
                            <button type="button" class="btn btn-default dropdown-toggle fm-toggle"
                                    data-toggle="dropdown">
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu fm-menu" role="menu">
                                <li>
                                    <a href="download.action?fileRelPath=${image.imagePath}&fileName=${image.imageName}">
                                        <i class="fa fa-download"></i> 下载照片</a></li>
                                <li>
                                    <a href="classroom/album/image/delete.action?classId=${classroom.classId}&albumId=${album.albumId}&imageId=${image.imageId}">
                                        <i class="fa fa-trash-o"></i> 删除照片</a></li>
                                <li>
                                    <a href="classroom/album/cover.action?classId=${classroom.classId}&albumId=${album.albumId}&imageId=${image.imageId}">
                                        <i class="fa fa-trash-o"></i> 设为封面</a></li>
                            </ul>
                        </div><!-- btn-group -->
                        <a href="${image.imagePath}" id="image_pre_${image.imageId}" data-rel="prettyPhoto">
                            <div class="thmb-prev" style="height: 170px">
                                <img src="${image.imagePath}" class="img-responsive"/>
                            </div>
                        </a>
                        <small class="text-muted">上传于:<fmt:formatDate value="${image.createTime}"
                                                                      pattern="yyyy-MM-dd HH:mm"/></small>
                    </div><!-- thmb -->
                </div>
                <!-- col-xs-6 -->
            </c:forEach>
        </div>
        <%@ include file="/WEB-INF/views/portal-common/pagination.jsp" %>

        <input type="hidden" value="${classroom.classId}" id="classId">
        <input type="hidden" value="${album.albumId}" id="albumId">
    </div>
    <!-- Tab panes -->

</div>
<!-- container -->

<%@ include file="/WEB-INF/views/portal-common/footer.jsp" %>

</body>
<%@ include file="/WEB-INF/views/portal-common/portal-js.jsp" %>
<script src="assets/js/jquery.prettyPhoto.js"></script>
<script src="assets/script/class/classroom/classroom-album-image.js"></script>
</html>