<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath}/static/script/jquery-1.7.2.js"></script>

<script>
    $(function () {
        location.href = "${pageContext.request.contextPath}/indexServlet?search=";
    })
</script>