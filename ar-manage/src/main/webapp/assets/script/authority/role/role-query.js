$(function() {
	/* 翻页页码绑定查询器 必须绑定，否则页码无效 */
	_pageBond(queryRole);
});
/* 条件查询 *//* 查询函数可以有多个参数，pageIndex要是第一个 */
function queryRole(pageIndex, pageSize) {
	/* loading进度条 */
	$.AMUI.progress.start();
	$.post(getContextPath() + "/role/queryRole.action", {
		"pageIndex" : pageIndex,
		"pageSize" : pageSize
	}, function(data) {
		$.AMUI.progress.done();
		$("#admin-content").html(data);
	});
}

function allot(roleId) {
	$.AMUI.progress.start();
	$.post(getContextPath() + "/role/allot.action", {
		"roleId" : roleId
	}, function(data) {
		$.AMUI.progress.done();
		$("#admin-content").html(data);
	});
}