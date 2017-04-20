$(function() {
	$("#message-li").attr("class", "active");
	var classId = $("#classId").val();
	_pageBond("classroom/message.action?classId=" + classId);

	$("#infoBoxText").focus(function() {
		$('#infoBoxEditor').attr("hidden", false);
	});

});

function publishClassMessage() {
	var content = $('#infoBoxText').val();
	if (!isValid(content)) {
		errMsg('infoBoxText', "  说两句吧");
		return;
	}

	if (!isLength(content, 1, 200)) {
		errMsg('infoBoxText', "说的有点多，请 200 字以内");
		return;
	}

	if ($("#asfvbszd_ausivsbkjzcnsaohdknxzoxhjcnc_").val() != $(
			"#dad_asfasdfsa_").val()) {
		errMsg("infoBoxText", "页面错误");
		return;
	}

	$("#classMessagePublishForm").submit();
}