<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<input type="hidden" id="_message"
       <c:if test="${_message != null && _message != ''}">value="${_message}"</c:if>>


<script type="text/javascript">
    /**
     * 浮动DIV定时显示提示信息,如操作成功, 失败等
     * @param string
     *            _messgae (提示的内容)
     * @param int
     *            height 显示的信息距离浏览器顶部的高度
     * @param int
     *            time 显示的时间(按秒算), time > 0
     * @sample <a href="javascript:void(0);" onclick="_alert_messgae( '操作成功', 100, 3
     *         );">点击</a>
     * @sample 上面代码表示点击后显示操作成功3秒钟, 距离顶部100px
     * @copyright Mr.Black 2015-12-28
     */
    function _alert_messgae(_messgae, height, time) {
        var windowWidth = document.documentElement.clientWidth;
        var tipsDiv = '<div class="_message-class">&nbsp;&nbsp;' + _messgae
            + '&nbsp;&nbsp;</div>';
        $('body').append(tipsDiv);
        $('div._message-class').css({
            'position': 'absolute',
            'top': height + 'px',
            'left': ((windowWidth / 2) - (_messgae.length) * 13) + 'px',
            'padding': '3px 5px',
            'background': '#8FCCFF',
            'font-size': 14 + 'px',
            'margin': '0 auto',
            'text-align': 'center',
            'width': 'auto',
            'color': '#fff',
            'opacity': '0.8'
        }).show();
        setTimeout(function () {
            $('div._message-class').fadeOut();
        }, (time * 1000));
    }
    /* 填充信息 */
    $(function () {
        var _message = $("#_message").val();
        if (_message.length > 1) {
            $('div').remove("._message-class");
            _alert_messgae(_message, 200, 2);
        }
    });
</script>
</html>