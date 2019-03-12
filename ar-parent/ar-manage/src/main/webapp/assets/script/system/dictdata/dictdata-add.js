$(function() {

});
/* 校验 */
function validDictDataAdd() {
	var vs = /^([a-zA-Z0-9]+)$/;
	var dictdataValue = $("#dictdataValue").val();
	var dictValue = $("#dictValue").val();
	/* 字典校验 */
	if (dictValue == null || dictValue == "") {
		$("#dictValue_span").html("必选");
		return false;
	}
	$("#dictValue_span").html("");
	/* 字典数据校验 */
	if (dictdataValue == "" || dictdataValue == null) {
		$("#dictdataValue_span").html("不能为空");
	} else if (dictdataValue.lentgh > 20) {
		$("#dictdataValue_span").html("长度不超过20");
	} else if (!vs.test(dictdataValue)) {
		$("#dictdataValue_span").html("必须为英文字符串/数字");
	} else {
		return true;
	}
	return false;
}
/* 提交 */
function addDictDataSubmit() {
	if (validDictDataAdd()) {
		$.AMUI.progress.start();
		/* 提交后台 */
		var dictForm = $("#dictdataForm").serialize();
		$.post(getContextPath() + "/dictData/addDictDataSubmit.action", dictForm, function(data) {
			$.AMUI.progress.done();
			$("#admin-content").html(data);
		});
	}
}
