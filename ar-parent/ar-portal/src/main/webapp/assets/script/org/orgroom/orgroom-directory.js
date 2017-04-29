$(function() {
	$("#directory-li").attr("class", "active");
	var originId = $("#originId").val();
	_pageBond("orgroom/directory.action?originId=" + originId);
});