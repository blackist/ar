$(function() {
	$("#directory-li").attr("class", "active");
	var originId = $("#originId").val();
	_pageBond(getContextPath() + "/orgroom/directory.action?originId=" + originId);
});