<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>图书管理</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
</head>

<body>
<!-- 头部 -->
<jsp:include page="/pages/common/adminHeader.jsp"></jsp:include>

<!-- 头部 -->

<div id="main">
    <h2 class="little_title">图书管理</h2>
    <table>
        <tr>
            <td>名称</td>
            <td>价格</td>
            <td>作者</td>
            <td>销量</td>
            <td>库存</td>
            <td colspan="2">操作</td>
        </tr>
        <c:forEach var="i" items="${bookPb.list}">
            <tr>
                <td>${i.name}</td>
                <td>${i.price}</td>
                <td>${i.author}</td>
                <td>${i.sales}</td>
                <td>${i.stock}</td>
                <td><a href="${pageContext.request.contextPath}/book/editBookServlet?id=${i.id}">修改</a></td>
                <td><a href="${pageContext.request.contextPath}/book/deleteBookServlet?id=${i.id}">删除</a></td>
            </tr>
        </c:forEach>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td><a href="${pageContext.request.contextPath}/pages/manager/book_add.jsp">添加图书</a></td>
        </tr>


    </table>

    <div id="page_nav">
        <a href="${pageContext.request.contextPath}/book/showAllBooksServlet?currentPage=1">首页</a>

        <c:if test="${bookPb.currentPage <= 1}">
            <a href="${pageContext.request.contextPath}/book/showAllBooksServlet?currentPage=1">上一页</a>
        </c:if>
        <c:if test="${bookPb.currentPage > 1}">
            <a href="${pageContext.request.contextPath}/book/showAllBooksServlet?currentPage=${bookPb.currentPage-1}">上一页</a>
        </c:if>


        <c:forEach begin="1" end="${bookPb.totalPage}" var="i" step="1">
            <c:if test="${bookPb.currentPage == i}">
                <a class="current"
                   href="${pageContext.request.contextPath}/book/showAllBooksServlet?currentPage=${i}">${i}</a>
            </c:if>
            <c:if test="${bookPb.currentPage != i}">
                <a href="${pageContext.request.contextPath}/book/showAllBooksServlet?currentPage=${i}">${i}</a>
            </c:if>
        </c:forEach>

        <c:if test="${bookPb.currentPage >= bookPb.totalPage}">
            <a href="${pageContext.request.contextPath}/book/showAllBooksServlet?currentPage=${bookPb.totalPage}">下一页</a>
        </c:if>
        <c:if test="${bookPb.currentPage < bookPb.totalPage}">
            <a href="${pageContext.request.contextPath}/book/showAllBooksServlet?currentPage=${bookPb.currentPage+1}">下一页</a>
        </c:if>

        <a href="${pageContext.request.contextPath}/book/showAllBooksServlet?currentPage=${bookPb.totalPage}">末页</a>
        共<span id="totalPage">${bookPb.totalPage}</span>页，<span id="totalCount">${bookPb.totalCount}</span>条记录
    </div>
</div>

</body>

</html>