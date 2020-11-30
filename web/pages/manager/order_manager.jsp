<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>订单管理</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
</head>

<body>
<!-- 头部 -->
<jsp:include page="/pages/common/adminHeader.jsp"></jsp:include>

<!-- 头部 -->


<div id="main">
    <h2 class="little_title">订单管理</h2>
    <table>
        <tr>
            <td>订单号</td>
            <td>日期</td>
            <td>金额</td>
            <td>详情</td>
            <td>发货状态</td>
        </tr>
        <c:forEach items="${requestScope.orderList}" var="order">
            <tr>
                <td>${order.orderId}</td>
                <td>${order.createTime}</td>
                <td>¥${order.price}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/order/showOrderItemServlet?orderId=${order.orderId}">查看详情</a>
                </td>
                <c:if test="${order.status == 0}">
                    <td><a href="${pageContext.request.contextPath}/order/changeStatusServlet?orderId=${order.orderId}">点击发货</a>
                    </td>
                </c:if>
                <c:if test="${order.status != 0}">
                    <td>已发货</td>
                </c:if>
            </tr>
        </c:forEach>

    </table>
</div>


</body>

</html>