$(function() {
    $("#info-li").attr("class", "active");

    // 加载评论列表
    var infoId = $("#infoId").val();
    $.post(getContextPath() + "/orgroom/infoCommentList.action?infoId="+infoId, function(data) {
        // 刷新评论列表
        $("#comment-list").html(data);
    });

    // 加载侧边栏
    var authorId = $("#authorId").val();
    var originId = $("#originId").val();
    var originType = $("#originType").val();
    $.post(getContextPath() + "/orgroom/infoSide.action?authorId="+authorId+"&originId="+originId+"&originType="+originType, function (data) {
        $("#orgroom-info-side").html(data);
    });

});

/**
 * TODO 加载更多评论
 * @param pageIndex
 */
function loadMoreComment(pageIndex) {
    // 按钮显示加载
    $("#btn-load-more").html("<img src='assets/images/icon/loading/loader.gif'>");
    // 加载评论列表
    var infoId = $("#infoId").val();
    $.post(getContextPath() + "/orgroom/infoCommentList.action", {
        "infoId" : infoId,
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
function focusCommentInfo() {
    windowToEL("comment-content");
}

/**
 * 发表评论校验
 */
function commentInfo() {
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
    windowToEL("comment-content");
}

/**
 * 喜欢帖子
 * @param postId
 */
function loveInfo(infoId) {

    $.ajax({
        type : "GET",
        url : getContextPath() + "/orgroom/loveInfo.action",
        data : "infoId=" + infoId,
        dataType : "text",
        success : function(data){
            $("#info-love-add").attr("onclick" , null);
            $(".info-loves").html(data);
        }
    });
}

/**
 * TODO 删除用户帖子
 * @param postId
 */
function deleteInfo(infoId) {
    if (confirm("删除后无法恢复，确定删除这条帖子吗？")){
        var originId = $("#originId").val();
        // 删除帖子
        location.href = getContextPath() + "/orgroom/deleteInfo.action?infoId="+infoId+"&originId="+originId;
    }
}

/**
 * TODO 删除用户评论
 * @param commentId
 */
function deleteComment(commentId) {
    if (confirm("确定删除这条评论吗？")){
        $.post(getContextPath() + "/orgroom/deleteComment.action?commentId="+commentId, function (data) {
            // 页面移除评论内容
            $("#comment-li-"+commentId).remove();
            window.location.reload();
        });
    }
}
