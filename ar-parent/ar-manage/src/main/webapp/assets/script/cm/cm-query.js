$(function() {
	/* 翻页页码绑定查询器 必须绑定，否则页码无效 */
	_pageBond(queryClass);

});

/* 条件查询 *//* 查询函数可以有多个参数，pageIndex要是第一个 */
function queryClass(pageIndex, pageSize) {
	/* loading进度条 */
	var queryStr = $("#queryStr").val();
	var stateStr = $("#stateStr").val();
	var selectStr = $("#selectStr").val();
	$.AMUI.progress.start();
	$.post(getContextPath() + "/cm/queryClass.action", {
		"pageIndex" : pageIndex,
		"pageSize" : pageSize,
		"queryStr" : queryStr,
		"selectStr" : selectStr,
		"stateStr" : stateStr
	}, function(data) {
		$.AMUI.progress.done();
		$("#admin-content").html(data);
	});
}

/* 冻结 */
function excepClass(classId) {
	if (confirm("您，确定冻结这个班级？")) {
		$.AMUI.progress.start();
		$.post("cm/excepClass.action", {
			"classId" : classId
		}, function(data) {
			$.AMUI.progress.done();
			$("#admin-content").html(data);
			// refreshPage();
		});
	}
}

/* 删除 */
function removeClass(classId) {
	if (confirm("您，确定要去除该班级？")) {
		$.AMUI.progress.start();
		$.post("cm/removeClass.action", {
			"classId" : classId
		}, function(data) {
			$.AMUI.progress.done();
			$("#admin-content").html(data);
		});
	}
}

/* 删除 */
function deleteClass(classId) {
	if (confirm("您，确定彻底删除该班级？")) {
		$.AMUI.progress.start();
		$.post("cm/deleteClass.action", {
			"classId" : classId
		}, function(data) {
			$.AMUI.progress.done();
			$("#admin-content").html(data);
		});
	}
}
