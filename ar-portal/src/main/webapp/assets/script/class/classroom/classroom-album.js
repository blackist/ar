$(function () {
    $("#album-li").attr("class", "active");

    // 相册翻页
    var classId = $("#classId").val();
    _pageBond(getContextPath() + "/classroom/album.action?classId=" + classId);
});

/**
 * 相册创建校验
 */
function addAlbum() {
    // 参数校验
    if (!isLength($('#albumName').val(), 2, 20)) {
        errMsg('albumName', '相册名称在2-20字符之间');
    } else if ($('#albumDesc').val().length > 200) {
        errMsg('albumDesc', '相册描述不能多余200字符');
    } else {
        $('#album-form').submit();
    }
}

/**
 * 相册编辑校验
 */
function editAlbum() {
    // 长度校验
    if (!isLength($('#albumName').val(), 2, 20)) {
        errMsg('albumName', '相册名称在2-20字符之间');
    } else if (!isLength($('#albumDesc').val(), 2, 200) || !isValid($('#albumDesc').val())) {
        errMsg('albumDesc', '相册描述在2-200字符之间');
    } else {
        $('#album-form').submit();
    }
}

/**
 * TODO 删除相册
 * @param albumId
 */
function deleteAlbum(albumId) {
    // 确认框
    if (window.confirm("确定要删除这个相册吗？")) {
        // 参数校验
        if (isValid(albumId)) {
            var classId = $('#classId').val();
            //调用方法 如  e
            post(getContextPath() + '/classroom/album/delete.action', {'albumId': albumId, 'classId' : classId});
        }
    }
}