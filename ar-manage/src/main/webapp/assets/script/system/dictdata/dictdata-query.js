$(function () {
    /* 翻页页码绑定查询器 必须绑定，否则页码无效 */
    _pageBond(queryDictData);
});
/* 条件查询 */

/* 查询函数可以有多个参数，pageIndex要是第一个 */
function queryDictData(pageIndex, pageSize) {
    /* loading进度条 */
    $.AMUI.progress.start();
    var queryInput = $("#queryInput").val();
    $.post(getContextPath() + "/dictData/queryDictData.action", {
        "pageIndex": pageIndex,
        "pageSize": pageSize,
        "queryInput": queryInput
    }, function (data) {
        $.AMUI.progress.done();
        $("#admin-content").html(data);
    });
}

/* 添加 */
function addDictData() {
    $.AMUI.progress.start();
    $.post(getContextPath() + "/dictData/addDictData.action", function (data) {
        $.AMUI.progress.done();
        $("#admin-content").html(data);
    });
}

/* 删除 */
function deleteDictData(id) {
    $.AMUI.progress.start();
    $.post(getContextPath() + "/dictData/deleteDictData.action", {
        "id": id
    }, function (data) {
        $.AMUI.progress.done();
        $("#admin-content").html(data);
    });
}

/* 更新 */
function updateDictData(id) {
    $.AMUI.progress.start();
    $.post(getContextPath() + "/dictData/updateDictData.action", {
        "id": id
    }, function (data) {
        $.AMUI.progress.done();
        $("#admin-content").html(data);
    });
}
