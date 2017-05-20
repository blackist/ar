<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<ul class="am-list admin-sidebar-list">
    <!-- 首页 bar -->
    <li id="bar-home"><a href="manage.action"><span class="am-icon-home"></span> 首页</a></li>

    <!-- 新闻中心 -->
    <li class="admin-parent" id="bar-info">
        <a class="am-cf" href="info.action">
            <span class="am-icon-newspaper-o"></span> 信息中心
        </a>
    </li>

    <!-- 班级管理 -->
    <li class="admin-parent" id="bar-origin">
        <a class="am-cf" href="javascript:void(0)" data-am-collapse="{target: '#origin-manage'}">
            <i class="am-icon-graduation-cap"></i> 班级 / 校友组织
            <i class="am-icon-angle-right am-fr am-margin-right"></i>
        </a>
        <ul class="am-list am-collapse admin-sidebar-sub" id="origin-manage">
            <li><a href="origin.action"><i class="am-icon-institution"></i> 组织管理</a></li>
            <li><a href="origin/add.action"><i class="am-icon-plus-square"></i> &nbsp;创建组织</a></li>
        </ul>
    </li>

    <!-- 招聘管理 -->
    <li class="admin-parent" id="bar-job">
        <a class="am-cf" href="javascript:;" data-am-collapse="{target: '#job-manage'}">
            <span class="am-icon-suitcase"></span> &nbsp;职业招聘 <span class="am-icon-angle-right am-fr am-margin-right"></span>
        </a>
        <ul class="am-list am-collapse admin-sidebar-sub" id="job-manage">
            <li><a href="job.action"><span class="am-icon-th"></span> 招聘信息 </a></li>
            <li><a href="job/createJob.action"><span class="am-icon-plus"></span> 发布招聘 </a></li>
            <li><a href="job/createJob.action"><span class="am-icon-institution"></span> 招聘单位 </a></li>
        </ul>
    </li>

    <!-- 用户管理 -->
    <li class="admin-parent" id="bar-user">
        <a class="am-cf" href="javascript:void(0)" data-am-collapse="{target: '#user-manage'}">
            <i class="am-icon-group"></i> 用户管理 <i class="am-icon-angle-right am-fr am-margin-right"></i></a>
        <ul class="am-list am-collapse admin-sidebar-sub" id="user-manage">
            <li><a href="user.action"><i class="am-icon-user"></i> 用户列表 </a></li>
            <li><a href="javascript:;"><i class="am-icon-plus-square"></i> 添加用户</a></li>
        </ul>
    </li>

    <!-- 权限管理 -->
    <li class="admin-parent" id="bar-right">
        <a class="am-cf" href="javascript:;" data-am-collapse="{target: '#right-manage'}">
            <i class="am-icon-eye"></i> 权限管理
            <i class="am-icon-angle-right am-fr am-margin-right"></i>
        </a>
        <ul class="am-list am-collapse admin-sidebar-sub" id="right-manage">
            <li><a href="right/indexRight.action" class="am-cf"><i class="am-icon-search-plus"></i>所有权限</a></li>
            <li><a href="role.action" class="am-cf"><i class="am-icon-search-plus"></i>角色设置</a></li>
            <li><a href="#" class="am-cf"><i class="am-icon-puzzle-piece"></i>权限设置</a></li>
        </ul>
    </li>

    <!-- 系统设置 -->
    <li class="admin-parent" id="bar-system">
        <a class="am-cf" href="javascript:;" data-am-collapse="{target: '#system-setting'}">
            <i class="am-icon-gears"></i> 系统设置
            <i class="am-icon-angle-right am-fr am-margin-right"></i>
        </a>
        <ul class="am-list am-collapse admin-sidebar-sub" id="system-setting">
            <li><a href="dict/indexDict.action"><i class="am-icon-search-plus"></i>字典</a></li>
            <li><a href="dictData/indexDictData.action"><i class="am-icon-search-plus"></i>字典数据</a></li>
        </ul>
    </li>
    <!-- ... -->
    <li><a href="login/logout.action"><span class="am-icon-sign-out"></span> 注销</a></li>
</ul>

<!-- 公告 bookmark -->
<div class="am-panel am-panel-default admin-sidebar-panel">
    <div class="am-panel-bd">
        <p>
            <span class="am-icon-bookmark"></span> 公告
        </p>
        <p>时光静好，与君语；细水流年，与君同。—— 信电校友录</p>
    </div>
</div>


<!-- 社群 wiki -->
<div class="am-panel am-panel-default admin-sidebar-panel">
    <div class="am-panel-bd">
        <p>
            <span class="am-icon-tag"></span> 社群
        </p>
        <p>欢迎来到信电校友录后台管理!</p>
    </div>
</div>