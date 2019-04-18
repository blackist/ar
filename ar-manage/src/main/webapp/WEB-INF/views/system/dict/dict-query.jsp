<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/views/global/common-taglib.jsp"%>

<div class="am-cf am-padding">
	<div class="am-fl am-cf">
		<strong class="am-text-primary am-text-lg">系统设置</strong> / <small>字典</small>
	</div>
</div>

<div class="am-g">
	<div class="am-u-md-6 am-cf">
		<div class="am-fl am-cf">
			<div class="am-btn-toolbar am-fl">
				<div class="am-btn-group am-btn-group-xs">
					<button type="button" onclick="addDict()"
						class="am-btn am-btn-default">
						<span class="am-icon-plus"></span> 新增
					</button>
				</div>
				<div class="am-form-group am-margin-left am-fl">
					<%@ include file="/WEB-INF/views/global/page-size.jsp"%>
				</div>
			</div>
		</div>
	</div>
	<div class="am-u-md-3 am-cf">
		<div class="am-fr">
			<div class="am-input-group am-input-group-sm">
				<input type="text" id="queryInput" class="am-form-field"
					placeholder="字典名/字典值/标注" value="${queryInput}"
					onkeypress="if(event.keyCode==13){queryBtn.click();return false;}">
				<span class="am-input-group-btn">
					<button class="am-btn am-btn-default" type="button" id="queryBtn">搜索</button>
				</span>
			</div>
		</div>
	</div>
</div>

<div class="am-g">
	<div class="am-u-sm-12">
		<form class="am-form">
			<table class="am-table am-table-striped am-table-hover table-main">
				<thead>
					<tr>
						<th class="table-check"><input type="checkbox" /></th>
						<th class="table-title">字典名</th>
						<th class="table-type">字典值</th>
						<th class="table-detail">标注</th>
						<th class="table-set">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${page.beanList}" var="dict">
						<tr>
							<td><input type="checkbox" /></td>
							<td>${dict.dictName}</td>
							<td>${dict.dictValue}</td>
							<td>${dict.remark}</td>
							<td>
								<div class="am-btn-toolbar">
									<div class="am-btn-group am-btn-group-xs">
										<button type="button"
											onclick="javascript:updateDict('${dict.dictValue}')"
											class="am-btn am-btn-default am-btn-xs am-text-secondary">
											<span class="am-icon-pencil-square-o"></span> 编辑
										</button>
										<button type="button"
											<%-- onclick="javascript:deleteDict('${dict.dictValue}')" --%>
											class="am-btn am-btn-default am-btn-xs am-text-danger">
											<span class="am-icon-trash-o"></span> 删除
										</button>
									</div>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 页码 -->
			<%@ include file="/WEB-INF/views/global/page-index.jsp"%>
			<!-- 页面操作备注 -->
			<%@ include file="/WEB-INF/views/global/operate-remarks.jsp"%>
		</form>
	</div>
	<!-- 操作结果提示 -->
	<%@ include file="/WEB-INF/views/global/operate-message.jsp"%>
	<!-- 控制 js -->
	<script src="${pageContext.request.contextPath}/assets/script/system/dict/dict-query.js"></script>
</div>