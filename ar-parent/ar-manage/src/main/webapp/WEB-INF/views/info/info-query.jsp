<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/views/global/common-taglib.jsp" %>

<div class="am-cf am-padding">
    <div class="am-fl am-cf">
        <strong class="am-text-primary am-text-lg">信息中心</strong> /
        <small>所有信息</small>
    </div>
</div>

<div class="am-g">
    <div class="am-u-md-6 am-cf">
        <div class="am-fl am-cf">
            <div class="am-btn-toolbar am-fl">
                <div class="am-btn-group am-btn-group-xs">
                    <button onclick="javascript:$.AMUI.progress.start();location.href='job/createJob.action';"
                            class="am-btn am-btn-default" type="button">
                        <span class="am-icon-plus"></span> 发布招聘
                    </button>
                    <c:if test="${stateStr=='D'}">
                        <button class="am-btn am-btn-default" type="button" onclick="auditJobs()">
                            <span class="am-icon-archive"></span> 批量审核
                        </button>
                    </c:if>
                    <c:if test="${stateStr!='X'}">
                        <button class="am-btn am-btn-default" type="button"
                                onclick="removeJobs()">
                            <span class="am-icon-trash-o"></span> 批量删除
                        </button>
                    </c:if>
                    <c:if test="${stateStr=='X'}">
                        <button class="am-btn am-btn-default" type="button"
                                onclick="deleteJobs()">
                            <i class="am-icon-recycle"></i> 批量恢复
                        </button>
                        <button class="am-btn am-btn-default" type="button"
                                onclick="deleteJobs()">
                            <span class="am-icon-trash-o"></span> 彻底删除
                        </button>
                    </c:if>
                </div>
                <div class="am-form-group am-margin-left am-fl">
                    <%@ include file="/WEB-INF/views/global/page-size.jsp" %>
                    &nbsp;&nbsp;状态：
                    <select id="state" class="dll-query">
                        <option value="" name="state" <c:if test="${state==''}">selected</c:if>>全部</option>
                        <option value="A" name="state" <c:if test="${state=='A'}">selected</c:if>>正常</option>
                        <option value="D" name="state" <c:if test="${state=='D'}">selected</c:if>>未审核</option>
                        <option value="X" name="state" <c:if test="${state=='X'}">selected</c:if>>已删除</option>
                    </select>
                    &nbsp;&nbsp;&nbsp;&nbsp;信息分类：
                    <select id="infoType" class="dll-query">
                        <option value="" <c:if test="${infoType == ''}">selected</c:if>>全部</option>
                        <c:forEach items="${infoTypes}" var="type">
                            <option value="${type.value}" name="infoType"
                                    <c:if test="${infoType == type.value}">selected</c:if>>${type.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
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
                    <th class="table-title">标题</th>
                    <th class="table-type">招聘单位</th>
                    <th class="table-detail">薪水</th>
                    <th class="table-detail">发布人</th>
                    <th class="table-detail">发布时间</th>
                    <th class="table-detail">状态</th>
                    <th class="table-set">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${page.beanList}" var="job">
                    <tr>
                        <td><input type="checkbox" value="${job.recruitId}"/></td>
                        <td><a
                                href="job/detailJob.action?recruitId=${job.recruitId}"
                                target="blank">${job.title}</a> <c:if test="${job.isTop==1}">&nbsp;<span
                            class="am-badge am-badge-success">置顶</span>
                        </c:if></td>
                        <td>${job.unitName}</td>

                        <td><ar:dictdata dictdata="${job.salary}" dict="sl"/></td>
                        <td>${job.account}</td>
                        <td><fmt:formatDate value="${job.createTime}" pattern="M月d日"></fmt:formatDate></td>
                        <td><ar:dictdata dictdata="${job.state}" dict="state"/></td>
                        <td>
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs">
                                    <c:if test="${job.isTop==1}">
                                        <button type="button"
                                                onclick="javascript:cancelTopJob('${job.recruitId}')"
                                                class="am-btn am-btn-default am-btn-xs am-text-secondary">
                                            <span class="am-icon-pencil-square-o"></span> 取消置顶
                                        </button>
                                    </c:if>
                                    <c:if test="${job.isTop==0 && job.state=='A'}">
                                        <button type="button"
                                                onclick="javascript:setTopJob('${job.recruitId}')"
                                                class="am-btn am-btn-default am-btn-xs am-text-secondary">
                                            <span class="am-icon-pencil-square-o"></span> 置顶
                                        </button>
                                    </c:if>
                                    <c:if test="${job.state=='D'}">
                                        <button type="button"
                                                onclick="javascript:auditJob('${job.recruitId}')"
                                                class="am-btn am-btn-default am-btn-xs am-text-secondary">
                                            <span class="am-icon-archive"></span> 审核
                                        </button>
                                    </c:if>
                                    <c:if test="${job.state!='X'}">
                                        <button type="button"
                                                onclick="javascript:removeJob('${job.recruitId}')"
                                                class="am-btn am-btn-default am-btn-xs am-text-danger confirm">
                                            <span class="am-icon-trash-o"></span> 删除
                                        </button>
                                    </c:if>
                                    <c:if test="${job.state=='X'}">
                                        <button type="button"
                                                onclick="javascript:recoverJob('${job.recruitId}')"
                                                class="am-btn am-btn-default am-btn-xs am-text-danger confirm">
                                            <i class="am-icon-recycle"></i> 恢复
                                        </button>
                                        <button type="button"
                                                onclick="javascript:deleteJob('${job.recruitId}')"
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
    <script src="assets/script/info/info-query.js"></script>
</div>