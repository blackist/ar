<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/global/common-taglib.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@ include file="/WEB-INF/views/global/base-path.jsp" %>
    <title>招聘单位管理-后台管理</title>
    <%@ include file="/WEB-INF/views/global/manage-meta.jsp" %>
    <%@ include file="/WEB-INF/views/global/common-css.jsp" %>
</head>
<body>
<!-- header -->
<%@ include file="/WEB-INF/views/global/header.jsp" %>

<!-- 主管理区域 admin-main -->
<div class="am-cf admin-main">
    <!-- 侧边栏 side bar start -->
    <div class="admin-sidebar">
        <%@ include file="/WEB-INF/views/global/sidebar.jsp" %>
    </div>
    <!-- side bar end -->

    <!-- 内容区域 content start -->
    <div class="admin-content" id="admin-content">
        <div class="am-cf am-padding">
            <div class="am-fl am-cf">
                <strong class="am-text-primary am-text-lg">职业招聘</strong> /
                <small><a
                        href="${pageContext.request.contextPath}/job.action">招聘单位</a></small>
                /
                <small>添加单位信息</small>
            </div>
        </div>
        <div class="am-tabs am-margin" data-am-tabs>
            <ul class="am-tabs-nav am-nav am-nav-tabs">
                <li class="am-active"><a href="javascript:;">单位信息</a></li>
            </ul>

            <div class="am-tabs-bd">
                <div class="am-tab-panel am-fade am-in am-active" id="flat-tag">
                    <form class="am-form" id="flatForm"
                          action="flat/createFlatSubmit.action" method="post">
                        <div class="am-g am-margin-top">
                            <div class="am-u-sm-2 am-text-right">*单位名称</div>
                            <div class="am-u-sm-4 am-text-left">
                                <input class="am-input-sm" maxlength="20" name="unitName"
                                       id="unitName"
                                       data-am-popover="{content:'2-20字之间',trigger:'hover focus'}"
                                       type="text">
                            </div>
                            <div class="am-u-sm-6 am-text-right"></div>
                        </div>

                        <div class="am-g am-margin-top">
                            <div class="am-u-sm-2 am-text-right">*所属行业</div>
                            <div class="am-u-sm-4 am-text-left">
                                <select data-am-selected="{btnSize: 'sm'}" class="am-input-sm"
                                        id="industry" name="industry" required="required">
                                    <option value="">请选择</option>
                                    <c:forEach items="${unitIndustry}" var="industry">
                                        <option value="${industry.value }">${industry.name }</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="am-u-sm-6 am-text-left"></div>
                        </div>

                        <div class="am-g am-margin-top">
                            <div class="am-u-sm-2 am-text-right">*性质</div>
                            <div class="am-u-sm-4 am-text-left">
                                <select data-am-selected="{btnSize: 'sm'}" class="am-input-sm"
                                        id="property" name="property" required="required">
                                    <option value="">请选择</option>
                                    <c:forEach items="${unitProperty}" var="property">
                                        <option value="${property.value}">${property.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="am-u-sm-6 am-text-left"></div>
                        </div>

                        <div class="am-g am-margin-top">
                            <div class="am-u-sm-2 am-text-right">*规模</div>
                            <div class="am-u-sm-4 am-text-left">
                                <select data-am-selected="{btnSize: 'sm'}" class="am-input-sm"
                                        id="scale" name="scale" required="required">
                                    <option value="">请选择</option>
                                    <c:forEach items="${unitScale}" var="scale">
                                        <option value="${scale.value }">${scale.name }</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="am-u-sm-6 am-text-left"></div>
                        </div>

                        <div class="am-g am-margin-top">
                            <div class="am-u-sm-2 am-text-right">*公司描述</div>
                            <div class="am-u-sm-8">
									<textarea rows="10" maxlength="500"
                                              data-am-popover="{content:'50-500字之间',trigger:'hover focus'}"
                                              id="unitDesc" name="unitDesc">${job.posDesc}</textarea>
                            </div>
                            <div class="am-u-sm-2"></div>
                        </div>

                        <div class="am-g am-margin-top">
                            <div class="am-u-sm-2 am-text-right">公司网址</div>
                            <div class="am-u-sm-4 am-text-left">
                                <input class="am-input-sm" maxlength="30" name="unitWeb"
                                       id="unitWeb"
                                       data-am-popover="{content:'公司网址在30字之内',trigger:'hover focus'}"
                                       type="text">
                            </div>
                            <div class="am-u-sm-6 am-text-left"></div>
                        </div>
                        <input type="hidden" value="1" name="isRecruiting">
                    </form>
                </div>
            </div>
        </div>

        <div class="am-margin">
            <button type="button" class="am-btn am-btn-primary am-btn-xs"
                    onclick="createFlatSubmit()" id="subBtn">保存
            </button>
            <button type="button" class="am-btn am-btn-primary am-btn-xs"
                    onclick="javascript:location.href='job.action';">放弃
            </button>
        </div>
    </div>
    <!-- content end -->
</div>

<!-- footer -->
<%@ include file="/WEB-INF/views/global/footer.jsp" %>
<!-- 控制js -->
<%@ include file="/WEB-INF/views/global/common-js.jsp" %>
<script src="${pageContext.request.contextPath}/assets/script/job/flat/flat-add.js"></script>
</body>
</html>

