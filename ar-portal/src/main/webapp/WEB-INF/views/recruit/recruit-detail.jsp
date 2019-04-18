<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/views/portal-common/portal-tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>职业招聘-信电校友录</title>
    <%@ include file="/WEB-INF/views/portal-common/portal-meta.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/portal-common/header.jsp" %>

<%@ include file="/WEB-INF/views/portal-common/navmenu.jsp" %>


<div class="banner-bottom">
    <div class="container higher" id="container">
        <section>
            <!-- 导航栏 -->
            <div class="header">
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i>&nbsp;<a href="index.action">主页</a></li>
                    <li><a href="${pageContext.request.contextPath}/recruit.action">职业招聘</a></li>
                    <li class="active">招聘详情</li>
                </ol>
            </div>

            <%@ include file="/WEB-INF/views/recruit/recruit-button.jsp" %>

            <div class="panel">
                <div class="panel-heading">
                    <div class="panel-title">${recruit.title}</div>
                    <br>
                    <h5 class="bug-key-title">
                        更新时间:
                        <fmt:formatDate value="${recruit.stateTime}" pattern="M月d日"></fmt:formatDate>
                        &nbsp;&nbsp;&nbsp;&nbsp;${recruit.resumes}人投递
                    </h5>
                </div>
                <!-- panel-heading-->
                <div class="panel-body">

                    <div class="row">
                        <div class="col-sm-12">
                            <h3 class="subtitle subtitle-lined">公司</h3>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <h4>${recruit.unitName }</h4>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-3">
                                            行业:
                                            <ar:dictdata dictdata="${recruit.industry}" dict="ind"/>
                                        </div>
                                        <div class="col-xs-3">
                                            性质:
                                            <ar:dictdata dictdata="${recruit.property}" dict="pro"/>
                                        </div>
                                        <div class="col-xs-3">
                                            规模:
                                            <ar:dictdata dictdata="${recruit.scale}" dict="sca"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 公司 -->

                            <br/>

                            <h5 class="subtitle subtitle-lined">职位</h5>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="row">
                                        <div class="col-xs-1">薪资待遇:</div>
                                        <div class="col-xs-4">
                                            <ar:dictdata dictdata="${recruit.salary}" dict="sl"/>
                                        </div>
                                        <div class="col-xs-1">招聘人数:</div>
                                        <div class="col-xs-4">${recruit.members}</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-1">招聘职位:</div>
                                        <div class="col-xs-4">${recruit.posName}</div>
                                        <div class="col-xs-1">学历要求:</div>
                                        <div class="col-xs-4">
                                            <ar:dictdata dictdata="${recruit.prof}" dict="prof"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-1">福利待遇:</div>
                                        <div class="col-xs-9">
                                            <c:forEach items="${benefits}" var="benefit">
                                                <ar:dictdata dictdata="${benefit}" dict="be"/>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-1">工作地址:</div>
                                        <div class="col-xs-9">${recruit.workPlace}</div>
                                    </div>
                                </div>
                            </div>
                            <!-- 职位 -->

                            <br/>

                            <h3 class="subtitle subtitle-lined">联系</h3>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="row">
                                        <div class="col-xs-3">联系人:${recruit.leaderName }</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-3">联系方式:${recruit.leaderPhone }</div>
                                    </div>
                                </div>
                            </div>

                            <br>
                            <div class="btn-group mr10">
                                <ar:exist value="${SESSION_USER.userId}" items="${postIds}">
                                    <button class='btn btn-primary'>
                                        <i class='fa fa-check mr5'></i>已经申请
                                    </button>
                                </ar:exist>
                                <ar:notexist value="${SESSION_USER.userId}" items="${postIds}">
                                    <button class="btn btn-primary" type="button" id="postBtn"
                                            data-toggle="modal" data-target="#resume-selector"
                                            id="postBtn">
                                        <i class="fa fa-user mr5"></i> 申请职位
                                    </button>
                                </ar:notexist>
                            </div>

                            <div class="modal fade" id="resume-selector" tabindex="-1"
                                 role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"
                                                    aria-hidden="true">&times;
                                            </button>
                                            <h4 class="modal-title" id="myModalLabel">简历投递</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form class="form" method="post" id="postForm"
                                                  action="${pageContext.request.contextPath}/my/resume/postResume.action">
                                                <div class="row">
                                                    <div class="form-group">
                                                        <label class="col-sm-2"><span class="asterisk">*
															</span>选择简历</label>
                                                        <div class="col-sm-10">
                                                            <select class="select2" name="resumeId" id="resumeId">
                                                                <option value="">--</option>
                                                                <c:forEach items="${resumeList}" var="resume">
                                                                    <option value="${resume.resumeId}">${resume.resumeTitle}</option>
                                                                </c:forEach>
                                                            </select><br/> <br/>
                                                            <a href="${pageContext.request.contextPath}/my/resume/addResume.action"
                                                               class="btn btn-default btn-block" type="button">
                                                                <span class="fa fa-plus-square-o">&nbsp;</span>创建简历
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <input type="hidden" name="recruitId"
                                                       value="${recruit.recruitId}">
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default"
                                                    data-dismiss="modal">取消申请
                                            </button>
                                            <button type="button" class="btn btn-primary"
                                                    onclick="postResume('${recruit.recruitId}')"
                                                    id="surePostostBtn">确认申请
                                            </button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->

                            <div class="mb40"></div>
                            <ul class="nav nav-tabs nav-dark">
                                <li class="active"><a data-toggle="tab"
                                                      href="#position-desc"><strong>职位描述</strong></a></li>
                                <li><a data-toggle="tab" href="#uint-desc"><strong>公司介绍</strong></a></li>
                                <li><a data-toggle="tab" href="#apply-record"><strong>申请记录</strong></a></li>
                                <li><a data-toggle="tab" href="#other-jobs"><strong>其它职位</strong></a></li>
                            </ul>
                            <div class="tab-content">

                                <!-- 职位描述 -->
                                <div id="position-desc" class="tab-pane active">
										<textarea
                                                style="max-height: 1000px; min-height: 300px; width: 100%; overflow-y: visible; resize: none;"
                                                disabled="disabled">${recruit.posDesc}</textarea>
                                </div>
                                <!-- !职位描述 -->

                                <!-- 公司介绍 -->
                                <div id="uint-desc" class="tab-pane">
										<textarea
                                                style="max-height: 800px; min-height: 300px; width: 100%; overflow-y: visible; resize: none;"
                                                disabled="disabled">${recruit.unitDesc}</textarea>
                                </div>
                                <!-- !公司介绍 -->

                                <!-- 申请记录 -->
                                <div id="apply-record" class="tab-pane">
                                    <ul class="media-list comment-list">
                                        <c:forEach items="${postRecords}" var="record">
                                            <li class="media"><a href="${pageContext.request.contextPath}/ta/show.action?userId=${record.userId}"
                                                                 class="pull-left">
                                                <img src="${record.portrait}" class="media-object">
                                            </a>
                                                <div class="media-body">
                                                    <h4>${record.trueName}</h4>
                                                    <small class="text-muted">
                                                        申请于:<fmt:formatDate value="${record.createTime}"
                                                                            pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                                                    </small>
                                                    <p></p>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                                <!-- !申请记录 -->

                                <!-- 其它职位 -->
                                <div id="other-jobs" class="tab-pane">
                                    <div class="about-list">
                                        <ul>
                                            <c:forEach items="${otherRecruits}" var="otherRecruit">
                                                <li><a
                                                        href="${pageContext.request.contextPath}/recruit/detailRecruit.action?recruitId=${otherRecruit.recruitId}">${otherRecruit.title}</a>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <!-- tab-pane -->

                            </div>
                            <!-- 相关介绍 -->
                        </div>
                    </div>
                    <!-- row -->
                </div>
                <!-- panel-body -->
            </div>
            <!-- panel -->

        </section>
    </div>
</div>

<%@ include file="/WEB-INF/views/portal-common/footer.jsp" %>

</body>
<%@ include file="/WEB-INF/views/portal-common/portal-js.jsp" %>
<script src="${pageContext.request.contextPath}/assets/script/recruit/recruit-detail.js"></script>

</html>