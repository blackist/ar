$(function() {
	// system side bar 打开
	$("#class-manage").attr("class",
			"am-list am-collapse admin-sidebar-sub am-in");

	$.AMUI.progress.start();
	$.post(getContextPath() + "/cm/queryClass.action", {
		"pageIndex" : "1"
	}, function(data) {
		$.AMUI.progress.done();
		$("#admin-content").html(data);
	});

});