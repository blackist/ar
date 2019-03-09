/**
 * Created by black on 2017/3/30.
 */
$(function() {
    $("#my-recruit").attr("class", "active");

    _pageBond(getContextPath() + "/my/resume/posted.action)
});

function cancelMyPost(recruitId, resumeId) {
    if (window.confirm('确定取消投递信息吗？')){
        post('my/resume/cancel.action', {"recruitId" : recruitId, "resumeId" : resumeId});
    }
}
