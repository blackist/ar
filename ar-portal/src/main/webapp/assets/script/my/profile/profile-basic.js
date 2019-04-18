$(function () {
    $("#my-profile").attr("class", "active");

    $('.form_date').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
        format: 'yyyy-mm-dd'
    });
});

/**
 * 用户信息更新校验
 */
function updateUserInfo() {

    $('#user-info-form').submit();
}
