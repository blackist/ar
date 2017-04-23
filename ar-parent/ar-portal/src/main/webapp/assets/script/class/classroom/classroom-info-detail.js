$(function() {
	$("#info-li").attr("class", "active");
});
/* 回复点击 */
function reply(obj) {
	$("#commentContent").val("回复 " + obj + "：");
	windowToEL("commentContent");
}

/* 评论点击 */
function comment() {
	$("#commentContent").val("");
	windowToEL("commentContent");
}