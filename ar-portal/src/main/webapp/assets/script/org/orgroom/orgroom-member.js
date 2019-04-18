$(function() {
	$("#member-li").attr("class", "active");
	var originId = $("#originId").val();
	_pageBond(getContextPath() + "/orgroom/member.action?originId=" + originId);
});