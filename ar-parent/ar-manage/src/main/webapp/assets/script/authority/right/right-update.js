$(function() {
	if ($("#rightName").val() == "未命名") {
		$("#rightName").val("");
	}
});

function updateRightSubmit() {
	$.AMUI.progress.start();
	var rightForm = $("#updateRightForm").serialize();
	$.post(getContextPath() + "/right/updateRightSubmit.action", rightForm, function(data) {
		$.AMUI.progress.done();
		$("#admin-content").html(data);
	});
}