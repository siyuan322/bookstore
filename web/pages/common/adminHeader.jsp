<%--
  Created by IntelliJ IDEA.
  User: Delicate
  Date: 2020/11/19
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="header">
    <img class="logo_img" alt="" src="${pageContext.request.contextPath}/static/img/logo.png">
    <div>
        <span>欢迎您，<span class="um_span">${loginUser.username}</span></span>
        <a href="${pageContext.request.contextPath}/book/showAllBooksServlet">图书管理</a>
        <a href="${pageContext.request.contextPath}/order/showAllOrdersServlet">订单管理</a>
        <a href="${pageContext.request.contextPath}/indexServlet">返回商城</a>
        <a href="${pageContext.request.contextPath}/exitServlet">退出</a>
    </div>
</div>
