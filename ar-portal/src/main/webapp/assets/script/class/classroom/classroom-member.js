$(function() {
	$("#member-li").attr("class", "active");
	var classId = $("#classId").val();
	_pageBond(getContextPath() + "/classroom/member.action?classId=" + classId);
});