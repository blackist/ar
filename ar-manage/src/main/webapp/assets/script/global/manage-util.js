/*校验失败提示信息*/
function errMsg(el, msg) {
	$(".error_span").html("");
	$("#" + el).after("<span class='error_span'>" + msg + "</span>");
	$("#" + el).focus();
    setTimeout(function() {
        $(".error_span").fadeOut(2000);
    }, 2300);
}

/* 清除校验失败提示信息 */
function errClean() {
	$(".error").html("");
}

/**
 * 获取 contextPath
 * @returns {string}
 */
function getContextPath() {
    var pathName = document.location.pathname;
    var index = pathName.substr(1).indexOf("/");
    var result = pathName.substr(0, index + 1);
    return result;
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


/**
 * TODO 利用js进行POST方式提交
 * @param URL
 * @param PARAMS
 */
function post(URL, PARAMS) {
    var temp = document.createElement("form");
    temp.action = URL;
    temp.method = "post";
    temp.style.display = "none";
    for (var x in PARAMS) {
        var opt = document.createElement("input");
        opt.name = x;
        opt.value = PARAMS[x];
        temp.appendChild(opt);
    }
    document.body.appendChild(temp);
    temp.submit();
    return;
}

