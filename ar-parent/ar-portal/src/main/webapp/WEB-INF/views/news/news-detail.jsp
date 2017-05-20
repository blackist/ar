<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/views/portal-common/portal-tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>新闻中心-信电校友录</title>
    <%@ include file="/WEB-INF/views/portal-common/portal-meta.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/portal-common/header.jsp" %>
<%@ include file="/WEB-INF/views/portal-common/navmenu.jsp" %>
<div class="container higher" id="container">
    <section>
        <!-- 导航栏 -->
        <div class="header">
            <ol class="breadcrumb">
                <li><i class="fa fa-home"></i>&nbsp;<a href="index.action">主页</a></li>
                <li class="active">新闻中心</li>
            </ol>
        </div>

        <div class="col-md-9">
            <div class="row blog-content">
                <div class="panel panel-default panel-blog">
                    <div class="panel-body">
                        <h3 class="blogsingle-title">${info.infoTitle}</h3>
                        <ul class="blog-meta">
                            <li><fmt:formatDate value="${info.createTime}"
                                                pattern="Y-M-d HH:mm"></fmt:formatDate></li>
                            <li><i class="fa fa-eye"></i> 浏览 ${info.views} </li>
                            <li><i class="fa fa-heart"></i> 喜欢 <span class="post-loves">${info.loves}</span></li>
                            <li><i class="glyphicon glyphicon-comment"></i> 评论 ${info.comments}</li>
                        </ul>
                        <br/>
                        <c:if test="${info.thumbImage != null && info.thumbImage != ''}">
                            <div class="blog-img">
                                <img src="${info.thumbImage}" class="img-responsive"/></div>
                            <div class="mb10"></div>
                        </c:if>
                        <p>${info.content}</p><%-- postId --%>
                    </div><!-- panel-body -->
                    <div class="widget-photoday">
                        <ul class="photo-meta">
                            <li><span><i class="fa fa-eye"></i> 浏览 (${info.views})</span></li>
                            <li><a href="javascript:;" onclick="lovePost(${info.infoId})" id="post-love-add">
                                <i class="fa fa-heart"></i> 喜欢 (
                                <arp class="post-loves">${info.loves}</arp>
                                )</a>
                            </li>
                            <li><a href="javascript:;" onclick="focusCommentPost()"><i class="fa fa-comment"></i> 评论
                                (${info.comments})</a></li>
                        </ul>
                    </div>
                </div><!-- panel -->

                <!--comment-list -->
                <ol class="breadcrumb">
                    <li class="active"><i class="fa fa-comments-o"></i> 所有评论(${info.comments})</li>
                </ol>
                <ul class="media-list comment-list" id="comment-list">
                    <img class="center-block" src='assets/images/icon/loading/loader.gif'>
                </ul><!-- comment-list -->

                <!--登录可评论-->
                <c:if test="${SESSION_USER != null}">
                    <div class="mb20"></div>
                    <h5 class="subtitle mb5"><i class="fa fa-user"></i> ${SESSION_USER.trueName}：</h5>
                    <div class="mb20"></div>
                    <form method="post" action="news/comment.action" id="form-comment">
                            <textarea name="content" maxlength="500" rows="5" class="form-control"
                                      id="comment-content"></textarea>
                        <input hidden name="infoId" id="infoId" value="${info.infoId}">
                        <div class="mb10"></div>
                        <button class="btn btn-primary" onclick="commentPost()" type="button"><i
                                class="fa fa-comment"></i> 发表评论
                        </button>
                    </form>
                </c:if>
            </div><!-- row -->
        </div>
        <!-- col-md-9 -->

        <div class="col-md-3" id="news-detail-outline"></div><!-- col-sm-2 -->

    </section>
</div>

<%@ include file="/WEB-INF/views/portal-common/footer.jsp" %>

</body>
<%@ include file="/WEB-INF/views/portal-common/portal-js.jsp" %>
<script src="assets/script/news/news-detail.js"></script>
</html>