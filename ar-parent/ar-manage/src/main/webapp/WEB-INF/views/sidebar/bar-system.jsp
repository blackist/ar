<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<li class="admin-parent" id="bar-system">
	<a class="am-cf" href="javascript:;" data-am-collapse="{target: '#system-setting'}"> 
		<span class="am-icon-file"></span> 系统设置 
		<span class="am-icon-angle-right am-fr am-margin-right"></span>
	</a>
	<ul class="am-list am-collapse admin-sidebar-sub" id="system-setting">
		<li id="dictionary"><a href="dict/indexDict.action" class="am-cf"><span
				class="am-icon-search-plus"></span>字典</a></li>
		<li id="dictionary-data"><a href="dictData/indexDictData.action" class="am-cf"><span
				class="am-icon-search-plus"></span>字典数据</a></li>
		<li><a href="#"><span class="am-icon-puzzle-piece"></span>帮助页</a></li>
		<li><a href="#"><span class="am-icon-th"></span> 相册页面</a></li>
	</ul>
</li>
<script src="assets/script/sidebar/bar-system.js"></script>