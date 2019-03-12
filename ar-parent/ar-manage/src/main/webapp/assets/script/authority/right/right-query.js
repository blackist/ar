$(function() {
	/* 翻页页码绑定查询器 必须绑定，否则页码无效 */
	_pageBond(queryRights);
});
/* 条件查询 *//* 查询函数可以有多个参数，pageIndex要是第一个 */
function queryRights(pageIndex,pageSize) {
	/* loading进度条 */
	$.AMUI.progress.start();
	var queryInput = $("#queryInput").val();
	$.post(getContextPath() + "/right/queryRights.action", {
		"pageIndex" : pageIndex,
		"pageSize" : pageSize,
		"queryInput" : queryInput
	}, function(data) {
		$.AMUI.progress.done();
		$("#admin-content").html(data);
	});
}
/* 添加 */
function addRight() {
	$("#admin-content").load("dict/addDict.action");
}
/* 删除 */
function deleteDict(dictValue) {
	$.AMUI.progress.start();
	/* 可用， 禁用，字典不能随意删除 */
	$.post("dict/deleteDict.action", {
		"dictValue" : dictValue
	}, function(data) {
		$.AMUI.progress.done();
		$("#admin-content").html(data);
	});
}
/* 更新 */
function updateRight(rightId) {
	$.AMUI.progress.start();
	$.post(getContextPath() + "/right/updateRight.action", {
		"rightId" : rightId
	}, function(data) {
		$.AMUI.progress.done();
		$("#admin-content").html(data);
	});
}
/* 扫描权限 */
function scanAddRights() {
	$.AMUI.progress.start();
	$.post(getContextPath() + "/right/scanAddRights.action", function(data) {
		$.AMUI.progress.done();
		$("#admin-content").html(data);
	});
}
