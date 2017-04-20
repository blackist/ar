$(function() {
	$("#info-li").attr("class", "active");
});
/* 回复点击 */
function reply(obj) {
	$("#commentContent").val("回复 " + obj + "：");
	$("#commentContent").focus();
	windowToEL("commentContent");
}

/* 评论点击 */
function comment() {
	$("#commentContent").val("");
	$("#commentContent").focus();
	windowToEL("commentContent");
}