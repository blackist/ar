<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/views/portal-common/portal-tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${classroom.className}相册-信电校友录</title>
    <%@ include file="/WEB-INF/views/portal-common/portal-meta.jsp" %>
</head>

<body>
<%@ include file="/WEB-INF/views/portal-common/header.jsp" %>
<div class="container higher" id="container">
    <%@ include file="/WEB-INF/views/class/classroom/classroom-pageheader.jsp" %>
    <div class="mb5"></div>
    <!-- nav tab -->
    <%@ include file="/WEB-INF/views/class/classroom/classroom-nav.jsp" %>
    <input type="hidden" value="${classroom.classId}" id="classId">
    <!-- Tab panes -->
    <div class="tab-content" style="background-color: #ddd;">
        <!-- options -->
        <div class="row filemanager">
            <div class="col-xs-6 col-sm-4 col-md-3 document">
                <div class="thmb" style="height: 228px">
                    <a href="classroom/album/add.action?classId=${classroom.classId}">
                        <div class="thmb-prev" style="height: 170px">
                            <img src="assets/images/icon/album/plus.png" class="img-responsive center-block"/>
                        </div>
                    </a>
                    <h5 class="fm-title">
                        <a href="classroom/album/add.action?classId=${classroom.classId}">新建相册</a>
                    </h5>
                    <small class="text-muted">新建班级相册</small>
                </div><!-- thmb -->
            </div>
            <c:forEach items="${page.beanList}" var="album">
                <div class="col-xs-6 col-sm-4 col-md-3 document">
                    <div class="thmb" style="height: 228px">
                        <div class="btn-group fm-group">
                            <button type="button" class="btn btn-default dropdown-toggle fm-toggle"
                                    data-toggle="dropdown">
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu fm-menu" role="menu">
                                <li>
                                    <a href="classroom/album/image.action?classId=${classroom.classId}&albumId=${album.albumId}">
                                        <i class="fa fa-picture-o"></i> 查看相册</a></li>
                                <li>
                                    <a href="classroom/album/edit.action?classId=${classroom.classId}&albumId=${album.albumId}">
                                        <i class="fa fa-edit"></i> 编辑相册</a></li>
                                <li><a href="javascript:;" onclick="deleteAlbum(${album.albumId})"><i
                                        class="fa fa-trash-o"></i>
                                    删除相册</a></li>
                                <li>
                                    <a href="classroom/album/upload.action?classId=${classroom.classId}&albumId=${album.albumId}"><i
                                            class="fa fa-upload"></i> 上传照片</a></li>
                            </ul>
                        </div><!-- btn-group -->
                        <a href="classroom/album/image.action?albumId=${album.albumId}&classId=${album.originId}">
                            <div class="thmb-prev" style="height: 170px">
                                <img src="${album.coverImage}" class="img-responsive center-block"/>
                            </div>
                        </a>
                        <h5 class="fm-title">
                            <a href="classroom/album/image.action?albumId=${album.albumId}&classId=${album.originId}">
                                &nbsp;&nbsp;&nbsp;${album.albumName}</a>
                        </h5>
                        <small class="text-muted">&nbsp;&nbsp;&nbsp;&nbsp;更新于:<fmt:formatDate value="${album.stateTime}"
                                                                                              pattern="yyyy-MM-dd HH:mm"/></small>
                    </div><!-- thmb -->
                </div>
                <!-- col-xs-6 -->
            </c:forEach>
        </div><!-- file manager -->
        <%@ include file="/WEB-INF/views/portal-common/pagination.jsp" %>
    </div>
    <!-- Tab panes -->

</div>
<!-- container -->

<%@ include file="/WEB-INF/views/portal-common/footer.jsp" %>

</body>
<%@ include file="/WEB-INF/views/portal-common/portal-js.jsp" %>
<script src="assets/script/class/classroom/classroom-album.js"></script>
<script>
    jQuery(document).ready(function () {

        jQuery('.thmb').hover(function () {
            var t = jQuery(this);
            t.find('.fm-group').show();
        }, function () {
            var t = jQuery(this);
            if (!t.closest('.thmb').hasClass('checked')) {
                t.find('.fm-group').hide();
            }
        });

    });

</script>
</html>