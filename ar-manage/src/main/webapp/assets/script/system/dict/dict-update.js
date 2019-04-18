$(function () {

});

function updateDictSubmit() {
    var dictForm = $("#updateDictForm").serialize();
    $.post(getContextPath() + "/dict/updateDictSubmit.action", dictForm, function (data) {
        $("#admin-content").html(data);
    });
}