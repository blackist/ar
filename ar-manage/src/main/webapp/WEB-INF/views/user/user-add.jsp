<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@ include file="/WEB-INF/views/global/base-path.jsp" %>
    <title>用户添加-后台管理</title>
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
                <strong class="am-text-primary am-text-lg">用户管理</strong> /
                <small>添加用户</small>
            </div>
        </div>
        <div class="am-tabs  am-margin" data-am-tabs>
            <ul class="am-tabs-nav am-nav am-nav-tabs">
                <li class="am-active"><a href="javascript:;">信息填写</a></li>
            </ul>
            <div class="am-tabs-bd">
                <div class="am-tab-panel am-fade am-in am-active">
                    <form class="am-form" id="user-form" method="post" action="${pageContext.request.contextPath}/user/add/submit.action">

                        <div class="am-g am-margin-top-sm">
                            <div class="am-u-sm-2 am-text-right">
                                <span class="error_span"> * </span>账号（工号/学号）
                            </div>
                            <div class="am-u-sm-4 am-u-end">
                                <input type="text" name="account" id="account" class="am-input-sm" required>
                                <span class="error_span" id="info-title-error"></span>
                            </div>
                        </div>

                        <div class="am-g am-margin-top-sm">
                            <div class="am-u-sm-2 am-text-right">
                                <span class="error_span"> * </span>管理员
                            </div>
                            <div class="am-u-sm-4 am-u-end">
                                <div class="am-btn-group" data-am-button="">
                                    <label class="am-btn am-btn-default am-btn-xs">
                                        <input type="radio" name="isAdmin" value="1"> 是
                                    </label>
                                    <label class="am-btn am-btn-default am-btn-xs am-active">
                                        <input type="radio" name="isAdmin" value="0" checked="checked">否
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="am-g am-margin-top-sm">
                            <div class="am-u-sm-2 am-text-right">
                                <span class="error_span"> * </span>姓名
                            </div>
                            <div class="am-u-sm-4 am-u-end">
                                <input type="text" name="trueName" id="trueName" class="am-input-sm" required>
                                <span class="error_span" id="user-true-name"></span>
                            </div>
                        </div>

                        <div class="am-g am-margin-top-sm">
                            <div class="am-u-sm-2 am-text-right">
                                邮箱
                            </div>
                            <div class="am-u-sm-4 am-u-end">
                                <input type="text" name="email" id="email" class="am-input-sm" required>
                                <span class="error_span" id="user-email"></span>
                            </div>
                        </div>

                        <div class="am-g am-margin-top-sm">
                            <div class="am-u-sm-2 am-text-right">
                                密码
                            </div>
                            <div class="am-u-sm-4 am-u-end">
                                <input type="text"  class="am-input-sm" disabled value="12345678">
                                <span class="error_span" id="user-email"></span>
                            </div>
                        </div>



                        <div class="am-g am-margin-top-sm">
                            <div class="am-u-sm-2 am-text-right">
                                <span class="error_span"> * </span>简介
                            </div>
                            <div class="am-u-sm-8 am-u-end">
                                <textarea rows="6" name="introduce" id="introduce" required></textarea>
                                <span class="error_span" id="user-introduce"></span>
                            </div>
                        </div>

                    </form>
                </div>
            </div>

            <div class="am-margin">
                <button type="button" onclick="saveUser()" class="am-btn am-btn-primary am-btn-xs">提交</button>
                <a href="${pageContext.request.contextPath}/user.action"
                   class="am-btn am-btn-primary am-btn-xs">放弃</a>
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
<script src="${pageContext.request.contextPath}/assets/script/user/user-add.js"></script>
</body>
</html>