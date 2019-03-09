<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!-- navigation -->
<ul class="nav nav-tabs nav-dark">
    <li id="index-li"><a
            href="${pageContext.request.contextPath}/classroom.action?classId=${classroom.classId}"><i
            class="fa fa-home"></i><strong> 主页</strong></a></li>
    <li id="info-li"><a
            href="${pageContext.request.contextPath}/classroom/info.action?classId=${classroom.classId}"><i
            class="fa fa-comments"></i>&nbsp;<strong>班级动态</strong></a></li>
    <li id="member-li"><a
            href="${pageContext.request.contextPath}/classroom/member.action?classId=${classroom.classId}"><i
            class="fa fa-users"></i>&nbsp;<strong>成员</strong></a></li>
    <li id="directory-li"><a
            href="${pageContext.request.contextPath}/classroom/directory.action?classId=${classroom.classId}"><i
            class="fa  fa-phone-square"></i>&nbsp;<strong>通讯录</strong></a></li>
    <li id="album-li"><a
            href="${pageContext.request.contextPath}/classroom/album.action?classId=${classroom.classId}"><i
            class="fa fa-picture-o"></i>&nbsp;<strong>相册</strong></a></li>
    <li id="message-li"><a
            href="${pageContext.request.contextPath}/classroom/message.action?classId=${classroom.classId}"><i
            class="fa fa-comment"></i>&nbsp;<strong>留言板</strong></a></li>
    <li id="dropdown-li" class="dropdown"><a href="javascript:;"
                                             data-toggle="dropdown" class="dropdown-toggle"><i
            class="fa fa-gear"></i>&nbsp;管理 <span class="caret"></span> </a>
        <ul role="menu" class="dropdown-menu pull-right">
            <li><a
                    href="${pageContext.request.contextPath}/classroom/description.action?classId=${classroom.classId}">班级简介</a>
            </li>
            <li class="divider"></li>
            <%--<li><a--%>
            <%--href="classroom/audit.action?classId=${classroom.classId}">班干</a></li>--%>
        </ul>
    </li>
</ul>
<!-- navigation -->