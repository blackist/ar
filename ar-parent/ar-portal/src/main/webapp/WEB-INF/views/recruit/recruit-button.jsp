<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form action="${pageContext.request.contextPath}/recruit.action" method="get">
	<div class="btn-demo"
		style="width: 228px; float: right; ">
		<a class="btn btn-success" href="${pageContext.request.contextPath}/recruit/addRecruit.action"> <span
			class="fa fa-plus-circle"></span>&nbsp;发布招聘
		</a> <a class="btn btn-success" href="${pageContext.request.contextPath}/my/resume/addResume.action"> <span
			class="fa fa-file-text-o"></span>&nbsp;登记简历                                        
		</a>
	</div>
	<div class="input-group col-xs-3">
		<input type="hidden" name="ie" value="UTF-8"> <input
			type="text" name="queryStr" id="queryStr"
			class="form-control col-xs-3" size="10" width="100px"
			value="${queryStr}" placeholder="标题/公司/职位/工作地点"
			onkeypress="if(event.keyCode==13){queryBtn.click();return false;}" />
		<span class="input-group-btn">
			<button type="submit" id="queryBtn" class="btn btn-default">找工作</button>
		</span>
	</div>
</form>
