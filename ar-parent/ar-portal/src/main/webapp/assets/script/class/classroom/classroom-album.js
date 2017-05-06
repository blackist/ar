$(function () {
    $("#album-li").attr("class", "active");
    var classId = $("#classId").val();
    _pageBond("classroom/album.action?classId=" + classId);
});

/**
 * 相册创建校验
 */
function addAlbum() {
    if (!isLength($('#albumName').val(), 2, 20)) {
        errMsg('albumName', '相册名称在2-20字符之间');
    } else if (!isLength($('#albumDesc').val(), 2, 200) || !isValid($('#albumDesc').val())) {
        errMsg('albumDesc', '相册描述在2-200字符之间');
    } else {
        $('#album-form').submit();
    }
}