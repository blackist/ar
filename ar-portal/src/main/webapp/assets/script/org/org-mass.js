$(function() {
	$("#nav-org").attr("class", "active");
	$("#org-tab-li-mass").attr("class", "active");
	// 加载outline信息
	$.post(getContextPath() + "/org/outline.action?originType=orgm", function(data) {
		$("#org-outline").html(data);
	});
});










