<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/views/global/common-taglib.jsp" %>

<div class="am-cf am-padding">
    <div class="am-fl am-cf">
        <strong class="am-text-primary am-text-lg">班级 / 校友组织</strong> /
        <small>组织管理</small>
    </div>
</div>

<div class="am-g">
    <div class="am-u-md-9 am-cf">
        <div class="am-btn-group am-btn-group-xs">
            <a class="am-btn am-btn-default" href="${pageContext.request.contextPath}/origin/add.action">
                <span class="am-icon-plus"></span> 创建组织
            </a>
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
                <option value="X" name="state" <c:if test="${state=='X'}">selected</c:if>>已删除</option>
            </select>
            &nbsp;&nbsp;&nbsp;&nbsp;年级：
            <select id="originGrade" class="dll-query">
                <option value="" <c:if test="${originGrade == ''}">selected</c:if>>全部</option>
                <c:forEach items="${grades}" var="grade">
                    <option value="${grade.value}"
                            <c:if test="${originGrade == grade.value}">selected</c:if>>${grade.value}</option>
                </c:forEach>
            </select>
            &nbsp;&nbsp;&nbsp;&nbsp;类型：
            <select id="originType" class="dll-query">
                <option value="" <c:if test="${originType == ''}">selected</c:if>>全部</option>
                <c:forEach items="${types}" var="type">
                    <option value="${type.value}"
                            <c:if test="${originType == type.value}">selected</c:if>>${type.name}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="am-u-md-3 am-cf">
        <div class="am-fr">
            <div class="am-input-group am-input-group-sm">
                <input type="text" id="query" class="am-form-field"
                       placeholder="标题/作者" value="${query}"
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
                    <th class="table-title">名称</th>
                    <th class="table-type">类型</th>
                    <th class="table-detail">成员数</th>
                    <th class="table-detail">管理员</th>
                    <th class="table-detail">近期活动</th>
                    <th class="table-detail">状态</th>
                    <th class="table-set">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${page.beanList}" var="origin">
                    <tr>
                        <td><input type="checkbox" value="${origin.originId}"/></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/origin/home.action?originId=${origin.originId}"
                               target="blank">${origin.originName}</a>
                        </td>
                        <td><ar:dictdata dictdata="${origin.originType}" dict="ot"></ar:dictdata></td>
                        <td>${origin.members}</td>
                        <td><a href="${pageContext.request.contextPath}/user/account.action?userId=${origin.mgrId}">${origin.mgrName}</a></td>
                        <td><fmt:formatDate value="${origin.stateTime}" pattern="YYYY-M-d HH:mm"></fmt:formatDate></td>
                        <td><ar:dictdata dictdata="${origin.state}" dict="state"/></td>
                        <td>
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs">
                                    <c:if test="${info.isTop==1}">
                                        <button type="button"
                                                onclick="javascript:cancelTopInfo('${info.infoId}')"
                                                class="am-btn am-btn-default am-btn-xs am-text-secondary">
                                            <span class="am-icon-pencil-square-o"></span> 取消置顶
                                        </button>
                                    </c:if>
                                    <c:if test="${info.isTop==0 && info.state=='A'}">
                                        <button type="button"
                                                onclick="javascript:setTopInfo('${info.infoId}')"
                                                class="am-btn am-btn-default am-btn-xs am-text-secondary">
                                            <span class="am-icon-pencil-square-o"></span> 置顶
                                        </button>
                                    </c:if>
                                    <c:if test="${info.state=='D'}">
                                        <button type="button"
                                                onclick="javascript:auditInfo('${info.infoId}')"
                                                class="am-btn am-btn-default am-btn-xs am-text-secondary">
                                            <span class="am-icon-archive"></span> 审核
                                        </button>
                                    </c:if>
                                    <c:if test="${info.state!='X'}">
                                        <button type="button"
                                                onclick="javascript:removeInfo('${info.infoId}')"
                                                class="am-btn am-btn-default am-btn-xs am-text-danger confirm">
                                            <span class="am-icon-trash-o"></span> 删除
                                        </button>
                                    </c:if>
                                    <c:if test="${info.state=='X'}">
                                        <button type="button"
                                                onclick="javascript:recoverInfo('${info.infoId}')"
                                                class="am-btn am-btn-default am-btn-xs am-text-danger confirm">
                                            <i class="am-icon-recycle"></i> 恢复
                                        </button>
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
    <script src="${pageContext.request.contextPath}/assets/script/origin/origin-query.js"></script>
</div>