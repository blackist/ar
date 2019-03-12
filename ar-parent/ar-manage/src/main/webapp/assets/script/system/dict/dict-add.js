$(function() {
	/* 禁能所有超链接的 href */
	// $("a").attr("href", "javascript:void(0)");
	/* 请求JSON格式的字典项 */
	var dicts;
	$.ajax({
		type : 'GET',
		url : getContextPath() + '/dict/getAllDicts.action',
		success : function(data) {
			dicts = eval(data);
		},
		error : function() {
			alert("页面加载错误");
		},
		dataType : "json"
	});

	/* 校验字典值不重复 */
	$("#dictValue").keyup(function() {
		var dictValue = $(this).val();
		$("#dictValue_span").html("");
		jQuery.each(dicts, function(i, dict) {
			if (dictValue == dict.dictValue) {
				$("#dictValue_span").html("已存在");
			}
		});
	});
});
/* 校验 */
function validDictAdd() {
	var vchar = /^([a-zA-Z]+)$/;
	var dictValue = $("#dictValue").val();
	if (dictValue == "" || dictValue == null) {
		$("#dictValue_span").html("不能为空");
	} else if (dictValue.lentgh > 20) {
		$("#dictValue_span").html("长度不超过20");
	} else if (!vchar.test(dictValue)) {
		$("#dictValue_span").html("必须为英文字符串");
	} else {
		return true;
	}
	return false;
}
/* 提交 */
function addDictSubmit() {
	$.AMUI.progress.start();
	if (validDictAdd()) {
		/* 提交后台 */
		var dictForm = $("#dictForm").serialize();
		$.post(getContextPath() + "/dict/addDictSubmit.action", dictForm, function(data) {
			$.AMUI.progress.done();
			$("#admin-content").html(data);
		});
	}
}
