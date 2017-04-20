$(function() {
	$("#directory-li").attr("class", "active");
	var classId = $("#classId").val();
	_pageBond("classroom/directory.action?classId=" + classId);
});