$(function() {
	$("#message-li").attr("class", "active");
	var classId = $("#classId").val();
	_pageBond(getContextPath() + "/classroom/message.action?classId=" + classId);

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

	$("#classMessagePublishForm").submit();
}
