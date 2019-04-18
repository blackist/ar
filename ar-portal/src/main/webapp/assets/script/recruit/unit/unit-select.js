$(function() {

});

function selectUnit() {
	var unitId = $("#unitId").val();
	location.href = "recruit/addRecruit.action?unitId=" + unitId;
}