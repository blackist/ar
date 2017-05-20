<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="am-cf">
    &nbsp;&nbsp;共 ${page.totalRows} 条记录
    <div class="am-fr">
        <ul class="am-pagination">
            <li <c:if test="${page.pageIndex<=1}">class="am-disabled"</c:if>><a
                    class="page-indexor" href="javascript:void(0);"
                    <c:if test="${page.pageIndex>1}">value="${page.pageIndex-1}"</c:if>>«</a></li>
            <c:forEach items="${page.codeList}" var="pagecode">
                <li
                        <c:if test="${page.pageIndex==pagecode}">class="am-active"</c:if>><a
                        class="page-indexor" href="javascript:;"
                        <c:if test="${pagecode>-1}">value="${pagecode}"</c:if>>${pagecode}</a></li>
            </c:forEach>
            <li
                    <c:if test="${page.pageIndex>=page.totalPages}">class="am-disabled"</c:if>><a
                    class="page-indexor" href="javascript:void(0);"
                    <c:if test="${page.pageIndex<page.totalPages}">value="${page.pageIndex+1}"</c:if>>»</a></li>
        </ul>
    </div>
</div>

<script type="text/javascript">
    /* 为页码绑定查询器 */
    function _pageBond(_queryfunc) {
        /*翻页页码绑定查询器*/
        $(".page-indexor").click(function () {
            /*页码*/
            var pageIndex = $(this).attr("value");
            /*页尺寸*/
            var pageSize = $("#_pageSize").val();
            /* 页码可用 */
            if (pageIndex != null) {
                /*执行查询*/
                _queryfunc(pageIndex, pageSize);
            }
        });
        $("#_pageSize").change(function () {
            /*页码*/
            //var pageIndex = $(".am-pagination.am-active a").attr("value");
            var pageIndex = 1;
            /*页尺寸*/
            var pageSize = $("#_pageSize").val();
            _queryfunc(pageIndex, pageSize);
        });
        $("select.dll-query").change(function () {
            /*页码*/
            var pageIndex = 1;
            /*页尺寸*/
            var pageSize = $("#_pageSize").val();
            _queryfunc(pageIndex, pageSize);
        });
        $("button.dll-query ").click(function () {
            /*页码*/
            var pageIndex = $("li .page-indexor .am-active").attr("value");
            /*页尺寸*/
            var pageSize = $("#_pageSize").val();
            _queryfunc(pageIndex, pageSize);
        });
    }
</script>
