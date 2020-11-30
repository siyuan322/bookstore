<%--
  Created by IntelliJ IDEA.
  User: Delicate
  Date: 2020/11/19
  Time: 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 头部 -->
<div id="header">
    <img class="logo_img" alt="" src="${pageContext.request.contextPath}/static/img/logo.png">
    <div>
        <span>欢迎您，<span class="um_span">${loginUser.username}</span></span>
        <a href="${pageContext.request.contextPath}/indexServlet">书城首页</a>
        <a href="${pageContext.request.contextPath}/pages/cart/cart.jsp">购物车</a>
        <a href="${pageContext.request.contextPath}/order/showAllOrdersServlet">我的订单</a>
        <a href="${pageContext.request.contextPath}/exitServlet">退出</a>
    </div>
</div>
<!-- 头部 -->
