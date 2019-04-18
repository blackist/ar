<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/views/global/common-taglib.jsp" %>
<div class="am-cf am-padding">
    <div class="am-fl am-cf">
        <strong class="am-text-primary am-text-lg">权限管理</strong> /
        <small>角色管理</small>
    </div>
</div>

<div class="am-g">
    <div class="am-u-md-6 am-cf">
        <div class="am-fl am-cf">
            <div class="am-btn-toolbar am-fl">
                <div class="am-form-group am-margin-left am-fl">
                    <%@ include file="/WEB-INF/views/global/page-size.jsp" %>
                </div>
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
                    <th class="table-title">id</th>
                    <th class="table-title">角色名称</th>
                    <th class="table-title">角色值</th>
                    <th class="table-type">状态</th>
                    <th class="table-set">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${page.beanList}" var="role">
                    <c:if test="${role.roleValue!='admin'}">
                        <tr>
                            <td><input type="checkbox"/></td>
                            <td>${role.roleId}</td>
                            <td>${role.roleName}</td>
                            <td>${role.roleValue}</td>
                            <td><u:dictdata dictdata="${role.state}" dict="state"></u:dictdata></td>
                            <td>
                                <div class="am-btn-toolbar">
                                    <div class="am-btn-group am-btn-group-xs">
                                        <button type="button"
                                                onclick="javascript:updateRole('${role.roleId}')"
                                                class="am-btn am-btn-default am-btn-xs am-text-secondary">
                                            <span class="am-icon-pencil-square-o"></span> 编辑
                                        </button>
                                        <button type="button"
                                                onclick="javascript:exceptRole('${role.roleId}')"
                                                class="am-btn am-btn-default am-btn-xs am-text-danger">
                                            <span class="am-icon-sliders"></span> 冻结
                                        </button>
                                        <button type="button" onclick="allot('${role.roleId}')"
                                                class="am-btn am-btn-default am-btn-xs am-text-secondary">
                                            <span class="am-icon-pencil-square-o"></span> 分配权限
                                        </button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
            <!-- 页码 -->
            <%@ include file="/WEB-INF/views/global/page-index.jsp" %>
            <!-- 页面操作备注 -->
            <%@ include file="/WEB-INF/views/global/operate-remarks.jsp" %>
        </form>
    </div>
    <%@ include file="/WEB-INF/views/global/operate-message.jsp" %>
    <!-- 控制 js -->
    <script src="${pageContext.request.contextPath}/assets/script/authority/role/role-query.js"></script>
</div>