<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/global/common-taglib.jsp" %>

<header class="am-topbar admin-header">
    <!-- 导航 -->
    <div class="am-topbar-brand">
        <strong>信电校友录</strong>
        <small>后台管理</small>
    </div>

    <!-- 用户中心入口 -->
    <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
        <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
            <li class="am-dropdown" data-am-dropdown>
                <a href="javascript:void(0)" class="am-dropdown-toggle" data-am-dropdown-toggle>
                    <span class="am-icon-users"></span>&nbsp;&nbsp; ${SESSION_ADMIN.account} &nbsp;&nbsp;<span
                        class="am-icon-caret-down"></span></a>
                <ul class="am-dropdown-content">
                    <li><a href="javascript:;"><span class="am-icon-user"></span> 个人中心</a></li>
                    <li><a href="login/logout.action"><span class="am-icon-power-off"></span> 退出</a></li>
                </ul>
            </li>
            <li><a href="javascript:void(0)" id="admin-fullscreen"><span
                    class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
        </ul>
    </div>
</header>
