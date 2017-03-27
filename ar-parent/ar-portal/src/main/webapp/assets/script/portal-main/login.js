$(function() {

	/* 登录信息反馈 */
	var accountErr = $("#accountErr").val();
	var passwordErr = $("#passwordErr").val();
	if (isValid(accountErr)) {
		errMsg("account", accountErr);
	}
	if (isValid(passwordErr)) {
		errMsg("password", passwordErr);
	}

	/* 登录校验 */
	$('#loginBtn').click(
			function() {
				var account = $("#account").val();
				var password = $("#password").val();

				if (!isValid(account)) {
					errMsg("account", "用户名不能为空");
					return;
				}

				if (!isValid(password)) {
					errMsg("password", "密码不能为空");
					return;
				}

				if ($("#account").attr("name") == "araccount"
						&& $("#password").attr("name") == "arpassword") {
					$("#loginForm").submit();
				} else {
					errMsg("password", "页面错误");
				}
			});
});