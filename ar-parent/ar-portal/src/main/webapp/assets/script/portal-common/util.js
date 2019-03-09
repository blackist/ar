/*校验失败提示信息*/
function errMsg(el, msg) {
    $(".error").html("");
    $("#" + el).after("<label class='error'>" + msg + "</label>");
    $("#" + el).focus();
    setTimeout(function () {
        $(".error").fadeOut(2000);
    }, 2300);
}

/* 清除校验失败提示信息 */
function errClean() {
    $(".error").html("");
}

/**
 * 获取 contextPath
 * @returns {string}
 */
function getContextPath() {
    var pathName = document.location.pathname;
    var index = pathName.substr(1).indexOf("/");
    var result = pathName.substr(0, index + 1);
    return result;
}

/* 使按钮失效 */
function disableBtn(el) {
    $("#" + el).attr("disabled", "disabled");
    $("#" + el).attr("onclick", "");
}

/* 校验参数有效性 */
function isValid(param) {
    if (param != null && param != '' && $.trim(param).length > 0) {
        return true;
    }
    return false;
}

/* 长度有效性 */
function isLength(param, min, max) {
    if (isValid(param)) {
        if (param.length >= min && param.length <= max) {
            return true;
        }
    }
    return false;
}

/* 验证数字 */
function isNumber(param) {
    var valid = /^[0-9]*$/;
    if (isValid(param)) {
        if (valid.test(param)) {
            return true;
        }
    }
    return false;
}

/* 屏幕定位 */
function windowToEL(el) {
    $("html,body").animate({scrollTop: $("#" + el).offset().top}, 500);
    $("#" + el).focus();
}

/* 用户检测 */
function getUserId() {
    var userId = $("#_sfhk_jbkjb_sfhk_").val();
    if (isValid(userId)) {
        return userId;
    }
    return null;
}

/* 登录校验 */
function isLogin() {
    var userId = $("#_sfhk_jbkjb_sfhk_").val();
    if (isValid(userId) && userId > 0) {
        return true;
    } else {
        $("#loginInJspBtn").click();
    }
    return false;
}

/**
 * TODO 利用js进行POST方式提交
 * @param URL
 * @param PARAMS
 */
function post(URL, PARAMS) {
    var temp = document.createElement("form");
    temp.action = URL;
    temp.method = "post";
    temp.style.display = "none";
    for (var x in PARAMS) {
        var opt = document.createElement("input");
        opt.name = x;
        opt.value = PARAMS[x];
        temp.appendChild(opt);
    }
    document.body.appendChild(temp);
    temp.submit();
    return;
}


























