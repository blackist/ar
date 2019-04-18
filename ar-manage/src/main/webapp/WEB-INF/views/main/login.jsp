<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/views/global/common-taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="/WEB-INF/views/global/base-path.jsp"%>
<%@ include file="/WEB-INF/views/global/manage-title.jsp"%>
<%@ include file="/WEB-INF/views/global/manage-meta.jsp"%>
<%@ include file="/WEB-INF/views/global/common-css.jsp"%>
<%@ include file="/WEB-INF/views/global/common-js.jsp"%>
</head>
<body>
	<div class="header">
		<hr />
	</div>
	<div class="am-g">
		<div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
			<h3>登录</h3>
			<hr>
			<div class="am-btn-group">
				<a href="#" class="am-btn am-btn-secondary am-btn-sm"><i
					class="am-icon-github am-icon-sm"></i> Github</a> <a href="#"
					class="am-btn am-btn-success am-btn-sm"><i
					class="am-icon-google-plus-square am-icon-sm"></i> Google+</a> <a
					href="#" class="am-btn am-btn-primary am-btn-sm"><i
					class="am-icon-stack-overflow am-icon-sm"></i> stackOverflow</a>
			</div>
			<br> <br>

			<form method="get" action="${pageContext.request.contextPath}/login/loginValidate.action"
				class="am-form">
				<label for="text">用户名:</label> <input type="text" name="account"
					value="${account}" placeholder="用户名"> <span
					class="error_span">${accountErr}</span> <br> <label
					for="password">密码:</label> <input type="password" name="password"
					value="" placeholder="密码"> <span class="error_span">${passwordErr}</span>
				<br> <label for="remember-me"> <input id="remember-me"
					type="checkbox"> 记住密码
				</label> <br>
				<div class="am-cf">
					<input type="submit" value="登 录"
						class="am-btn am-btn-primary am-btn-sm am-fl"> <input
						type="submit" name="" value="忘记密码 ^_^? "
						class="am-btn am-btn-default am-btn-sm am-fr">
				</div>
			</form>
			<hr>
		</div>
	</div>
</body>
</html>