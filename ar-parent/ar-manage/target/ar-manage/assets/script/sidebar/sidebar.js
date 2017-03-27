$(function() {

	/*给所有 bar 添加 click 事件, 最多开启一个 bar*/
//	$("#bar-class").attr("onclick", "_openOnlyOne()");
//	$("#bar-forum").attr("onclick", "_openOnlyOne()");
//	$("#bar-news").attr("onclick", "_openOnlyOne()");
//	$("#bar-org").attr("onclick", "_openOnlyOne()");
//	$("#bar-recruit").attr("onclick", "_openOnlyOne()");
//	$("#bar-system").attr("onclick", "_openOnlyOne()");

	/* 禁能所有超链接的href */
	//$("a").attr("href", "javascript:void(0)");
});

/* 只保持一个 ul list 打开 */
function _openOnlyOne() {
	$("#class-manage").attr("class", "am-list am-collapse admin-sidebar-sub");
	$("#forum-manage").attr("class", "am-list am-collapse admin-sidebar-sub");
	$("#news-manage").attr("class", "am-list am-collapse admin-sidebar-sub");
	$("#org-manage").attr("class", "am-list am-collapse admin-sidebar-sub");
	$("#job-manage").attr("class", "am-list am-collapse admin-sidebar-sub");
	$("#system-setting").attr("class", "am-list am-collapse admin-sidebar-sub");
}
