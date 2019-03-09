<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/views/portal-common/portal-tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${post.infoTitle}-信电校友录</title>
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
                <li><i class="fa fa-home"></i>&nbsp;<a href="${pageContext.request.contextPath}/index.action">主页</a></li>
                <li><a href="${pageContext.request.contextPath}/forum.action">校友论坛</a></li>
                <li class="active">帖子详情</li>
            </ol>
        </div>

        <div class="row blog-content">
            <div class="col-md-9">

                <div class="panel panel-default panel-blog">
                    <div class="panel-body">
                        <h3 class="blogsingle-title">${post.infoTitle}</h3>
                        <ul class="blog-meta">
                            <li>作者: <a href="${pageContext.request.contextPath}/ta/show.action?${post.userId}">${post.trueName}</a></li>
                            <li><fmt:formatDate value="${post.createTime}" pattern="Y-M-d HH:mm"></fmt:formatDate></li>
                            <li><i class="fa fa-eye"></i> 浏览 ${post.views} </li>
                            <li><i class="fa fa-heart"></i> 喜欢 <span class="post-loves">${post.loves}</span></li>
                            <li><i class="glyphicon glyphicon-comment"></i> 评论 ${post.comments}</li>
                        </ul>

                        <br/>
                        <c:if test="${post.thumbImage != null && post.thumbImage != ''}">
                            <div class="blog-img"><img src="${post.thumbImage}" class="img-responsive" alt=""/></div>
                            <div class="mb10"></div>
                        </c:if>

                        <p>${post.content}</p><%-- postId --%>

                    </div><!-- panel-body -->
                    <p hidden id="postId">${post.infoId}</p>
                    <div class="widget-photoday">
                        <ul class="photo-meta">
                            <li><span><i class="fa fa-eye"></i> 浏览 (${post.views})</span></li>
                            <li><a href="javascript:;" onclick="lovePost(${post.infoId})" id="post-love-add">
                                <i class="fa fa-heart"></i> 喜欢 (
                                <arp class="post-loves">${post.loves}</arp>
                                )</a>
                            </li>
                            <li><a href="javascript:;" onclick="focusCommentPost()"><i class="fa fa-comment"></i> 评论
                                (${post.comments})</a></li>
                            <c:if test="${post.userId == SESSION_USER.userId}">
                                <li><a href="javascript:;" onclick="deletePost(${post.infoId})"><i
                                        class="fa fa-trash-o"></i> 删除 </a></li>
                            </c:if>
                        </ul>
                    </div>
                </div><!-- panel -->

                <ol class="breadcrumb">
                    <li class="active"><i class="fa fa-user"></i> 关于作者</li>
                </ol>
                <div class="media">
                    <a class="pull-left" href="${pageContext.request.contextPath}/ta/show.action?userId=${post.userId}">
                        <img class="thumbnail img-responsive center-block" src="${post.portrait}"
                             style="max-width: 65px"/>
                    </a>
                    <div class="media-body event-body">
                        <h4 class="subtitle">${post.trueName}</h4>
                        <p>${post.introduce}</p>
                    </div>
                    <input hidden id="userId" value="${post.userId}">
                </div><!-- media -->

                <%--comment-list 评论列表--%>
                <ol class="breadcrumb">
                    <li class="active"><i class="fa fa-comments-o"></i> 所有评论(${post.comments})</li>
                </ol>
                <ul class="media-list comment-list" id="comment-list">
                    <img class="center-block" src='${pageContext.request.contextPath}/assets/images/icon/loader.gif'>
                </ul><!-- comment-list -->

                <%--登录可评论--%>
                <c:if test="${SESSION_USER != null}">
                    <div class="mb20"></div>
                    <h5 class="subtitle mb5"><i class="fa fa-user"></i> ${SESSION_USER.trueName}：</h5>
                    <div class="mb20"></div>
                    <form method="post" action="${pageContext.request.contextPath}/post/comment.action" id="form-comment">
                        <textarea name="content" maxlength="500" rows="5" class="form-control"
                                  id="comment-content"></textarea>
                        <input hidden name="infoId" value="${post.infoId}">
                        <div class="mb10"></div>
                        <button class="btn btn-primary" onclick="commentPost()" type="button"><i
                                class="fa fa-comment"></i> 发表评论
                        </button>
                    </form>
                </c:if>

            </div><!-- col-sm-10 -->

            <div class="col-md-3" id="outline"></div><!-- col-sm-2 -->

        </div><!-- row -->

    </section>
</div>

<%@ include file="/WEB-INF/views/portal-common/footer.jsp" %>

</body>
<%@ include file="/WEB-INF/views/portal-common/portal-js.jsp" %>
<script src="${pageContext.request.contextPath}/assets/script/forum/post-detail.js"></script>
</html>