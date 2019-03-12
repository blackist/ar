$(function () {

    // system side bar 打开
    $("#origin-manage").attr("class", "am-list am-collapse admin-sidebar-sub am-in");

    // content 默认加载列表界面
    $.AMUI.progress.start();
    $.post(getContextPath() + "/origin/queryOrigin.action", function (data) {
        $.AMUI.progress.done();
        $("#admin-content").html(data);
    });
});