$(function () {
    // system side bar 打开
    $("#origin-manage").attr("class", "am-list am-collapse admin-sidebar-sub am-in");
});

/**
 * TODO 发布信息表单校验
 */
function saveOrigin() {
    // 新建组织类型为班级时，校验年级
    if ($('#originType').val() == 'C') {
        if (!isValid($('#originGrade').val())) {
            errMsg('originGrade', '年级不能为空');
        }
        else {
            $('#origin-form').submit();
        }
    }
}