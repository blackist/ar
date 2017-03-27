$(function() {
	$("#member-li").attr("class", "active");
	var classId = $("#classId").val();
	_pageBond("classroom/member.action?classId=" + classId);
});