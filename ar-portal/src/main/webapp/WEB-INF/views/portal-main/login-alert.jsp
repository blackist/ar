<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<button type="button" id="loginInJspBtn" data-toggle="modal"
	data-target="#jsp_login_model" hidden="true"></button>
<div class="modal fade" id="jsp_login_model" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="col-md-10">
				<form class="form-horizontal" method="post"
					action="${pageContext.request.contextPath}/login/val.action" id="loginForm">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">登录</h4>
						</div>
						<div class="panel-body">
							<div class="form-group">
								<label class="col-sm-3 control-label"> 帐号 </label>
								<div class="col-sm-7">
									<input class="form-control" type="text" required
										placeholder="用户名" name="araccount" id="araccount"
										onkeypress="if(event.keyCode==13){loginBtn.click();return false;}">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"> 密码 </label>
								<div class="col-sm-7">
									<input class="form-control" type="password" required
										placeholder="密码" name="arpassword" id="arpassword"
										onkeypress="if(event.keyCode==13){loginBtn.click();return false;}">
								</div>
							</div>
							<div class="col-md-3"></div>
							<button class="btn btn-primary" type="button" id="loginBtn"
								onclick="login()">&nbsp;&nbsp;&nbsp;登&nbsp;录&nbsp;&nbsp;&nbsp;</button>
							<button class="btn btn-primary" type="button" id="">&nbsp;&nbsp;&nbsp;注&nbsp;册&nbsp;&nbsp;&nbsp;</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>

<script>
	function login() {
		var araccount = $("#araccount").val();
		var arpassword = $("#arpassword").val();

		if (!isValid(araccount)) {
			errMsg('araccount', "用户名不能为空");
			return;
		}
		if (!isValid(arpassword)) {
			errMsg('arpassword', "密码不能为空");
			return;
		}

		$.ajax({
			type : 'POST',
			url : 'login/val.action',
			data : "araccount=" + araccount + "&arpassword=" + arpassword,
			success : function(data) {
				rs = eval(data);
				if (rs.msg == "OK") {
					$("#araccount").val("");
					window.location.reload();
				} else if (rs.type == "p") {
					errMsg('arpassword', rs.msg);
				} else if (rs.type == "a") {
					errMsg('araccount', rs.msg);
				}
			},
			error : function() {
				alert("系统错误");
			},
			dataType : "json"
		});
	}
</script>
