<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/views/global/common-taglib.jsp" %>

<div class="am-cf am-padding">
    <div class="am-fl am-cf">
        <strong class="am-text-primary am-text-lg">用户管理</strong> /
        <small>用户列表</small>
    </div>
</div>

<div class="am-g">
    <div class="am-u-md-9 am-cf">
        <div class="am-btn-group am-btn-group-xs">
            <a class="am-btn am-btn-default" href="${pageContext.request.contextPath}/user/add.action">
                <span class="am-icon-plus"></span> 添加用户
            </a>
            <c:if test="${state=='D'}">
                <button class="am-btn am-btn-default" type="button" onclick="auditInfos()">
                    <span class="am-icon-archive"></span> 批量审核
                </button>
            </c:if>
            <c:if test="${state!='X'}">
                <button class="am-btn am-btn-default" type="button"
                        onclick="removeInfos()">
                    <span class="am-icon-trash-o"></span> 批量删除
                </button>
            </c:if>
            <c:if test="${state=='X'}">
                <button class="am-btn am-btn-default" type="button"
                        onclick="recoverInfos()">
                    <i class="am-icon-recycle"></i> 批量恢复
                </button>
                <button class="am-btn am-btn-default" type="button"
                        onclick="deleteInfos()">
                    <span class="am-icon-trash-o"></span> 彻底删除
                </button>
            </c:if>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <%@ include file="/WEB-INF/views/global/page-size.jsp" %>
            &nbsp;&nbsp;状态：
            <select id="state" class="dll-query">
                <option value="" name="state" <c:if test="${state==''}">selected</c:if>>全部</option>
                <option value="A" name="state" <c:if test="${state=='A'}">selected</c:if>>正常</option>
                <option value="E" name="state" <c:if test="${state=='D'}">selected</c:if>>冻结</option>
                <option value="X" name="state" <c:if test="${state=='X'}">selected</c:if>>已删除</option>
            </select>
            &nbsp;&nbsp;&nbsp;&nbsp;分类：
            <select id="isAdmin" class="dll-query">
                <option value="" <c:if test="${isAdmin == ''}">selected</c:if>>全部</option>
                <option value="0" name="isAdmin" <c:if test="${isAdmin=='0'}">selected</c:if>>前台用户</option>
                <option value="1" name="isAdmin" <c:if test="${isAdmin=='1'}">selected</c:if>>管理员</option>
            </select>
        </div>
    </div>
    <div class="am-u-md-3 am-cf">
        <div class="am-fr">
            <div class="am-input-group am-input-group-sm">
                <input type="text" id="query" class="am-form-field"
                       placeholder="用户名" value="${query}"
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
                    <th class="table-check"><input type="checkbox" class="alls"/></th>
                    <th class="table-title">账号</th>
                    <th class="table-type">类型</th>
                    <th class="table-detail">用户名</th>
                    <th class="table-detail">邮箱</th>
                    <th class="table-detail">最近活动</th>
                    <th class="table-detail">状态</th>
                    <th class="table-set">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${page.beanList}" var="user">
                    <tr>
                        <td><input type="checkbox" value="${user.userId}"/></td>
                        <td>
                            <a href="job/detailJob.action?recruitId=${user.userId}" target="blank">
                                    ${user.trueName}
                            </a>
                            <c:if test="${user.isAdmin == 1}">
                                &nbsp;<span class="am-badge am-badge-success">管理员</span>
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${user.isAdmin == 0}">前台用户</c:if>
                            <c:if test="${user.isAdmin == 1}">管理员</c:if>
                        </td>
                        <td>${user.trueName}</td>
                        <td>${user.email}</td>
                        <td><fmt:formatDate value="${user.stateTime}" pattern="YYYY-M-d"></fmt:formatDate></td>
                        <td><ar:dictdata dictdata="${user.state}" dict="state"/></td>
                        <td>
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs">
                                    <c:if test="${user.state == 'A'}">
                                        <button type="button"
                                                onclick="javascript:cancelTopInfo('${user.infoId}')"
                                                class="am-btn am-btn-default am-btn-xs am-text-danger">
                                            <span class="am-icon-pencil-square-o"></span> 删除
                                        </button>
                                        <button type="button"
                                                onclick="javascript:setTopInfo('${info.infoId}')"
                                                class="am-btn am-btn-default am-btn-xs am-text-primary">
                                            <span class="am-icon-pencil-square-o"></span> 冻结
                                        </button>
                                    </c:if>
                                    <c:if test="${user.state != 'A'}">
                                        <button type="button"
                                                onclick="javascript:recoverInfo('${info.infoId}')"
                                                class="am-btn am-btn-default am-btn-xs am-text-danger confirm">
                                            <i class="am-icon-recycle"></i> 恢复
                                        </button>
                                    </c:if>
                                    <c:if test="${user.state == 'X'}">
                                        <button type="button"
                                                onclick="javascript:deleteInfo('${info.infoId}')"
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
            <%@ include file="/WEB-INF/views/global/page-index.jsp" %>
            <!-- 页面操作备注 -->
            <%@ include file="/WEB-INF/views/global/operate-remarks.jsp" %>
        </form>
    </div>
    <!-- 操作说明 -->
    <%@ include file="/WEB-INF/views/global/operate-message.jsp" %>
    <!-- 控制 js -->
    <script src="${pageContext.request.contextPath}/assets/script/user/user-query.js"></script>
</div>