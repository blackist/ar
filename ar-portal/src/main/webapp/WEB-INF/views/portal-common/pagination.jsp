<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/views/portal-common/portal-tag.jsp" %>

<div class="col-md" style="text-align: center;">
    <nav>
        <ul class="pagination">
            <li><a class="page-indexor" href="javascript:;"
                   aria-label="Previous"
                   <c:if test="${page.pageIndex>1}">value="${page.pageIndex-1}"</c:if>>
                <i class="fa fa-angle-left"></i>
            </a></li>
            <c:forEach items="${page.codeList}" var="pagecode">
                <li <c:if test="${page.pageIndex==pagecode}">class="active"</c:if>><a
                        class="page-indexor" href="javascript:;"
                        <c:if test="${pagecode>-1}">value="${pagecode}"</c:if>>${pagecode}<span
                        class="sr-only"></span></a></li>
            </c:forEach>
            <li><a class="page-indexor" href="javascript:;"
                   aria-label="Next"
                   <c:if test="${page.pageIndex<page.totalPages}">value="${page.pageIndex+1}"</c:if>>
                <i class="fa fa-angle-right"></i>
            </a></li>
        </ul>
    </nav>
</div>

<script type="text/javascript">
    /* 为页码绑定查询器 */
    function _pageBond(action) {
        /*翻页页码绑定查询器*/
        $(".page-indexor")
            .click(
                function () {
                    /*页码*/
                    var pageIndex = $(this).attr("value");
                    var queryStr = $("#queryStr").val();
                    var selectStr = $("#selectStr").val();
                    /* 页码可用 */
                    if (pageIndex != null) {
                        // 判断是否有查询条件
                        if (isValid(queryStr)) {
                            // 下拉框已选则
                            if (isValid(selectStr)) {
                                /*执行查询*/
                                if (action.indexOf("?") > 0) {
                                    $(this).attr(
                                        "href",
                                        action + "&queryStr="
                                        + queryStr
                                        + "&pageIndex="
                                        + pageIndex
                                        + "&selectStr="
                                        + selectStr);
                                } else {
                                    $(this).attr(
                                        "href",
                                        action + "?queryStr="
                                        + queryStr
                                        + "&pageIndex="
                                        + pageIndex
                                        + "&selectStr="
                                        + selectStr);
                                }
                            } else {
                                /*执行查询*/
                                if (action.indexOf("?") > 0) {
                                    $(this).attr(
                                        "href",
                                        action + "&queryStr="
                                        + queryStr
                                        + "&pageIndex="
                                        + pageIndex);
                                } else {
                                    $(this).attr(
                                        "href",
                                        action + "?queryStr="
                                        + queryStr
                                        + "&pageIndex="
                                        + pageIndex);
                                }
                            }
                        } else {
                            // 下拉框已选则
                            if (isValid(selectStr)) {
                                /*执行查询*/
                                if (action.indexOf("?") > 0) {
                                    $(this).attr(
                                        "href",
                                        action + "&pageIndex="
                                        + pageIndex
                                        + "&selectStr="
                                        + selectStr);
                                } else {
                                    $(this).attr(
                                        "href",
                                        action + "?pageIndex="
                                        + pageIndex
                                        + "&selectStr="
                                        + selectStr);
                                }
                            } else {
                                /*执行查询*/
                                if (action.indexOf("?") > 0) {
                                    $(this).attr(
                                        "href",
                                        action + "&pageIndex="
                                        + pageIndex);
                                } else {
                                    $(this).attr(
                                        "href",
                                        action + "?pageIndex="
                                        + pageIndex);
                                }
                            }
                        }
                    }
                });
    }
</script>



