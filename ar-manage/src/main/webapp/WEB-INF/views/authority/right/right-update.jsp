<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/views/global/common-taglib.jsp"%>

<div class="am-cf am-padding">
	<div class="am-fl am-cf">
		<strong class="am-text-primary am-text-lg">权限管理</strong> / <small><a
			href="right/indexRight.action"> 所有权限 </a></small> / <small> 权限编辑</small>
	</div>
</div>
<div class="am-tabs">
	<ul class="am-tabs-nav am-nav am-nav-tabs">
		<li class="am-active"><a href="#">权限属性</a></li>
	</ul>
	<div class="am-tab-panel">
		<form class="am-form" id="updateRightForm">
			<div class="am-g am-margin-top-sm">
				<div class="am-u-sm-2 am-text-right">权限名</div>
				<div class="am-u-sm-4 am-u-end">
					<input type="text" name="rightName" id="rightName"
						class="am-input-sm" value="${right.rightName}">
				</div>
			</div>

			<div class="am-g am-margin-top-sm">
				<div class="am-u-sm-2 am-text-right">权限位</div>
				<div class="am-u-sm-4 am-u-end">
					<input type="text" name="rightPos" class="am-input-sm"
						value="${right.rightPos}" readonly="readonly">
				</div>
			</div>

			<div class="am-g am-margin-top-sm">
				<div class="am-u-sm-2 am-text-right">权限码</div>
				<div class="am-u-sm-4 am-u-end">
					<input type="text" name="rightCode" class="am-input-sm"
						value="${right.rightCode}" readonly="readonly">
				</div>
			</div>

			<div class="am-g am-margin-top-sm">
				<div class="am-u-sm-2 am-text-right">权限URL</div>
				<div class="am-u-sm-4 am-u-end">
					<input type="text" name="rightUrl" class="am-input-sm"
						value="${right.rightUrl}" readonly="readonly">
				</div>
			</div>

			<div class="am-g am-margin-top">
				<div class="am-u-sm-2 am-text-right">公共资源</div>
				<div class="am-u-sm-10">
					<label class="am-btn am-btn-default am-btn-xs"> <input
						type="radio" name="isPublic" value="1"
						<c:if test="${right.isPublic == '1'}">checked="checked"</c:if>>
						是
					</label> <label class="am-btn am-btn-default am-btn-xs"> <input
						type="radio" name="isPublic" value="0"
						<c:if test="${right.isPublic == '0'}">checked="checked"</c:if>>
						否
					</label>
				</div>
			</div>

			<div class="am-g am-margin-top-sm">
				<div class="am-u-sm-2 am-text-right">状态</div>
				<div class="am-u-sm-4 am-u-end">
					<ar:dictdata dictdata="${right.state}" dict="state" />
				</div>
			</div>
			<input type="hidden" name="rightId" value="${right.rightId}">

		</form>
	</div>

	<div class="am-margin">
		<button type="button" onclick="updateRightSubmit()"
			class="am-btn am-btn-primary am-btn-xs">提交编辑</button>
		<button type="button"
			onclick="javascript:location.href='right/indexRight.action';"
			class="am-btn am-btn-primary am-btn-xs">放弃编辑</button>
	</div>
	<%@ include file="/WEB-INF/views/global/operate-remarks.jsp"%>
</div>

<!-- 控制 js -->
<script src="${pageContext.request.contextPath}/assets/script/authority/right/right-update.js"></script>



