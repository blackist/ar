$(function() {
	$("#message-li").attr("class", "active");
	var originId = $("#originId").val();
	_pageBond(getContextPath() + "/orgroom/message.action?originId=" + originId);

	$("#infoBoxText").focus(function() {
		$('#infoBoxEditor').attr("hidden", false);
	});

});

/**
 * TODO 留言提交校验
 */
function publishMessage() {
	var content = $('#infoBoxText').val();
	if (!isValid(content)) {
		errMsg('infoBoxText', "  说两句吧");
		return;
	}

	if (!isLength(content, 1, 200)) {
		errMsg('infoBoxText', "说的有点多，请 200 字以内");
		return;
	}

	$("#orgroomMessageForm").submit();
}
