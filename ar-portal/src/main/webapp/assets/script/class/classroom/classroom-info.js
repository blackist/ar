$(function() {
	$("#info-li").attr("class", "active");
	var classId = $("#classId").val();
	_pageBond(getContextPath() + "/classroom/info.action?classId=" + classId);

	$("#infoBoxText").focus(function() {
		$('#infoBoxEditor').attr("hidden", false);
	});

	/* 图片上传div动态变动 */
	$("#picUploadBtn").click(function() {
		$('#picUploadBox').attr("hidden", false);
	});
	$(".fileinput-remove").click(function() {
		$('#picUploadBox').attr("hidden", true);
	});
	$('#uploadInput').change(function() {
		$('.kv-fileinput-upload').remove();
		/* 图片文件限制 */
		if (!validImageType("uploadInput")) {
			errMsg("infoBoxText", "图片类型必须是.gif,jpeg,jpg,png中的一种");
		}
		if (!validFileSize("uploadInput", 5)) {
			errMsg("infoBoxText", "图片不能大于5MB");
			return;
		}
	});
});

function infoPublishValid() {
	var content = $('#infoBoxText').val();
	if (!isValid(content)) {
		errMsg('infoBoxText', "  说两句吧");
		return;
	}
	if (!$("#picUploadBox").attr("hidden")) {
		/* 图片文件限制 */
		if (!validImageType("uploadInput")) {
			errMsg("infoBoxText", "图片类型必须是.gif,jpeg,jpg,png");
			return;
		}
		if (!validFileSize("uploadInput", 5)) {
			errMsg("infoBoxText", "图片不能大于5MB");
			return;
		}
	}

	$("#classInfoPublishForm").submit();
}

function validFileSize(el, MB) {
	if ($('#' + el) != null) {
		if ($('#' + el)[0].files[0].size / (1024 * 1024) < MB) {
			return true;
		}
		return false;
	}
}

function validImageType(el) {
	if ($('#' + el) != null) {
		var file = $('#' + el).val();
		if (/.(gif|GIF|jpg|JPG|jpeg|JPEG|png|PNG)$/.test(file)) {
			return true;
		}
		return false;
	}
}
