<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="signinpanel">
	<div class="col-md-3">
		<form method="post" action="${pageContext.request.contextPath}/login/validate.action" id="loginForm">
			<h4 class="nomargin">登&nbsp;录</h4>
			<input id="-sdcjsd_mdjskvnsjv-hcdsxzlregfbdcskxm" type="hidden"
				name="queryString" value="${queryString}"> <input
				type="text" id="account" name="araccount" value="${account}"
				class="form-control uname" placeholder="用户名"
				onkeypress="if(event.keyCode==13){loginBtn.click();return false;}" /><input
				type="password" id="password" name="arpassword" value=""
				class="form-control pword" placeholder="密码"
				onkeypress="if(event.keyCode==13){loginBtn.click();return false;}" />
			<div class="row"></div>
			<a href="javascript:;"><small>忘记密码?</small></a>
			<button class="btn btn-success btn-block" type="button" id="loginBtn">登&nbsp;录</button>
			<input type="hidden" id="accountErr" value="${accountErr}"> <input
				type="hidden" id="passwordErr" value="${passwordErr}">
		</form>
	</div>
</div>


