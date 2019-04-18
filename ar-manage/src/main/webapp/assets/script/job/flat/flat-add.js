$(function () {
    // system side bar 打开
    $("#job-manage").attr("class", "am-list am-collapse admin-sidebar-sub am-in");
    
    $("#unitName").focus();
});

function createFlatSubmit(btn) {
    /* 表单校验 */
    if (!isValid($("#unitName").val())) {
        errMsg("unitName", "单位名称不能为空");
        return;
    } else if (!isValid($("#industry").val())) {
        errMsg("industry", "单位所属行业不能为空");
        return;
    } else if (!isValid($("#property").val())) {
        errMsg("property", "单位性质不能为空");
        return;
    } else if (!isValid($("#scale").val())) {
        errMsg("scale", "规模不能为空");
        return;
    } else if (!isLength($("#unitDesc").val(), 50, 500)) {
        errMsg("unitDesc", "单位描述在50-500字");
        return;
    } else {
        disableBtn("subBtn");
        $("#flatForm").submit();
    }
}
