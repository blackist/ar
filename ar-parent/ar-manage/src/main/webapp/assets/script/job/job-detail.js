$(function() {
	// system side bar 打开
	$("#job-manage").attr("class",
			"am-list am-collapse admin-sidebar-sub am-in");
});

/* 置顶操作 */
function setTopJob(recruitId) {
	$.AMUI.progress.start();
	$.post(getContextPath() + "/job/setTopJob.action", {
		"recruitId" : recruitId
	}, function(data) {
		$.AMUI.progress.done();
		$("#admin-content").html(data);
	});
}

/* 取消置顶操作 */
function cancelTopJob(recruitId) {
	$.AMUI.progress.start();
	$.post(getContextPath() + "/job/cancelTopJob.action", {
		"recruitId" : recruitId
	}, function(data) {
		$.AMUI.progress.done();
		$("#admin-content").html(data);
	});
}

/* 审核操作 */
function auditJob(recruitId) {
	$.AMUI.progress.start();
	$.post(getContextPath() + "/job/auditJob.action", {
		"recruitId" : recruitId
	}, function(data) {
		$.AMUI.progress.done();
		$("#admin-content").html(data);
	});
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
		$.post(getContextPath() + "/job/removeJob.action", {
			"recruitId" : recruitId
		}, function(data) {
			$.AMUI.progress.done();
			$("#admin-content").html(data);
		});
	}
}

/* 彻底删除 */
function deleteJob(recruitId) {
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
