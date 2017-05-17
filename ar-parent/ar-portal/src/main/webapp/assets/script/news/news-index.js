$(function() {
	$("#nav-news").attr("class", "active grid");

	// 分页器绑定
	_pageBond("news.action");

	$.post('news/outline.action', function (data) {
        $('#news-outline').html(data);
    })
});
