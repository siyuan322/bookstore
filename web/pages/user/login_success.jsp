<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>登录成功</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
    <style type="text/css">
        h1 {
            text-align: center;
            margin-top: 200px;
        }

        h1 a {
            color: red;
        }
    </style>
</head>

<body>
<!-- 头部 -->
<jsp:include page="/pages/common/userHeader.jsp"></jsp:include>
<!-- 头部 -->

<div id="main">

    <h1>欢迎回来 <a href="${pageContext.request.contextPath}/indexServlet">转到主页</a></h1>

</div>


</body>

</html>