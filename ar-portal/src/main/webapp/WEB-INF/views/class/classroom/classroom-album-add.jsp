<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/views/portal-common/portal-tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>新建相册-信电校友录</title>
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
        <form action="${pageContext.request.contextPath}/classroom/album/save.action" method="post" id="album-form">
            <div class="form-group">
                <label class="col-sm-2 control-label">相册名称 <span class="asterisk">*</span></label>
                <div class="col-sm-4">
                    <input type="text" name="albumName" id="albumName" class="form-control" required/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">相册描述 <span class="asterisk">*</span></label>
                <div class="col-sm-4">
                    <textarea name="albumDesc" id="albumDesc" rows="5" class="form-control" ></textarea>
                </div>
            </div>

            <input type="hidden" value="${classroom.classId}" name="classId" id="classId">

            <div class="form-group">
                <label class="col-sm-2 control-label"></label>
                <div class="col-sm-4">
                    <button class="btn btn-primary" type="button" onclick="addAlbum()">创 &nbsp;&nbsp; 建</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <button class="btn btn-default" type="button" onclick="location.href='classroom/album.action?classId=${classroom.classId}'">
                        取 &nbsp;&nbsp; 消</button>
                </div>
            </div>
        </form>
    </div>
    <!-- Tab panes -->

</div>
<!-- container -->

<%@ include file="/WEB-INF/views/portal-common/footer.jsp" %>

</body>
<%@ include file="/WEB-INF/views/portal-common/portal-js.jsp" %>
<script src="${pageContext.request.contextPath}/assets/script/class/classroom/classroom-album.js"></script>
</html>