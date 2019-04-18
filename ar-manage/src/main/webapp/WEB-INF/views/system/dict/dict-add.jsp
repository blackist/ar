<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/global/common-taglib.jsp" %>
<%@ include file="/WEB-INF/views/global/common-js.jsp"%>

<div class="am-cf am-padding">
	<div class="am-fl am-cf">
		<strong class="am-text-primary am-text-lg">系统设置</strong> / <small><a
			href="${pageContext.request.contextPath}/dict/indexDict.action">字典</a></small> / <small>添加字典</small>
	</div>
</div>
<div class="am-tabs">
	<ul class="am-tabs-nav am-nav am-nav-tabs">
		<li class="am-active"><a href="javascript:;">字典属性</a></li>
	</ul>
	<div class="am-tab-panel">
		<form class="am-form" id="dictForm">
			<div class="am-g am-margin-top-sm">
				<div class="am-u-sm-2 am-text-right">字典名</div>
				<div class="am-u-sm-4 am-u-end">
					<input type="text" name="dictName" class="am-input-sm"
						id="dictName">
				</div>
			</div>

			<div class="am-g am-margin-top-sm">
				<div class="am-u-sm-2 am-text-right">字典值</div>
				<div class="am-u-sm-4 am-u-end">
					<input type="text" name="dictValue" class="am-input-sm" value=""
						required maxlength="20" id="dictValue" placeholder="不超过20字符">
					<span class="error_span" id="dictValue_span"></span>
				</div>
			</div>

			<div class="am-g am-margin-top-sm">
				<div class="am-u-sm-2 am-text-right">字典标注</div>
				<div class="am-u-sm-4 am-u-end">
					<textarea rows="4" name="remark"></textarea>
				</div>
			</div>
		</form>
	</div>

	<div class="am-margin">
		<button type="button" onclick="addDictSubmit()"
			class="am-btn am-btn-primary am-btn-xs">提交保存</button>
		<button type="button" class="am-btn am-btn-primary am-btn-xs"
			onclick="loadDictIndex()">放弃保存</button>
	</div>

	<%@ include file="/WEB-INF/views/global/operate-remarks.jsp"%>
</div>

<!-- 控制 js -->
<script src="${pageContext.request.contextPath}/assets/script/system/dict/dict-add.js"></script>