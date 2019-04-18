$(function() {
	// system side bar 打开
	$("#job-manage").attr("class",
			"am-list am-collapse admin-sidebar-sub am-in");
	$("#posDesc").html("岗位职责: \n任职资格: \n工作时间: ");
});

/* 校验 */
function createJobSubmit() {
	if (!isLength($("#title").val(), 2, 20)) {
		errMsg("title", "招聘标题在2-20字之间");
	} else if (!isNumber($("#members").val()) || $("#members").val() < 1) {
		errMsg("members", "请正确输入招聘人数");
	} else if (!isValid($("#prof").val())) {
		errMsg("prof", "请选择学历要求");
	} else if (!isValid($("#salary").val())) {
		errMsg("salary", "请选择每月薪资");
	} else if (!isLength($("#posName").val(), 2, 20)) {
		errMsg("posName", "职位名称在2-20字之间");
	} else if (!isLength($("#posDesc").val(), 50, 500)) {
		errMsg("posDesc", "职位描述在50-500字之间");
	} else if (!isLength($("#workPlace").val(), 2, 50)) {
		errMsg("workPlace", "工作地点在2-50字之间");
	} else if (!isLength($("#leaderName").val(), 2, 20)) {
		errMsg("leaderName", "联系人称呼在2-20字之间");
	} else if (!isLength($("#leaderPhone").val(), 8, 30)) {
		errMsg("leaderPhone", "联系方式在8-30字之间");
	} else {
		disableBtn("subBtn");
		$("#jobForm").submit();
	}
}
