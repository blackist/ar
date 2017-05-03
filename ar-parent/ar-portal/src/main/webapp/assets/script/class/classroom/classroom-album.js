$(function() {
	$("#album-li").attr("class", "active");
	var classId = $("#classId").val();
	_pageBond("classroom/album.action?classId=" + classId);
});