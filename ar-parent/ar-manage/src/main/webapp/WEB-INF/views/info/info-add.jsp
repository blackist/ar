<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@ include file="/WEB-INF/views/global/base-path.jsp" %>
    <title>信息中心-后台管理</title>
    <%@ include file="/WEB-INF/views/global/manage-meta.jsp" %>
    <%@ include file="/WEB-INF/views/global/common-css.jsp" %>
</head>
<body>
<!-- header -->
<%@ include file="/WEB-INF/views/global/header.jsp" %>

<!-- 主管理区域 admin-main -->
<div class="am-cf admin-main">

    <!-- 侧边栏 side bar start -->
    <div class="admin-sidebar">
        <%@ include file="/WEB-INF/views/global/sidebar.jsp" %>
    </div>
    <!-- side bar end -->

    <!-- 内容区域 content start -->
    <div class="admin-content" id="admin-content">
        <div class="am-cf am-padding">
            <div class="am-fl am-cf">
                <strong class="am-text-primary am-text-lg">信息中心</strong> /
                <small>信息发布</small>
            </div>
        </div>
        <div class="am-tabs  am-margin" data-am-tabs>
            <ul class="am-tabs-nav am-nav am-nav-tabs">
                <li class="am-active"><a href="javascript:;">信息填写</a></li>
            </ul>
            <div class="am-tabs-bd">
                <div class="am-tab-panel am-fade am-in am-active">
                    <form class="am-form" id="info-form" method="post" action="${pageContext.request.contextPath}/info/save.action">

                        <div class="am-g am-margin-top-sm">
                            <div class="am-u-sm-2 am-text-right">
                                <span class="error_span"> * </span>标题
                            </div>
                            <div class="am-u-sm-4 am-u-end">
                                <input type="text" name="infoTitle" id="infoTitle" class="am-input-sm" required>
                                <span class="error_span" id="info-title-error"></span>
                            </div>
                        </div>

                        <div class="am-g am-margin-top-sm">
                            <div class="am-u-sm-2 am-text-right">
                                <span class="error_span"> * </span>类型
                            </div>
                            <div class="am-u-sm-4 am-u-end">
                                <select name="infoType" id="infoType"
                                        data-am-selected="{btnSize:'sm'}" class="am-input-sm" required>
                                    <c:forEach items="${infoTypes}" var="type">
                                        <option value="${type.value}"
                                                <c:if test="${type.value == 'AN'}">selected</c:if>>${type.name}</option>
                                    </c:forEach>
                                </select>
                                <span class="error_span" id="info-type-span"></span>
                            </div>
                        </div>

                        <div class="am-g am-margin-top-sm">
                            <div class="am-u-sm-2 am-text-right">主题</div>
                            <div class="am-u-sm-4 am-u-end">
                                <select name="theme" id="theme" required
                                        data-am-selected="{btnSize:'sm'}" class="am-input-sm">
                                    <option value="">请选择...</option>
                                    <c:forEach items="${infoThemes}" var="the">
                                        <option value="${the.value}">${the.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="am-g am-margin-top-sm">
                            <div class="am-u-sm-2 am-text-right">
                                <span class="error_span"> * </span>置顶
                            </div>
                            <div class="am-u-sm-4 am-u-end">
                                <div class="am-btn-group" data-am-button="">
                                    <label class="am-btn am-btn-default am-btn-xs">
                                        <input type="radio" name="isTop" value="1"> 是
                                    </label>
                                    <label class="am-btn am-btn-default am-btn-xs am-active">
                                        <input type="radio" name="isTop" value="0" checked="checked">否
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="am-g am-margin-top-sm">
                            <div class="am-u-sm-2 am-text-right">
                                <span class="error_span"> * </span>内容
                            </div>
                            <div class="am-u-sm-8 am-u-end">
                                <textarea rows="6" name="content" id="content"></textarea>
                                <span class="error_span" id="content-error"></span>
                            </div>
                        </div>

                    </form>
                </div>
            </div>

            <div class="am-margin">
                <button type="button" onclick="saveInfo()" class="am-btn am-btn-primary am-btn-xs">发布信息</button>
                <a href="${pageContext.request.contextPath}/info.action" class="am-btn am-btn-primary am-btn-xs">放弃发布</a>
            </div>
            <%@ include file="/WEB-INF/views/global/operate-remarks.jsp" %>
        </div>
    </div>
    <!-- content end -->

</div>
<!-- footer -->
<%@ include file="/WEB-INF/views/global/footer.jsp" %>

<!-- 控制js -->
<%@ include file="/WEB-INF/views/global/common-js.jsp" %>
<script src="${pageContext.request.contextPath}/assets/script/info/info-add.js"></script>
</body>
</html>