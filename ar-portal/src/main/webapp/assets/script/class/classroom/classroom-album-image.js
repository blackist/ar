$(function() {
	$("#album-li").attr("class", "active");

	var classId = $("#classId").val();
	var albumId = $("#albumId").val();
	_pageBond("classroom/album/image.action?classId=" + classId + "&albumId=" + albumId);


    /**
     * 复选框、下拉框
     */
    jQuery('.thmb').hover(function(){
        var t = jQuery(this);
        t.find('.ckbox').show();
        t.find('.fm-group').show();
    }, function() {
        var t = jQuery(this);
        if(!t.closest('.thmb').hasClass('checked')) {
            t.find('.ckbox').hide();
            t.find('.fm-group').hide();
        }
    });

    jQuery('.ckbox').each(function(){
        var t = jQuery(this);
        var parent = t.parent();
        if(t.find('input').is(':checked')) {
            t.show();
            parent.find('.fm-group').show();
            parent.addClass('checked');
        }
    });


    jQuery('.ckbox').click(function(){
        var t = jQuery(this);
        if(!t.find('input').is(':checked')) {
            t.closest('.thmb').removeClass('checked');
            enable_itemopt(false);
        } else {
            t.closest('.thmb').addClass('checked');
            enable_itemopt(true);
        }
    });

    jQuery('#selectall').click(function(){
        if(jQuery(this).is(':checked')) {
            jQuery('.thmb').each(function(){
                jQuery(this).find('input').attr('checked',true);
                jQuery(this).addClass('checked');
                jQuery(this).find('.ckbox, .fm-group').show();
            });
            enable_itemopt(true);
        } else {
            jQuery('.thmb').each(function(){
                jQuery(this).find('input').attr('checked',false);
                jQuery(this).removeClass('checked');
                jQuery(this).find('.ckbox, .fm-group').hide();
            });
            enable_itemopt(false);
        }
    });

    function enable_itemopt(enable) {
        if(enable) {
            jQuery('.itemopt').removeClass('disabled');
        } else {

            // check all thumbs if no remaining checks
            // before we can disabled the options
            var ch = false;
            jQuery('.thmb').each(function(){
                if(jQuery(this).hasClass('checked'))
                    ch = true;
            });

            if(!ch)
                jQuery('.itemopt').addClass('disabled');
        }
    }

    jQuery("a[data-rel^='prettyPhoto']").prettyPhoto();
});

/**
 * TODO 删除相册图片
 * @param imageId
 */
function deleteImage(imageId) {
    // 确认删除
    if (window.confirm("确定删除这张图片吗？")){
        // 获取参数
        var classId = $('classId').val();
        var albumId = $('albumId').val();
        // 提交
        post(getContextPath() + '/classroom/album/image/delete.action', {'imageId' : imageId, 'classId' : classId, 'albumId' : albumId});
    }
}                                


