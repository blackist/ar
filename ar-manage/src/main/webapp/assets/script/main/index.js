$(function() {

	/* content 默认加载的界面 */
	loadWelcome();

});
/* content 默认加载的界面 */
function loadWelcome() {
	/* content 默认加载的界面 */
	/* SB进度条 */
	$.AMUI.progress.start();
	$.post(getContextPath() + "/manage/welcome.action", function(data) {
		$.AMUI.progress.done();
		$("#admin-content").html(data);
	});
}