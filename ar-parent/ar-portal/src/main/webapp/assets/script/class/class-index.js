$(function() {
	$("#nav-class").attr("class", "active");
	// 加载outline信息
	$.post("class/outlineClass.action", function(data) {
		$("#class-outline").html(data);
	});
});