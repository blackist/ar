$(function () {
    // system side bar 打开
    $("#origin-manage").attr("class", "am-list am-collapse admin-sidebar-sub am-in");
});

/**
 * TODO 发布信息表单校验
 */
function saveOrigin() {
    if (!isLength($('#originName').val(), 2, 20)) {
        errMsg('originName', '组织名称在2-20字符之间');
    }
    if (!isValid($('#originType').val())) {
        errMsg('originType', '组织类型不为空！');
    }
    else {
        // 新建组织类型为班级时，校验年级
        if ($('#originType').val() == 'C') {
            if (!isValid($('#originGrade').val())) {
                errMsg('originGrade', '年级不能为空');
            }
            else {
                $('#origin-form').submit();
            }
        }
        else {
            $('#origin-form').submit();
        }
    }
}