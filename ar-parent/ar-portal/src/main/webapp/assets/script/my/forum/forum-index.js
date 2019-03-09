$(function () {
    $("#my-forum").attr("class", "active");

    _pageBond(getContextPath() + "/my/info.action");
});


function deleteMyPost(postId) {
    if (window.confirm('确定删除这条帖子？')) {
        post(getContextPath() + "/my/info/delete.action", {"postId": postId});
    }
}
