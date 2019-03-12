<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/views/global/common-taglib.jsp"%>

<div class="am-cf am-padding">
	<div class="am-fl am-cf">
		<strong class="am-text-primary am-text-lg">班级录</strong> / <small>班级信息</small>
	</div>
</div>

<div class="am-g">
	<div class="am-u-md-9 am-cf">
		<div class="am-fl am-cf">
			<div class="am-btn-toolbar am-fl">
				<div class="am-btn-group am-btn-group-xs">
					<button type="button"
						onclick="javascript:$.AMUI.progress.start();location.href='cm/createClass.action';"
						class="am-btn am-btn-default">
						<span class="am-icon-plus"></span> 创建班级
					</button>
				</div>
				<div class="am-form-group am-margin-left am-fl">
					<%@ include file="/WEB-INF/views/global/page-size.jsp"%>
					分类：<select id="stateStr" class="dll-query">
						<option value="" <c:if test="${stateStr==''}">selected</c:if>>全部</option>
						<option value="A" <c:if test="${stateStr=='A'}">selected</c:if>>正常</option>
						<option value="X" <c:if test="${stateStr=='D'}">selected</c:if>>已删除</option>
						<option value="E" <c:if test="${stateStr=='E'}">selected</c:if>>异常</option>
					</select> &nbsp;&nbsp;&nbsp;入学年份：<select id="selectStr" class="dll-query">
						<option value="">年份不限</option>
						<c:forEach items="${classGrade}" var="grade">
							<option value="${grade.value}"
								<c:if test="${selectStr==grade.value}">selected</c:if>>${grade.value}</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>
	</div>
	<div class="am-u-md-3 am-cf">
		<div class="am-fr">
			<div class="am-input-group am-input-group-sm">
				<input type="text" id="queryStr" class="am-form-field"
					placeholder="专业关键字/校友姓名" value="${queryStr}"
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
						<th class="table-check"><input type="checkbox" class="alls" /></th>
						<th class="table-title">入学年份</th>
						<th class="table-type">班级</th>
						<th class="table-detail">人数</th>
						<th class="table-detail">创建时间</th>
						<th class="table-set">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${page.beanList}" var="clazz">
						<tr>
							<td><input type="checkbox" value="${clazz.classId}" /></td>
							<td>${clazz.classGrade}级</td>
							<td><a href="${pageContext.request.contextPath}/crm.action?classId=${clazz.classId}"
								target="blank">${clazz.className}</a></td>
							<td>${clazz.members}</td>
							<td><fmt:formatDate value="${clazz.createTime}"
									pattern="yyyy-MM-dd" /></td>
							<td>
								<div class="am-btn-toolbar">
									<div class="am-btn-group am-btn-group-xs">
										<c:if test="${clazz.state!='A'}">
											<button type="button"
												onclick="javascript:recoverClass('${clazz.classId}')"
												class="am-btn am-btn-default am-btn-xs am-text-danger confirm">
												<i class="am-icon-recycle"></i> 恢复
											</button>
										</c:if>
										<c:if test="${clazz.state!='E' && clazz.state!='X'}">
											<button type="button"
												onclick="javascript:excepClass('${clazz.classId}')"
												class="am-btn am-btn-default am-btn-xs am-text-danger confirm">
												<span class="am-icon-trash-o"></span> 异常冻结
											</button>
										</c:if>
										<c:if test="${clazz.state!='X'}">
											<button type="button"
												onclick="javascript:removeClass('${clazz.classId}')"
												class="am-btn am-btn-default am-btn-xs am-text-danger confirm">
												<span class="am-icon-trash-o"></span> 删除
											</button>
										</c:if>
										<c:if test="${clazz.state=='X'}">
											<button type="button"
												onclick="javascript:deleteClass('${clazz.classId}')"
												class="am-btn am-btn-default am-btn-xs am-text-danger confirm">
												<span class="am-icon-trash-o"></span> 彻底删除
											</button>
										</c:if>
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
	<!-- 操作说明 -->
	<%@ include file="/WEB-INF/views/global/operate-message.jsp"%>
	<!-- 控制 js -->
	<script src="${pageContext.request.contextPath}/assets/script/cm/cm-query.js"></script>
</div>