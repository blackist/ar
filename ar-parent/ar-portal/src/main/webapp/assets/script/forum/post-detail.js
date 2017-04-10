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
    // 加载评论列表
    var postId = $("#postId").html();
    $.post("post/commentList.action", {
        "postId" : postId,
        "pageIndex" : pageIndex
    }, function(data) {
        $("#btn-load-more").remove();
        $("#comment-list").append(data);
    });
}

function commentPost() {
    
}
