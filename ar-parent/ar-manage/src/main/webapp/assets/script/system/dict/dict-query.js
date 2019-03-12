$(function () {
    /* 翻页页码绑定查询器 必须绑定，否则页码无效 */
    _pageBond(queryDicts);
});
/* 条件查询 */

/* 查询函数可以有多个参数，pageIndex要是第一个 */
function queryDicts(pageIndex, pageSize) {
    /* loading进度条 */
    $.AMUI.progress.start();
    var queryInput = $("#queryInput").val();
    $.post(getContextPath() + "/dict/queryDicts.action", {
        "pageIndex": pageIndex,
        "pageSize": pageSize,
        "queryInput": queryInput
    }, function (data) {
        $.AMUI.progress.done();
        $("#admin-content").html(data);
    });
}

/* 添加 */
function addDict() {
    $.AMUI.progress.start();
    $.post(getContextPath() + "/dict/addDict.action", function (data) {
        $.AMUI.progress.done();
        $("#admin-content").html(data);
    });
}

/* 删除 */
function deleteDict(dictValue) {
    $.AMUI.progress.start();
    $.post("dict/deleteDict.action", {
        "dictValue": dictValue
    }, function (data) {
        $.AMUI.progress.done();
        $("#admin-content").html(data);
    });
}

/* 更新 */
function updateDict(dictValue) {
    $.AMUI.progress.start();
    $.post("dict/updateDict.action", {
        "dictValue": dictValue
    }, function (data) {
        $.AMUI.progress.done();
        $("#admin-content").html(data);
    });
}
