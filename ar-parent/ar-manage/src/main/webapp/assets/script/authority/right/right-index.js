$(function(){
	//right side bar 打开
	$("#right-manage").attr("class","am-list am-collapse admin-sidebar-sub am-in");
	
	//content 默认加载列表界面
	loadRightQuery();
});
/*加载列表界面   用于导航栏的点击事件*/
function loadRightQuery() {
	/*loading进度条*/
	$.AMUI.progress.start();
	$.post(getContextPath() + "/right/queryRights.action", function(data) {
		$.AMUI.progress.done();
		$("#admin-content").html(data);
	});
}
/*导航栏点击事件，导航至right-index.jsp(刷新页面)*/
function loadRightIndex() {
	$.AMUI.progress.start();
	location.href=getContextPath() + "/right/indexRight.action";
}
