<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/WEB-INF/views/global/base-path.jsp"%>
<%@ include file="/WEB-INF/views/global/manage-meta.jsp"%>
<title>系统错误</title>
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/i/title-logo.jpg" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/error-page.css" />
</head>
<body>
	<div id="page"
		style="border-style: dashed; border-color: #e4e4e4; line-height: 30px; background: url(sorry.png) no-repeat right;">
		<h1>抱歉，找不到此页面~</h1>
		<h2>Sorry, the site now can not be accessed.</h2>
		<font color="#666666">你请求访问的页面，暂时找不到，我们建议你返回首页进行浏览，谢谢！</font><br /> <br />
		<div class="button">
			<a href="${pageContext.request.contextPath}/indexManage.action" title="返回首页" target="_blank">返回首页</a>
		</div>
	</div>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
</body>
</html>