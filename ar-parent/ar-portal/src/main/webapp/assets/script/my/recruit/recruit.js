/**
 * Created by black on 2017/3/30.
 */
$(function() {
    $("#my-recruit").attr("class", "active");

    _pageBond(getContextPath() + "/my/recruit.action");
});

function deleteMyRecruit(recruitId) {
    if (window.confirm('确定删除这条招聘信息？')){
        post(getContextPath() + "/my/recruit/delete.action", {'recruitId' : recruitId});
    }
}