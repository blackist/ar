<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- navigation -->
<ul class="nav nav-tabs nav-dark">
	<li id="index-li"><a href="${pageContext.request.contextPath}/orgroom.action?originId=${orgroom.originId}">
		<i class="fa fa-home"></i><strong> 主页</strong></a></li>
	<li id="info-li"><a href="${pageContext.request.contextPath}/orgroom/info.action?originId=${orgroom.originId}">
		<i class="fa fa-comments"></i>&nbsp;<strong>动态消息</strong></a></li>
	<li id="message-li"><a href="${pageContext.request.contextPath}/orgroom/message.action?originId=${orgroom.originId}">
		<i class="fa fa-comment"></i>&nbsp;<strong>留言板</strong></a></li>
	<li id="member-li"><a href="${pageContext.request.contextPath}/orgroom/member.action?originId=${orgroom.originId}">
		<i class="fa fa-users"></i>&nbsp;<strong>成员</strong></a></li>
	<li id="directory-li"><a href="${pageContext.request.contextPath}/orgroom/directory.action?originId=${orgroom.originId}">
		<i class="fa  fa-phone-square"></i>&nbsp;<strong>通讯录</strong></a></li>
	<li id="album-li"><a href="${pageContext.request.contextPath}/orgroom/album.action?originId=${orgroom.originId}"><i class="fa fa-picture-o"></i>&nbsp;<strong>相册</strong></a></li>
	<li id="dropdown-li" class="dropdown"><a href="javascript:;" data-toggle="dropdown" class="dropdown-toggle"><i class="fa fa-gear"></i>&nbsp;管理 <span class="caret"></span> </a>
		<ul role="menu" class="dropdown-menu pull-right">
			<%--<li><a href="orgroom/description.action?originId=${orgroom.originId}">组织简介</a></li>--%>
			<li><a href="javascript:;">组织简介</a></li>
		</ul>
	</li>
</ul>
<!-- navigation -->