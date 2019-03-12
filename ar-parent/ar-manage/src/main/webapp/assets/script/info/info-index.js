$(function () {

    // system side bar 打开
    // $("#info-manage").attr("class", "am-list am-collapse admin-sidebar-sub am-in");

    // content 默认加载列表界面
    /* loading进度条 */
    $.AMUI.progress.start();
    $.post(getContextPath() + "/info/queryInfo.action", function (data) {
        $.AMUI.progress.done();
        $("#admin-content").html(data);
    });
});