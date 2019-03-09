$(function() {
	$("#nav-org").attr("class", "active");
	$("#org-tab-li-union").attr("class", "active");
	// 加载outline信息
	$.post(getContextPath() + "/org/outline.action?originType=orgu", function(data) {
		$("#org-outline").html(data);
	});
});










