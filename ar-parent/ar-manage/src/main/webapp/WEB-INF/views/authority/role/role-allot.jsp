<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/global/common-taglib.jsp" %>

<div class="am-cf am-padding">
    <div class="am-fl am-cf">
        <strong class="am-text-primary am-text-lg">权限管理</strong> /
        <small><a href="${pageContext.request.contextPath}/role.action">角色管理 </a></small>
        /
        <small> 权限分配</small>
    </div>
</div>

<div class="am-tabs">
    <ul class="am-tabs-nav am-nav am-nav-tabs">
        <li class="am-active"><a href="javascript:;">权限分配</a></li>
    </ul>
    <div class="am-tab-panel">
        <form class="am-form" id="allotForm" method="post">
            <div class="am-g am-margin-top-sm">
                <div class="am-u-sm-2 am-text-right">&nbsp;</div>
                <div class="am-u-sm-3 am-u-end">
                    所有权限
                    <hr>
                    <select id="role_list" multiple style="width: 250px; min-height: 300px;">
                        <c:forEach items="${rightList}" var="right">
                            <t:notexist items="${rightIds}" value="${right.rightId}">
                                <option value="${right.rightId}">${right.rightName}</option>
                            </t:notexist>
                        </c:forEach>
                    </select>
                </div>
                <div class="am-u-sm-1 am-u-end">
                    <br> <br> <br> <br> <br>
                    <button type="button" class="am-btn am-btn-default am-radius"
                            onclick="moveOptions('role_list_to','role_list')">
                        <i class="am-icon-arrow-left"></i>
                    </button>
                    <br> <br>
                    <button type="button" class="am-btn am-btn-default am-radius"
                            onclick="moveOptions('role_list','role_list_to')">
                        <i class="am-icon-arrow-right"></i>
                    </button>
                </div>
                <div class="am-u-sm-3 am-u-end">
                    分配的权限：${role.roleName}
                    <hr>
                    <select id="role_list_to" multiple name="allotRights"
                            style="width: 250px; min-height: 300px;">
                        <c:forEach items="${roleRights}" var="roleright">
                            <option value="${roleright.rightId}">${roleright.rightName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <input type="hidden" name="roleId" id="roleId" value="${role.roleId}">
        </form>
    </div>

    <div class="am-margin">
        <button type="button" onclick="allotSubmit()"
                class="am-btn am-btn-primary am-btn-xs">确认分配
        </button>
    </div>
    <%@ include file="/WEB-INF/views/global/operate-remarks.jsp" %>
</div>

<!-- 控制js -->
<%@ include file="/WEB-INF/views/global/common-js.jsp" %>
<script src="${pageContext.request.contextPath}/assets/script/authority/role/role-allot.js"></script>
<script>
    //把一个select 中的项移到另一个select中
    function moveOptions(from, to) {
        var oldname = $("#" + from + "option:selected");
        if (oldname.length == 0) {
            return;
        }
        var valueOb = {};
        $("#" + to).find("option").each(function () {
            valueOb[String($(this).val())] = $(this);
        });

        for (var i = 0; i < oldname.length; i++) {
            if (valueOb[String($(oldname[i]).val())] == undefined) {
                $(oldname[i]).clone().appendTo($("#" + to))
                $(oldname[i]).remove();
            }
        }
    }
</script>



