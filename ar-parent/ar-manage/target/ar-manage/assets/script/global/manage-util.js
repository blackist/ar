/*校验失败提示信息*/
function errMsg(el, msg) {
	$(".error_span").html("");
	$("#" + el).after("<span class='error_span'>" + msg + "</span>");
	$("#" + el).focus();
}

/* 清除校验失败提示信息 */
function errClean() {
	$(".error").html("");
}

/* 使按钮失效 */
function disableBtn(el) {
	$("#" + el).attr("disabled", "disabled");
	$("#" + el).attr("onclick", "");
}

/* 校验参数有效性 */
function isValid(param) {
	if (param != null && param != '') {
		return true;
	}
	return false;
}

/* 长度有效性 */
function isLength(param, min, max) {
	if (isValid(param)) {
		if (param.length >= min && param.length <= max) {
			return true;
		}
	}
	return false;
}

/* 验证数字 */
function isNumber(param) {
	var valid = /^[0-9]*$/;
	if (isValid(param)) {
		if (valid.test(param)) {
			return true;
		}
	}
	return false;
}

/* 全选反选 */
function alls() {
	/* 全选反选 */
	$(".alls").click(function() {
		var isChecked = $(this).prop("checked");
		$("table input[type='checkbox']").prop("checked", isChecked);
	});
}

/* 获取table中选中的记录的id */
function getIds() {
	var ids = "";
	/* 获取table中选中的记录 */
	$("td input:checkbox:checked").each(function(i) {
		ids += $(this).val() + "-";
	});
	if (ids != "") {
		ids = ids.substring(0, ids.length - 1);
	}
	return ids;
}