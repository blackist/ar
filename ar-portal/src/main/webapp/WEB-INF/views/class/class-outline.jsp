<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/portal-common/portal-tag.jsp"%>
<div class="fm-sidebar">
	<h3 class="subtitle">班级录信息</h3>
	<ul class="folder-list">
		<li><i class="fa fa-institution"></i>班级总数&nbsp;:&nbsp;${classNum}&nbsp;个班级</li>
		<li><i class="fa fa-users"></i>已加入校友&nbsp;:&nbsp;${classMembers}&nbsp;位校友</li>
	</ul>

	<div class="mb30"></div>

	<h3 class="subtitle">人气排行</h3>
	<ul class="folder-list">
		<c:forEach items="${popClasses}" var="popclass">
			<li><a href="${pageContext.request.contextPath}/classroom.action?classId=${popclass.originId}"><i
					class="fa fa-graduation-cap"></i>${popclass.originName}(${popclass.members}人)</a></li>
		</c:forEach>
	</ul>

	<div class="mb30"></div>

	<c:if test="${SESSION_USER!=null}">
		<h3 class="subtitle">我的班级</h3>
		<ul class="folder-list">
			<c:forEach items="${myClasses}" var="myclass">
				<li><a href="${pageContext.request.contextPath}/classroom.action?classId=${myclass.originId}"><i
						class="fa fa-graduation-cap"></i>${myclass.originName}</a></li>
			</c:forEach>
		</ul>
	</c:if>

	<div class="mb30"></div>

	<c:if test="${latestMembers!=null}">
		<h3 class="subtitle">最新加入校友</h3>
		<ul class="folder-list">
			<c:forEach items="${latestMembers}" var="member">
				<li><div class="media">
						<a class="pull-left col-sm-4" style="max-height: 40px;" href="${pageContext.request.contextPath}/ta/show.action?userId=${member.userId}">
							<img class="thumbnail img-responsive" src="${member.imgPath}"></a>
						<div class="media-body" style="max-height: 40px;">
							<a class="email-summary" href="${pageContext.request.contextPath}/ta/show.action?userId=">${member.trueName}</a>
							<small class="text-muted"><fmt:formatDate	value="${member.createTime}" pattern="yyyy-MM-dd HH:mm" />&nbsp; 加入</small>
							<a class="email-summary" href="${pageContext.request.contextPath}/classroom.action?classId=${member.originId}">${member.originName}</a>
						</div>
					</div></li>
			</c:forEach>
		</ul>
	</c:if>
</div>