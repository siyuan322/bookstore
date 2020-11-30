<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>编辑图书</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/boot.css">
    <script src="${pageContext.request.contextPath}/static/script/jquery-1.7.2.js"></script>

    <style type="text/css">
        h1 {
            text-align: center;
            margin-top: 200px;
        }

        h1 a {
            color: red;
        }

        input {
            text-align: center;
        }

        #edit {
            width: 1200px;
            margin: auto;
            border-top: 1px solid #ff2832;
        }

        .form-control {
            width: 350px;
        }

        .book_edit {
            width: 500px;
            margin: auto;
            margin-top: 20px;
        }

        #submit_book {
            width: 300px;
            margin-left: 20px;
            font: normal 16px "Microsoft Yahei";
            color: #fff;
            background-color: #ff2832;
        }
    </style>
</head>

<body>
<!-- 头部 -->
<jsp:include page="/pages/common/adminHeader.jsp"></jsp:include>

<!-- 头部 -->

<div id="edit">
    <div class="book_edit">
        <form class="form-horizontal" action="${pageContext.request.contextPath}/book/editBookServlet" method="post">
            <div class="form-group">
                <label for="inputEmail" class="col-sm-2 control-label">图书编号</label>
                <div class="col-sm-10">
                    <input name="id" type="text" class="form-control" id="inputEmail" value="${editBook.id}"
                           readonly="readonly">
                </div>
            </div>
            <div class=" form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">名称</label>
                <div class="col-sm-10">
                    <input name="name" type="text" class="form-control" id="inputEmail3" value="${editBook.name}">
                </div>
            </div>
            <div class=" form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">价格</label>
                <div class="col-sm-10">
                    <input name="price" type="text" class="form-control" id="inputPassword3"
                           value="${editBook.price}">
                </div>
            </div>
            <div class=" form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">作者</label>
                <div class="col-sm-10">
                    <input name="author" type="text" class="form-control" id="inputPassword4"
                           value="${editBook.author}">
                </div>
            </div>
            <div class=" form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">库存</label>
                <div class="col-sm-10">
                    <input name="stock" type="text" class="form-control" id="inputPassword5"
                           value="${editBook.stock}">
                </div>
            </div>

            <div class=" form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">摘要</label>
                <div class="col-sm-10">
                    <textarea name="brief" class="form-control" rows="3">${editBook.brief}</textarea>
                </div>
            </div>
            <div class=" form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button class="btn btn-default" id="submit_book" type="submit">修 改 图 书
                    </button>
                </div>
            </div>
        </form>
    </div>


</div>

</body>

</html>