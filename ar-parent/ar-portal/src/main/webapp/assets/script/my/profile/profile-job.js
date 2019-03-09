$(function() {
	$("#my-profile").attr("class", "active");
});

/**
 * TODO 删除用户工作信息
 * @param jobId jobId
 */
function deleteJob(jobId) {
	if (window.confirm('确定删除这条信息？')){
        // 提交删除
        post(getContextPath() + "/my/profile/job/delete.action", {"jobId" : jobId});
	}
}