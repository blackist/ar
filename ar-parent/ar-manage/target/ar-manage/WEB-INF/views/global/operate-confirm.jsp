<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="am-modal am-modal-confirm" tabindex="-1"
	id="operation-confirm">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">确认信息</div>
		<div class="am-modal-bd" id="_operation-msg">你，确定要这么做吗？</div>
		<div class="am-modal-footer">
			<span class="am-modal-btn" data-am-modal-cancel>取消</span> <span
				class="am-modal-btn" data-am-modal-confirm>确定</span>
		</div>
	</div>
</div>

<script type="text/javascript">
	function operateConfirm(operate, msg) {
		// 提示消息不为空
		if (isValid(msg)) {
			$("#_operation-msg").html(msg);
		}
		$('#operation-confirm').modal({
			onConfirm : function() {
				operate();
			},
			onCancel : function() {
			}
		});
	}
</script>