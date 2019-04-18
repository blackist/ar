$(function() {
    $("#nav-recruit").attr("class", "active grid");

});

/* 投递简历 */
function postResume(recruitId) {
	if (!isValid($("#resumeId").val())) {
		errMsg("resumeId", "必选");
	} else {
		// 获取 resumeId
		var resumeId = $("#resumeId").val();
		// 投递简历, ajax异步刷新
		if (isValid(resumeId) && isValid(resumeId)) {
			// $.ajax({
			// type : 'POST',
			// url : 'resume/postResume.action',
			// data : "resumeId=" + resumeId + "&recruitId=" + recruitId,
			// success : function(data) {
			// location.href = data;
			// $("#postBtn").attr("onclick", "");
			// $("#postBtn").html("<i class='fa fa-check mr5'></i>申请成功");
			// },
			// error : function() {
			// alert("申请失败");
			// },
			// dataType : "json"
			// });
			// $.post('resume/postResume.action',{"resumeId":resumeId,"recruitId":
			// recruitId},function(data){
			// $('body').html(data);
			// });
			disableBtn("surePostostBtn");
			disableBtn("postBtn");
			$("#postForm").submit();
		}
	}
}

/* 投递简历 */
function cancelPostResume(recruitId) {
	if (!isValid($("#resumeId").val())) {
		errMsg("resumeId", "必选");
	} else {
		// 获取 resumeId
		var resumeId = $("#resumeId").val();
		// 投递简历, ajax异步刷新
		if (isValid(resumeId) && isValid(resumeId)) {
			disableBtn("surePostostBtn");
			disableBtn("postBtn");
			$("#postForm").submit();
		}
	}
}