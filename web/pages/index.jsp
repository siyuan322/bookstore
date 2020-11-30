<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>当当</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/boot.css">
    <script src="${pageContext.request.contextPath}/static/script/jquery-1.7.2.js"></script>
    <style>
        ul,
        li {
            padding: 0;
            margin: 0;
        }

        .book_cond {
            margin-left: 400px;
        }

        #index {
            width: 1200px;
            margin: auto;
            border-top: 1px solid #ff2832;
        }

        .page_one .xinxi {
            font-size: 16px;
        }

        .page_one .xinxi .left {
            width: 1200px;
            float: left;
        }

        .page_one .xinxi .left > ul li {
            width: 100%;
            height: 170px;
            border: 1px solid #eee;
            border-left: 0;
            margin-bottom: 15px;
            overflow: hidden;
        }

        .page_one .xinxi .left > ul li .img {
            width: 320px;
            height: 170px;
            float: left;
        }

        .page_one .xinxi .left > ul li .text1 {
            width: 600px;
            float: left;
            padding: 20px;
            color: #a3a3a3;
            font-size: 14px;
        }

        .page_one .xinxi .left > ul li .text1 p:nth-of-type(1) {
            color: #000;
            font-size: 18px;
            margin-bottom: 5px;
        }

        .page_one .xinxi .left > ul li .price {
            width: 215px;
            text-align: center;
            float: left;
            height: 95px;
            border-left: 1px solid #eee;
            margin-top: 35px;
            font-size: 16px;
        }

        .page_one .xinxi .left > ul li .price p {
            line-height: 1;
            margin-top: 15px;
        }

        .page_one .xinxi .left > ul li .price .price_num {
            line-height: 1;
            font-size: 30px;
            color: #ff4848;
        }

        .page_one .xinxi .left > ul li .price .price_num span:nth-of-type(3) {
            font-size: 16px;
        }

        .page_one .xinxi .left .page_num_inf {
            color: #878787;
            font-size: 19px;
            margin-bottom: 20px;
        }

        .page_one .xinxi .left .page_num_inf i {
            float: left;
            width: 4px;
            background-color: #878787;
            height: 20px;
            margin-top: 5px;
            margin-right: 10px;
        }

        .page_one .xinxi .left .page_num_inf span {
            color: #ff4848;
        }

        .form-control {
            width: 300px !important;
        }

        .btn {
            margin-bottom: -9px !important;
        }

        #submit_search {
            width: 80px;
            background-color: #ff2832;
            color: #fff;
            font: normal 16px "Microsoft Yahei";
        }

        #addCart {
            background-color: #ff2832;
            color: #fff;
            font: normal 16px "Microsoft Yahei";
        }

        .img img {
            margin-left: 50px;
        }

        /*分页样式*/

        .pageNum {
            width: 100%;
            overflow: hidden;
        }

        .pageNum ul li {
            width: 40px;
            height: 40px;
            float: left;
            border: 1px solid #eee;
            margin-right: 10px;
            text-align: center;
            line-height: 40px;
        }

        .pageNum ul li.curPage {
            background-color: #ffc900;
        }

        .pageNum ul li a {
            width: 100%;
            height: 100%;
            color: #000;
            font-size: 14px;
        }

        .pageNum ul .threeword {
            width: 75px;
        }

        .current {
            background-color: #ff2832;
        }

        .current a {
            color: #fff !important;
        }
    </style>

    <script>
        $(function () {
            $("button.addToCart").click(function () {
                let bookId = $(this).attr("bookId");
                location.href = "${pageContext.request.contextPath}/buy/addCartServlet?id=" + bookId;
            })
        })
    </script>
</head>


<body>
<c:if test="${loginUser != null}">
    <c:if test="${\"admin\".equals(loginUser.getRole())}">
        <jsp:include page="/pages/common/adminHeader.jsp"></jsp:include>
    </c:if>
    <c:if test="${\"user\".equals(loginUser.getRole())}">
        <jsp:include page="/pages/common/userHeader.jsp"></jsp:include>
    </c:if>
</c:if>
<c:if test="${loginUser == null}">
    <div id="header">
        <img class="logo_img" alt="" src="${pageContext.request.contextPath}/static/img/logo.png">
        <div>
            <a href="${pageContext.request.contextPath}/pages/user/login.jsp">登录</a>/
            <a href="${pageContext.request.contextPath}/pages/user/regist.jsp">注册</a>
        </div>
    </div>
</c:if>


<div id="index">
    <div id="book">
        <!-- 搜索框 -->
        <div class="book_cond">
            <form class="form-inline" action="${pageContext.request.contextPath}/indexServlet" method="get">
                <div class="form-group">
                    <input type="text" name="search" class="form-control" id="exampleInputName2">
                </div>
                <button type="submit" class="btn btn-default" id="submit_search">查 询</button>
            </form>
        </div>
        <!-- 购物车最新信息 -->
        <div style="text-align: center">
            <c:if test="${empty sessionScope.cart}">
                <span></span>
                <div>
                    <span style="color: red">当前购物车为空</span>
                </div>
            </c:if>
            <c:if test="${not empty sessionScope.cart}">
                <span>您的购物车中有${sessionScope.cart.totalCount}件商品</span>
                <div>
                    您刚刚将<span style="color: red">${sessionScope.lastName}</span>加入到了购物车中
                </div>
            </c:if>
        </div>
        <!-- 图书展示 -->
        <div class="page_one">
            <div class="xinxi clearfix">
                <div class="left">
                    <ul>
                        <c:forEach items="${bookPb.list}" var="book">
                            <li>
                                <div class="img">
                                    <img src="${pageContext.request.contextPath}/${book.img_path}"
                                         height="150px" alt="">
                                </div>
                                <div class="text1">
                                    <p>${book.name}</p>
                                    <br/>
                                    <p>
                                        <strong>作者：</strong><span>${book.author}</span>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <strong>销量：</strong>
                                        <span>${book.sales}</span>&nbsp;&nbsp;&nbsp;&nbsp; <strong>库存：</strong>
                                        <span>${book.stock}</span>
                                    </p>
                                    <p>
                                        <strong>简介：</strong><span>${book.brief}</span>
                                    </p>
                                </div>
                                <div class="price">
                                    <p class="price_num">
                                        <span>&yen;</span>
                                        <span>${book.price}</span>
                                    </p>
                                    <button type="button" class="btn addToCart" id="addCart" bookId="${book.id}">加入购物车
                                    </button>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                    <div class="page_num_inf">
                        <i></i> 共
                        <span>${bookPb.totalPage}</span>页<span>${bookPb.totalCount}</span>条
                    </div>
                    <div class="pageNum">
                        <ul>
                            <li>
                                <a href="${pageContext.request.contextPath}/indexServlet?currentPage=1&search=${sessionScope.search}">首页</a>
                            </li>
                            <li class="threeword">
                                <c:if test="${bookPb.currentPage <= 1}">
                                    <a href="${pageContext.request.contextPath}/indexServlet?currentPage=1&search=${sessionScope.search}">上一页</a>
                                </c:if>
                                <c:if test="${bookPb.currentPage > 1}">
                                    <a href="${pageContext.request.contextPath}/indexServlet?currentPage=${bookPb.currentPage-1}&search=${sessionScope.search}">上一页</a>
                                </c:if>
                            </li>

                            <c:forEach begin="1" end="${bookPb.totalPage}" var="i" step="1">
                                <c:if test="${bookPb.currentPage == i}">
                                    <li class="current">
                                        <a href="${pageContext.request.contextPath}/indexServlet?currentPage=${i}&search=${sessionScope.search}">${i}</a>
                                    </li>
                                </c:if>
                                <c:if test="${bookPb.currentPage != i}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/indexServlet?currentPage=${i}&search=${sessionScope.search}">${i}</a>
                                    </li>
                                </c:if>
                            </c:forEach>

                            <li class="threeword">
                                <c:if test="${bookPb.currentPage >= bookPb.totalPage}">
                                    <a href="${pageContext.request.contextPath}/indexServlet?currentPage=${bookPb.totalPage}&search=${sessionScope.search}">下一页</a>
                                </c:if>
                                <c:if test="${bookPb.currentPage < bookPb.totalPage}">
                                    <a href="${pageContext.request.contextPath}/indexServlet?currentPage=${bookPb.currentPage+1}&search=${sessionScope.search}">下一页</a>
                                </c:if>
                            </li>

                            <li class="threeword">
                                <a href="${pageContext.request.contextPath}/indexServlet?currentPage=${bookPb.totalPage}&search=${sessionScope.search}">末页</a>

                            </li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>

    </div>


</div>

</body>

</html>