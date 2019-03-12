<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/views/global/common-taglib.jsp"%>
<div class="am-cf am-padding">
	<div class="am-fl am-cf">
		<strong class="am-text-primary am-text-lg">权限管理</strong> / <small>系统权限</small>
	</div>
</div>

<div class="am-g">
	<div class="am-u-md-6 am-cf">
		<div class="am-fl am-cf">
			<div class="am-btn-toolbar am-fl">
				<div class="am-btn-group am-btn-group-xs">
					<button type="button" onclick="batchRights()"
						class="am-btn am-btn-default">
						<span class="am-icon-edit"></span> 批量更新
					</button>
					<button type="button" onclick="scanAddRights()"
						class="am-btn am-btn-default">
						<span class="am-icon-edit"></span> 扫描
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
					placeholder="权限名称/URL" value="${queryInput}"
					onkeypress="if(event.keyCode==13){queryBtn.click();return false;}">
				<span class="am-input-group-btn">
					<button class="am-btn am-btn-default dll-query" type="button"
						id="queryBtn">搜索</button>
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
						<th class="table-title">权限id</th>
						<th class="table-title">权限名</th>
						<th class="table-title">权限位</th>
						<th class="table-title">权限码</th>
						<th class="table-title">URL</th>
						<th class="table-type">公共权限</th>
						<th class="table-type">状态</th>
						<th class="table-set">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${page.beanList}" var="right">
						<tr>
							<td><input type="checkbox" /></td>
							<td>${right.rightId}</td>
							<td>${right.rightName}</td>
							<td>${right.rightPos}</td>
							<td>${right.rightCode}</td>
							<td>${right.rightUrl}</td>
							<td><ar:dictdata dictdata="${right.isPublic}" dict="ny" /></td>
							<td><ar:dictdata dictdata="${right.state}" dict="state"></ar:dictdata></td>
							<td>
								<div class="am-btn-toolbar">
									<div class="am-btn-group am-btn-group-xs">
										<button type="button"
											onclick="javascript:updateRight('${right.rightId}')"
											class="am-btn am-btn-default am-btn-xs am-text-secondary">
											<span class="am-icon-pencil-square-o"></span> 编辑
										</button>
										<button type="button"
											onclick="javascript:deleteRight('${right.rightId}')"
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
	<%@ include file="/WEB-INF/views/global/operate-message.jsp"%>
	<!-- 控制 js -->
	<script src="${pageContext.request.contextPath}/assets/script/authority/right/right-query.js"></script>
</div>