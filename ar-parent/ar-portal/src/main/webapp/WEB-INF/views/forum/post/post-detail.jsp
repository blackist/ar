<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/views/portal-common/portal-tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>${post.infoTitle}-信电校友录</title>
<%@ include file="/WEB-INF/views/portal-common/portal-meta.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/views/portal-common/header.jsp"%>

	<%@ include file="/WEB-INF/views/portal-common/navmenu.jsp"%>


	<div class="container higher" id="container">
		<section>
			<!-- 导航栏 -->
			<div class="header">
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i>&nbsp;<a href="index.action">主页</a></li>
					<li><a href="forum.action">校友论坛</a></li>
					<li class="active">帖子详情</li>
				</ol>
			</div>

			<div class="row blog-content">
				<div class="col-md-9">

					<div class="panel panel-default panel-blog">
						<div class="panel-body">
							<h3 class="blogsingle-title">${post.infoTitle}</h3>
							<ul class="blog-meta">
								<li>作者: <a href="show.action?${post.userId}">${post.trueName}</a></li>
								<li><fmt:formatDate value="${post.createTime}" pattern="Y-M-d HH:mm"></fmt:formatDate></li>
								<li><i class="fa fa-eye"></i> 浏览 ${post.views} </li>
								<li><i class="fa fa-heart"></i> 喜欢 ${post.loves}</li>
								<li><i class="fa fa-comments"></i> 评论 ${post.comments}</li>
							</ul>

							<br />
							<div class="blog-img"><img src="assets/images/photos/blog1.jpg" class="img-responsive" alt="" /></div>
							<div class="mb20"></div>

							<p>${post.content}</p>

						</div><!-- panel-body -->
					</div><!-- panel -->

					<div class="authorpanel">
						<div class="media">
							<a class="pull-left" href="ta/show.action?userId=${post.userId}">
								<img class="thumbnail img-responsive center-block" src="${post.portrait}"  style="max-width: 65px"/>
							</a>
							<div class="media-body event-body">
								<h4 class="subtitle">关于 ${post.trueName}</h4>
								<p>${post.introduce}</p>
							</div>
						</div><!-- media -->
					</div><!-- authorpanel -->

					<div class="mb30"></div>
					<h5 class="subtitle"><i class="fa fa-comments-o"></i> 评论 ${post.comments}</h5>
					<div class="mb30"></div>

					<ul class="media-list comment-list">

						<li class="media">
							<a class="pull-left" href="#">
								<img class="thumbnail img-responsive center-block" src="${SESSION_USER.portrait}"  style="max-width: 65px"/>
							</a>
							<div class="media-body">
								<a href="" class="btn btn-primary btn-xs pull-right reply">Reply</a>
								<h4>Nusja Nawancali</h4>
								<small class="text-muted">January 10, 2014 at 7:30am</small>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
							</div><!-- media-body -->
						</li><!-- media -->

						<li class="media">
							<a class="pull-left" href="#">
								<img class="media-object thumbnail" src="images/photos/user1.png" alt="" />
							</a>
							<div class="media-body">
								<a href="" class="btn btn-primary btn-xs pull-right reply">Reply</a>
								<h4>Nusja Nawancali</h4>
								<small class="text-muted">January 10, 2014 at 7:30am</small>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
							</div>
						</li><!-- media -->

						<li class="media">
							<a class="pull-left" href="#">
								<img class="media-object thumbnail" src="images/photos/user4.png" alt="" />
							</a>
							<div class="media-body">
								<a href="" class="btn btn-primary btn-xs pull-right reply">Reply</a>
								<h4>Weno Carasbong</h4>
								<small class="text-muted">January 10, 2014 at 7:30am</small>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
							</div>
						</li><!-- media -->

					</ul><!-- comment-list -->

					<div class="mb20"></div>
					<h5 class="subtitle mb5">评论一下</h5>
					<div class="mb20"></div>

					<form>
						<textarea placeholder="" rows="5" class="form-control"></textarea>
						<div class="mb10"></div>
						<button class="btn btn-primary"><i class="fa fa-comment"></i> 发表评论</button>
					</form>

				</div><!-- col-sm-10 -->

				<div class="col-md-3">

						<h5 class="subtitle">Text Widget</h5>
						<p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam</p>

						<div class="mb30"></div>
						<h5 class="subtitle">Categories</h5>
						<ul class="sidebar-list">
							<li><a href=""><i class="fa fa-angle-right"></i> Science &amp; Technology</a></li>
							<li><a href=""><i class="fa fa-angle-right"></i> Food &amp; Health</a></li>
							<li><a href=""><i class="fa fa-angle-right"></i> Entertainment</a></li>
							<li><a href=""><i class="fa fa-angle-right"></i> Web Development</a></li>
							<li><a href=""><i class="fa fa-angle-right"></i> Communication</a></li>
							<li><a href=""><i class="fa fa-angle-right"></i> Movies &amp; TV Shows</a></li>
						</ul>

							<div class="mb30"></div>
						<h5 class="subtitle">Archives</h5>
						<ul class="sidebar-list">
							<li><a href=""><i class="fa fa-angle-right"></i> January 2014</a></li>
							<li><a href=""><i class="fa fa-angle-right"></i> December 2013</a></li>
							<li><a href=""><i class="fa fa-angle-right"></i> November 2013</a></li>
							<li><a href=""><i class="fa fa-angle-right"></i> October 2013</a></li>
							<li><a href=""><i class="fa fa-angle-right"></i> September 2013</a></li>
						</ul>


				</div><!-- col-sm-2 -->

			</div><!-- row -->

		</section>
	</div>

	<%@ include file="/WEB-INF/views/portal-common/footer.jsp"%>

</body>
<%@ include file="/WEB-INF/views/portal-common/portal-js.jsp"%>
<script src="assets/script/forum/forum-index.js"></script>
</html>