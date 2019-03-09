<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%--<img src="assets/images/photos/profile-2.png" class="thumbnail img-responsive" />--%>
<img src="${SESSION_USER.portrait}" class="thumbnail img-responsive"/>
<h1 class="subtitle">基本信息</h1>
<ul class="nav nav-pills nav-stacked nav-email ul-h">
    <li id="my-home"><a href="${pageContext.request.contextPath}/my.action"><i
            class="glyphicon glyphicon-home"></i>主页</a></li>
    <li id="my-profile"><a href="${pageContext.request.contextPath}/my/profile/basic.action"><i
            class="fa fa-user"></i>个人资料</a></li>
    <li id="my-account"><a href="${pageContext.request.contextPath}/my/account.action"><i class="fa fa-gears"></i>账户设置</a></li>
</ul>

<div class="mb10"></div>
<h1 class="subtitle">应用信息</h1>
<ul class="nav nav-pills nav-stacked nav-email">
    <li id="my-class"><a href="${pageContext.request.contextPath}/my/class.action"><i class="fa fa-mortar-board"></i>我的班级</a></li>
    <li id="my-forum"><a href="${pageContext.request.contextPath}/my/forum.action"><i class="fa fa-group"></i>我的论坛</a></li>
    <li id="my-recruit"><a href="${pageContext.request.contextPath}/my/recruit.action"><i class="fa fa-bookmark"></i>我的招聘</a></li>
</ul>

<%--<div class="mb10"></div>--%>
<%--<h1 class="subtitle">其它</h1>--%>
<%--<ul class="nav nav-pills nav-stacked nav-email">--%>
<%--<li><a href="email.html"> <span class="badge pull-right">2</span>--%>
<%--<i class="glyphicon glyphicon-folder-open"></i> 校内新闻--%>
<%--</a></li>--%>
<%--<li><a href="#"><i class="glyphicon glyphicon-folder-open"></i>--%>
<%--文章</a></li>--%>
<%--<li><a href="#"><i class="glyphicon glyphicon-folder-open"></i>--%>
<%--邀请</a></li>--%>
<%--<li><a href="#"> <i class="glyphicon glyphicon-folder-open"></i>--%>
<%--邮箱--%>
<%--</a></li>--%>
<%--</ul>--%>