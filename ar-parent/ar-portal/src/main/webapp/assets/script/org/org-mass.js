$(function() {
	$("#nav-org").attr("class", "active");
	$("#org-tab-li-mass").attr("class", "active");
	// 加载outline信息
	$.post("org/outline.action?originType=orgm", function(data) {
		$("#org-outline").html(data);
	});
});










