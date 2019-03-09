$(function() {
	$("#album-li").attr("class", "active");

	var originId = $("#originId").val();
	_pageBond(getContextPath() + "/orgroom/album/image.action?originId=" + originId);
});