<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/views/portal-common/portal-tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>${classroom.classGrade}级${classroom.className}-信电校友录</title>
<%@ include file="/WEB-INF/views/portal-common/portal-meta.jsp"%>
</head>
<body>

	<%@ include file="/WEB-INF/views/portal-common/header.jsp"%>

	<div class="container higher" id="container">
		<%@ include
			file="/WEB-INF/views/class/classroom/classroom-pageheader.jsp"%>
		<div class="mb5"></div>
		<!-- nav tab -->
		<%@ include file="/WEB-INF/views/class/classroom/classroom-nav.jsp"%>

		<!-- Tab panes -->
		<div class="tab-content" style="background-color: #ddd;">
			<div class="tab-pane active" id="classroom-content">
				<div class="row blog-content">
					<div class="col-sm-9">
						<div class="panel panel-default panel-blog">
							<div class="panel-body">
								<ul class="pull-left blog-meta">
									<li>By:<a href="ta.show.action?userId=${info.userId}">${info.userName}</a></li>
									<li><fmt:formatDate value="${info.createTime}"
											pattern="yyyy-MM-dd H:mm" /></li>
									<li>评论(${info.comments})</li>
								</ul>
								<c:if test="${info.infoImg!=null&&info.infoImg!=''}">
									<br />
									<div class="blog-img">
										<img src="${info.infoImg}" class="img-responsive" alt="" />
									</div>
								</c:if>
								<br>
								<div class="mb20"></div>
								${info.content} <br>
								<div class="pull-right">
									<a class="tooltips" title="" href="javascript:;"> <i
										class="glyphicon glyphicon-heart"></i>&nbsp;感兴趣
									</a> &nbsp;<a title="" href="javascript:;" onclick="comment()">
										<i class="glyphicon glyphicon-comment"></i>&nbsp;评论
									</a> &nbsp;<a class="tooltips" title="" href="javascript:;"> <i
										class="glyphicon glyphicon-share"></i>&nbsp;分享
									</a>
								</div>
							</div>
							<!-- panel-body -->
						</div>
						<!-- panel -->

						<div class="authorpanel">
							<div class="media">
								<a class="pull-left" href="ta/show.action?userId=${info.userId}">
									<img class="media-object thumbnail" src="${info.userHead}"
									alt="" />
								</a>
								<div class="media-body event-body">
									<h4 class="subtitle">${info.userName}</h4>
									<p>${info.userIntroduce}</p>
									<br>
									<button class="btn btn-primary mr5">
										<i class="fa fa-user"></i> 关 注 &nbsp;&nbsp;
									</button>
									<button class="btn btn-white" onclick=";">
										<i class="fa fa-envelope-o"></i> 私 信 &nbsp;&nbsp;
									</button>
								</div>
							</div>
							<!-- media -->
						</div>
						<!-- authorpanel -->

						<div class="mb20"></div>
						<h5 class="subtitle">评论(${info.comments})</h5>
						<div class="mb30"></div>
						<ul class="media-list comment-list">
							<c:forEach items="${comments}" var="comment" varStatus="status">
								<li class="media"><a class="pull-left"
									href="ta/show.action?userId=${comment.userId}"> <img
										class="media-object thumbnail" src="${comment.imgPath}" alt="" />
								</a>
									<div class="media-body">
										<a href="javascript:;"
											onclick="reply('${status.index+1}楼  ${comment.userName}')"
											class="btn btn-primary btn-xs pull-right reply">回复</a> <span
											class="pull-right">${status.index+1}楼&nbsp;&nbsp;&nbsp;&nbsp;</span>
										<h4>${comment.userName}</h4>
										<small class="text-muted"><fmt:formatDate
												value="${comment.createTime}" pattern="yyyy-M-d HH:mm" /> </small>
										<p>${comment.content}</p>
									</div> <!-- media-body --></li>
								<!-- media -->
							</c:forEach>
						</ul>
						<!-- comment-list -->

						<div class="mb30"></div>
						<h5 class="subtitle mb5">发表评论</h5>
						<div class="mb20"></div>
						<form id="commentForm" class="tab-pane">
							<textarea placeholder="评论一下吧，200以内哦" rows="3"
								class="form-control" id="commentContent" maxlength="200"></textarea>
							<div class="mb10"></div>
							<button class="btn btn-primary" type="button"
								onclick="addComment(${info.infoId})">发表评论</button>
						</form>

					</div>
					<!-- col-sm-8 -->

					<div class="col-sm-3">
						<div class="blog-sidebar">

							<h5 class="subtitle">班级动态</h5>
							<p>班级动态是了解班级同学近况的窗口</p>

							<div class="mb30"></div>

							<h5 class="subtitle">班级相关动态：</h5>
							<c:choose>
								<c:when
									test="${classOtherInfo!=null && fn:length(classOtherInfo)>1}">
									<ul class="sidebar-list">
										<c:forEach items="${classOtherInfo}" var="classInfo">
											<c:if test="${classInfo.infoId!=info.infoId}">
												<li><a
													href="classroom/infoDetail.action?classId=${classroom.classId}&infoId=${classInfo.infoId}"><i
														class="fa fa-angle-right"></i> <ar:sub length="15"
															value="${classInfo.infoTitle}" /> </a></li>
											</c:if>
										</c:forEach>
									</ul>
								</c:when>
								<c:otherwise>
								没有更多！
								</c:otherwise>
							</c:choose>

							<div class="mb30"></div>

							<h5 class="subtitle">董亮亮的动态：</h5>
							<c:choose>
								<c:when
									test="${classMateOtherInfo!=null && fn:length(classMateOtherInfo)>1}">
									<ul class="sidebar-list">
										<c:forEach items="${classMateOtherInfo}" var="mateInfo">
											<c:if test="${mateInfo.infoId!=info.infoId}">
												<li><a
													href="classroom/infoDetail.action?classId=${classroom.classId}&infoId=${mateInfo.infoId}"><i
														class="fa fa-angle-right"></i> <ar:sub length="15"
															value="${mateInfo.infoTitle}" /> </a></li>
											</c:if>
										</c:forEach>
									</ul>
								</c:when>
								<c:otherwise>
								没有更多！
								</c:otherwise>
							</c:choose>

						</div>
						<!-- blog-sidebar -->

					</div>
					<!-- col-sm-4 -->

				</div>
				<!-- row -->
			</div>
		</div>
		<!-- Tab panes -->

	</div>
	<!-- container -->

	<%@ include file="/WEB-INF/views/portal-common/footer.jsp"%>

</body>
<%@ include file="/WEB-INF/views/portal-common/portal-js.jsp"%>
<script src="assets/script/class/classroom/classroom-info-detail.js"></script>
<script type="text/javascript">
function addComment(infoId) {
	var content = $('#commentContent').val();
	if(isValid(content)){
		if(content.length<=200){
			$.ajax({
				type : 'POST',
				url : 'classroom/classInfoComment.action',
				data : "content=" + content + "&infoId=" + infoId,
				success : function(data) {
					$('#commentContent').val("");
					window.location.reload();
				},
				error :function() {
					alert("评论失败");
				},
				dataType: "json"
			});
		}else{
			errMsg('commentContent', "不超过200字");
		}
	}
}

									
									</script>


</html>