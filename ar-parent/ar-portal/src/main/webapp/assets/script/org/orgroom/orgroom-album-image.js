$(function() {
	$("#album-li").attr("class", "active");

	var originId = $("#originId").val();
	_pageBond("orgroom/album/image.action?originId=" + originId);
});