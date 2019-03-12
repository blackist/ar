<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/views/global/common-taglib.jsp"%>

<div class="am-cf am-padding">
	<div class="am-fl am-cf">
		<strong class="am-text-primary am-text-lg">系统设置</strong> / <small><a
			href="${pageContext.request.contextPath}/dictData/indexDictData.action"> 字典数据 </a></small> / <small>添加字典数据</small>
	</div>
</div>
<div class="am-tabs  am-margin" data-am-tabs>
	<ul class="am-tabs-nav am-nav am-nav-tabs">
		<li class="am-active"><a href="javascript:;">字典数据</a></li>
	</ul>
	<div class="am-tabs-bd">
		<div class="am-tab-panel am-fade am-in am-active" id="dictdataform">
			<form class="am-form" id="dictdataForm" >
				<div class="am-g am-margin-top">
					<div class="am-u-sm-2 am-text-right">字典值</div>
					<div class="am-u-sm-4 am-u-end">
						<select data-am-selected="{btnSize:'sm'}" class="am-input-sm"
							name="dictValue" id="dictValue" required="required">
							<option value="">请选择...</option>
							<c:forEach items="${dictList}" var="dict">
								<option value="${dict.dictValue}">${dict.dictName}</option>
							</c:forEach>
						</select> <span class="error_span" id="dictValue_span"></span>
					</div>
				</div>

				<div class="am-g am-margin-top-sm">
					<div class="am-u-sm-2 am-text-right">字典数据名</div>
					<div class="am-u-sm-4 am-u-end">
						<input type="text" name="dictdataName" class="am-input-sm"
							id="dictdataName">
					</div>
				</div>

				<div class="am-g am-margin-top-sm">
					<div class="am-u-sm-2 am-text-right">字典数据值</div>
					<div class="am-u-sm-4 am-u-end">
						<input type="text" name="dictdataValue" class="am-input-sm"
							value="" required maxlength="20" id="dictdataValue"
							placeholder="不超过20字符"> <span class="error_span"
							id="dictdataValue_span"></span>
					</div>
				</div>

				<div class="am-g am-margin-top-sm">
					<div class="am-u-sm-2 am-text-right">是否固定</div>
					<div class="am-u-sm-4 am-u-end">
						<input type="radio" name="isFixed" value="1" checked="checked">是
						<input type="radio" name="isFixed" value="0">否
					</div>
				</div>
			</form>
		</div>
	</div>

	<div class="am-margin">
		<button type="button" onclick="addDictDataSubmit()"
			class="am-btn am-btn-primary am-btn-xs">提交保存</button>
		<button type="button" class="am-btn am-btn-primary am-btn-xs"
			onclick="loadDictDataIndex()">放弃保存</button>
	</div>
	<%@ include file="/WEB-INF/views/global/operate-remarks.jsp"%>
</div>

<script src="${pageContext.request.contextPath}/assets/js/amazeui.js"></script>

<!-- 控制 js -->
<script src="${pageContext.request.contextPath}/assets/script/system/dictdata/dictdata-add.js"></script>