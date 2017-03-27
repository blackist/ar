<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/ar-taglib" prefix="ar"%>
<!DOCTYPE html>
<html>
<head>
<title>联系我们-信电校友录</title>
<%@ include file="/WEB-INF/views/portal-common/portal-meta.jsp"%>
</head>
<body>
	<!-- 页头 -->
	<%@ include file="/WEB-INF/views/portal-common/header.jsp"%>

	<!-- 导航栏 -->
	<%@ include file="/WEB-INF/views/portal-common/navmenu.jsp"%>

	<!-- contact -->
	<div class="contact">
		<div class="container higher">
			<div class="col-md-4 contact-left">
				<h3>地址</h3>
				<p>
					est eligendi optio cumque nihil impedit quo minus id quod maxime <span>26
						56D Rescue,US</span>
				</p>
				<ul>
					<li>联系电话 :+1 078 4589 2456</li>
					<li>联系方式 :+1 078 4589 2456</li>
					<li>传真 :+1 078 4589 2456</li>
					<li><a href="mailto:info@example.com">1075512174@</a></li>
				</ul>
			</div>
			<div class="col-md-8 contact-left">
				<h3>联系我们</h3>
				<form>
					<input type="text" placeholder="姓名" required="required"> <input
						type="email" placeholder="邮箱" required="required"> <input
						type="text" placeholder="电话" required="required">
					<textarea placeholder="留言..." required="required"></textarea>
					<input type="submit" value="发送">
				</form>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- //contact -->

	<!-- 页脚 -->
	<%@ include file="/WEB-INF/views/portal-common/footer.jsp"%>
</body>
<%@ include file="/WEB-INF/views/portal-common/portal-js.jsp"%>
<script src="assets/script/message/contact-us.js"></script>
</html>