$(function() {
	$("#index-li").attr("class", "active");
});

function joinClass() {
	var userId = getUserId();
	var classId = $("#asfvbszd_ausivsbkjzcnsaohdknxzoxhjcnc_").val();
	/* 参数校验 */
	if (isValid(userId) && isValid(classId)) {
		$.post(getContextPath() + '/classroom/joinClass.action', {
			"userId" : userId,
			"classId" : classId
		}, function(data) {
			window.location.reload();
		});
	}
}