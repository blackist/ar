$(function() {
	// system side bar 打开
	$("#job-manage").attr("class", "am-list am-collapse admin-sidebar-sub am-in");
});

function createJob() {
	var unitId = $("#unitId").val();
	if (!isValid(unitId)) {
		errMsg("unitId", "招聘单位必选");
		return;
	} else {
		$("#unitIdForm").submit();
	}
}