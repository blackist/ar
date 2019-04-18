$(function() {
	// right side bar 打开
	$("#right-manage").attr("class",
			"am-list am-collapse admin-sidebar-sub am-in");

	/* loading进度条 */
	$.AMUI.progress.start();
	$.post(getContextPath() + "/role/queryRole.action", function(data) {
		$.AMUI.progress.done();
		$("#admin-content").html(data);
	});
});
