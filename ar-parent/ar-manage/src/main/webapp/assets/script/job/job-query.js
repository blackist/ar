$(function() {
	/* 翻页页码绑定查询器 必须绑定，否则页码无效 */
	_pageBond(queryJobs);

});

/* 条件查询 *//* 查询函数可以有多个参数，pageIndex要是第一个 */
function queryJobs(pageIndex,pageSize) {
	/* loading进度条 */
	$.AMUI.progress.start();
	var queryStr = $("#queryStr").val();
	var stateStr = $("#stateStr").val();
	$.post(getContextPath() + "/job/queryJobs.action", {
		"pageIndex" : pageIndex,
		"pageSize" : pageSize,
		"queryStr" : queryStr,
		"stateStr" : stateStr
	}, function(data) {
		$.AMUI.progress.done();
		$("#admin-content").html(data);
	});
}

/* 置顶操作 */
function setTopJob(recruitId) {
	$.AMUI.progress.start();
	$.post("job/setTopJob.action", {
		"recruitId" : recruitId
	}, function(data) {
		$.AMUI.progress.done();
		$("#admin-content").html(data);
	});
}

/* 取消置顶操作 */
function cancelTopJob(recruitId) {
	$.AMUI.progress.start();
	$.post("job/cancelTopJob.action", {
		"recruitId" : recruitId
	}, function(data) {
		$.AMUI.progress.done();
		$("#admin-content").html(data);
	});
}

/* 审核操作 */
function auditJob(recruitId) {
	$.AMUI.progress.start();
	$.post("job/auditJob.action", {
		"recruitId" : recruitId
	}, function(data) {
		$.AMUI.progress.done();
		$("#admin-content").html(data);
	});
}

/* 批量审核操作 */
function auditJobs() {
	var recruitIds = getIds();
	if (isValid(recruitIds)) {
		$.AMUI.progress.start();
		$.post("job/auditJobs.action", {
			"recruitIds" : recruitIds
		}, function(data) {
			$.AMUI.progress.done();
			$("#admin-content").html(data);
		});
	}
}

/* 删除 */
function removeJob(recruitId) {
	// var fun = function() {
	// $.AMUI.progress.start();
	// $.post("job/deleteJob.action", {
	// "recruitId" : recruitId
	// }, function(data) {
	// $.AMUI.progress.done();
	// $("#admin-content").html(data);
	// });
	// }
	// operateConfirm(fun, "你，确定要删除这条记录？");
	if (confirm("您，确定删除这条数据？")) {
		$.AMUI.progress.start();
		$.post("job/removeJob.action", {
			"recruitId" : recruitId
		}, function(data) {
			$.AMUI.progress.done();
			$("#admin-content").html(data);
		});
	}
}

/* 删除 */
function removeJobs() {
	var recruitIds = getIds();
	if (isValid(recruitIds)) {
		if (confirm("您，确定删除这些数据？")) {
			$.AMUI.progress.start();
			$.post("job/removeJobs.action", {
				"recruitIds" : recruitIds
			}, function(data) {
				$.AMUI.progress.done();
				$("#admin-content").html(data);
			});
		}
	}
}
/* 彻底删除 */
function deleteJob(recruitId) {
	if (isValid(recruitIds)) {
		if (confirm("您，确定要彻底删除删除？")) {
			$.AMUI.progress.start();
			$.post("job/deleteJob.action", {
				"recruitId" : recruitId
			}, function(data) {
				$.AMUI.progress.done();
				$("#admin-content").html(data);
			});
		}
	}
}

/* 批量删除 */
function deleteJobs() {
	var recruitIds = getIds();
	if (isValid(recruitIds)) {
		if (confirm("您，确定彻底删除这些数据？")) {
			$.AMUI.progress.start();
			$.post("job/deleteJobs.action", {
				"recruitIds" : recruitIds
			}, function(data) {
				$.AMUI.progress.done();
				$("#admin-content").html(data);
			});
		}
	}
}

/* 恢复删除数据 */
function recoverJob(recruitId) {
	if (confirm("您，确定恢复到未审核状态？")) {
		$.AMUI.progress.start();
		$.post("job/recoverJob.action", {
			"recruitId" : recruitId
		}, function(data) {
			$.AMUI.progress.done();
			$("#admin-content").html(data);
		});
	}
}

/* 恢复删除数据 */
function recoverJobs() {
	var recruitIds = getIds();
	if (isValid(recruitIds)) {
		if (confirm("您，确定恢复到未审核状态？")) {
			$.AMUI.progress.start();
			$.post("job/recoverJobs.action", {
				"recruitIds" : recruitIds
			}, function(data) {
				$.AMUI.progress.done();
				$("#admin-content").html(data);
			});
		}
	}
}