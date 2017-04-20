$(function() {
	$("#dropdown-li").attr("class", "active");
	var classId = $("#classId").val();

	$("#description").val($("#pastDesc").val());
	$("#description").focus();

});

function setDescription() {
	var content = $('#description').val();
	if (!isValid(content)) {
		errMsg('description', "稍微介绍一下吧");
		return;
	}

	if (!isLength(content, 1, 200)) {
		errMsg('description', "介绍的有点猛，请 200 字以内");
		return;
	}

	if ($("#asfvbszd_ausivsbkjzcnsaohdknxzoxhjcnc_").val() != $(
			"#dad_asfasdfsa_").val()) {
		errMsg("description", "页面错误");
		return;
	}

	$("#descForm").submit();
}
