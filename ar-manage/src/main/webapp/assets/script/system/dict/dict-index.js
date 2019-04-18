$(function () {

    //system side bar 打开
    $("#system-setting").attr("class", "am-list am-collapse admin-sidebar-sub am-in");

    //content 默认加载列表界面
    loadDictQuery();
});

/*加载列表界面   用于导航栏的点击事件*/
function loadDictQuery() {
    /*loading进度条*/
    $.AMUI.progress.start();
    $.post(getContextPath() + "/dict/queryDicts.action", function (data) {
        $.AMUI.progress.done();
        $("#admin-content").html(data);
    });
}

/*导航栏点击事件，导航至dict-index.jsp(刷新页面)*/
function loadDictIndex() {
    $.AMUI.progress.start();
    location.href = getContextPath() + "/dict/indexDict.action";
}
