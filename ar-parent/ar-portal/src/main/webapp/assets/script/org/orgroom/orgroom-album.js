$(function() {
	$("#album-li").attr("class", "active");
	var originId = $("#originId").val();
	_pageBond("orgroom/album.action?originId=" + originId);
});