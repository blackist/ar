$(function() {

	$("#unitName").focus();
});

function addUnitSubmit() {
	errClean();
	/* 表单校验 */
	if (!isValid($("#unitName").val())) {
		errMsg("unitName", "公司名称不能为空");
		return;
	} else if (!isValid($("#industry").val())) {
		errMsg("industry", "公司所属行业不能为空");
		return;
	} else if (!isValid($("#property").val())) {
		errMsg("property", "公司性质不能为空");
		return;
	} else if (!isValid($("#scale").val())) {
		errMsg("scale", "公司规模不能为空");
		return;
	} else if (!isLength($("#unitDesc").val(), 50, 500)) {
		errMsg("unitDesc", "公司描述在50-500字");
		return;
	} else {
		//var unitForm = $("#unitForm").serialize();
		// location.href = "unit/addUnitSubmit.action?isRecruiting=1&" +
		// unitForm;
//		$.post("unit/addUnitSubmit.action?isRecruiting=1", unitForm, function(
//				data) {
//			location.html(data);
//		});
		$("#unitForm").submit();
	}

}
