$(function () {
    // right side bar 打开
    $("#right-manage").attr("class", "am-list am-collapse admin-sidebar-sub am-in");
});

function allotSubmit() {
    if (window.confirm("您，确定分配权限？")) {

        var rightIds = $("#role_list_to option").map(function () {
            return $(this).val();
        }).get().join("-");

        var roleId = $('#roleId').val();

        $.AMUI.progress.start();
        $.post(getContextPath() + '/role/allotSubmit.action', {
            "rightIds": rightIds,
            "roleId": roleId
        }, function (data) {
            $.AMUI.progress.done();
            $("#admin-content").html(data);
        });
    }
}