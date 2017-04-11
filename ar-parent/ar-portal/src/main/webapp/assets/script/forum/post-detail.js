$(function() {
	$("#nav-forum").attr("class", "active grid");

    // 加载评论列表
    var postId = $("#postId").html();
    $.post("post/commentList.action?postId="+postId, function(data) {
        $("#comment-list").html(data);
    });
});

/**
 * TODO 加载更多评论
 * @param pageIndex
 */
function loadMoreComment(pageIndex) {
    // 按钮显示加载
    $("#btn-load-more").html("<img src='assets/images/icon/loader.gif'>");
    // 加载评论列表
    var postId = $("#postId").html();
    $.post("post/commentList.action", {
        "postId" : postId,
        "pageIndex" : pageIndex
    }, function(data) {
        $("#btn-load-more").remove();
        // 向 div 中追加元素
        $("#comment-list").append(data);
    });
}

/**
 * 点击评论
 * @param replyUser
 */
function focusCommentPost() {
    $("#comment-content").focus();
    $("html,body").animate({scrollTop:$("#comment-content").offset().top},500);//500是ms,也可以用slow代替
}

/**
 * 发表评论校验
 */
function commentPost() {
    var content = $("#comment-content").val();
    // 评论长度校验
    if(!isLength(content, 1, 500)) {
        errMsg("comment-content", "评论不能为空，且不能超过500字");
    } else{
        // 提交
        $("#form-comment").submit();
    }
}

/**
 * 点击回复，评论框获得焦点
 * @param replyUser
 */
function replyComment(replyUser) {
    $("#comment-content").html(replyUser);
    $("#comment-content").focus();
    $("html,body").animate({scrollTop:$("#comment-content").offset().top},500);//500是ms,也可以用slow代替
}

/**
 * 喜欢帖子
 * @param postId
 */
function lovePost(postId) {

    $.ajax({
        type : "GET",
        url : "post/love.action",
        data : "postId=" + postId,
        dataType : "text",
        success : function(data){
            $("#post-love-add").attr("onclick" , null);
            $(".post-loves").html(data);
        }
    });
}
