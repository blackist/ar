$(function () {
    // system side bar 打开
    $("#origin-manage").attr("class", "am-list am-collapse admin-sidebar-sub am-in");

    /* 翻页页码绑定查询器 必须绑定，否则页码无效 */
    _pageBond(queryOrigin);

});

/* 条件查询 *//* 查询函数可以有多个参数，pageIndex要是第一个 */
function queryOrigin(pageIndex, pageSize) {
    /* loading进度条 */
    $.AMUI.progress.start();
    // 参数提取
    var originId = $('#originId').val();
    // 跳转
    post(getContextPath() + '/origin/member.action', {'originId': originId, 'pageIndex': pageIndex, 'pageSize': pageSize});
}

/**
 * TODO 设置班级管理员
 * @param mgrId
 */
function setManager(mgrId) {
    var originId = $('#originId').val();
    if (isValid(originId)) {
        window.location.href=getContextPath() + '/origin/update.action?originId=' + originId + '&mgrId=' + mgrId;
    }
}