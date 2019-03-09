<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/portal-common/portal-tag.jsp" %>
<form action="${pageContext.request.contextPath}/class/queryClasses.action" method="post">
    <div class="form-group">
        <div class="col-sm-2">
            <div class="input-group">
                <select class="select2" name="selectStr" id="selectStr"
                        onchange="javascript:queryBtn.click();return false;">
                    <option value="">年份不限</option>
                    <c:forEach items="${classGrade}" var="grade">
                        <option value="${grade.value}"
                                <c:if test="${selectStr==grade.value}">selected</c:if>>${grade.value}</option>
                    </c:forEach>
                </select><span class="input-group-addon">级</span>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="input-group">
                <input type="text" name="queryStr" id="queryStr"
                       class="form-control col-xs-3" size="10" value="${queryStr}"
                       placeholder="班级名/专业关键字"
                       onkeypress="if(event.keyCode==13){queryBtn.click();return false;}"/>
                <span class="input-group-btn">
					<button type="submit" id="queryBtn" class="btn btn-default">找班级</button>
				</span>
            </div>
        </div>
    </div>
</form>