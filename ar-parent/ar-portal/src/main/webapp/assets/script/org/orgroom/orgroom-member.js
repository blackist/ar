$(function() {
	$("#member-li").attr("class", "active");
	var originId = $("#originId").val();
	_pageBond("orgroom/member.action?originId=" + originId);
});