$(function() {
	$("#nav-org").attr("class", "active");
	$("#org-tab-li-institute").attr("class", "active");
	// 加载outline信息
	$.post(getContextPath() + "/org/outline.action?originType=orgi", function(data) {
		$("#org-outline").html(data);
	});
});










