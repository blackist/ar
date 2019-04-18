$(function () {

});

function updateDictSubmit() {
    $.AMUI.progress.start();
    var dictForm = $("#updateDictForm").serialize();
    $.post(getContextPath() + "/dict/updateDictSubmit.action", dictForm, function (data) {
        $.AMUI.progress.done();
        $("#admin-content").html(data);
    });
}