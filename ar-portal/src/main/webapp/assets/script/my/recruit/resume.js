/**
 * Created by black on 2017/3/30.
 */
$(function() {
    $("#my-recruit").attr("class", "active");
});


/**
 * 登记简历表单校验
 */
function addResumeSubmit(){
    if (!isLength($("#resumeTitle").val(), 2, 20)) {
        errMsg("resumeTitle", "简历标题在2-20字之间");
    } else if (!isLength($("#profType").val(), 2, 20)) {
        errMsg("profType", "职业类型在2-20字之间");
    } else if (!isValid($("#expSalary").val())) {
        errMsg("expSalary", "请选择期望薪资");
    } else if (!isLength($("#name").val(), 2, 10)) {
        errMsg("name", "姓名在2-10字之间");
    } else if (!isLength($("#domicile").val(), 2, 50)) {
        errMsg("domicile", "居住地不超过50字");
    } else if (!isLength($("#contact").val(), 8, 30)) {
        errMsg("contact", "联系方式必填，且不超过30字");
    } else if (!isLength($("#introduce").val(), 0, 500)) {
        errMsg("introduce", "个人简介不超过500字");
    } else {
        $("#resumeForm").submit();
    }
}

/**
 * 更新简历表单校验
 */
function updateResumeSubmit(){
    if (!isLength($("#resumeTitle").val(), 2, 20)) {
        errMsg("resumeTitle", "简历标题在2-20字之间");
    } else if (!isLength($("#profType").val(), 2, 20)) {
        errMsg("profType", "简历标题在2-20字之间");
    } else if (!isValid($("#expSalary").val())) {
        errMsg("expSalary", "请选择期望薪资");
    } else if (!isLength($("#name").val(), 2, 10)) {
        errMsg("name", "姓名在2-10字之间");
    } else if (!isLength($("#domicile").val(), 2, 50)) {
        errMsg("domicile", "居住地不超过50字");
    } else if (!isLength($("#contact").val(), 8, 30)) {
        errMsg("contact", "联系方式必填，且不超过30字");
    } else if (!isLength($("#introduce").val(), 0, 500)) {
        errMsg("introduce", "个人简介不超过500字");
    } else if (isValid($("#resumeId").val())) {
        $("#resumeForm").submit();
    }
}

function deleteResume(resumeId) {

    if (confirm("确定删除这份简历？")){
        window.location.href=getContextPath() + "/my/resume/delete.action?resumeId="+resumeId;
    }
}


