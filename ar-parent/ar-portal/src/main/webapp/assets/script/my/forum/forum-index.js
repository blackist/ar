$(function () {
    $("#my-forum").attr("class", "active");

    _pageBond('my/info.action');
});


function deleteMyPost(postId) {
    if (window.confirm('确定删除这条帖子？')) {
        post('my/info/delete.action', {"postId": postId});
    }
}
