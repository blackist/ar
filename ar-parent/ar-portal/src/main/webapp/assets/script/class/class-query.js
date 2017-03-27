$(function() {
	$("#nav-class").attr("class", "active");
	
	// 载入outline信息
	$.post("class/outlineClass.action", function(data) {
		$("#class-outline").html(data);
	});

	// 分页器
	_pageBond("class/queryClasses.action");
});