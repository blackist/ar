$(function() {
	$("#nav-recruit").attr("class", "active grid");

	// 分页器绑定
	_pageBond(getContextPath() + "/recruit.action");
});
