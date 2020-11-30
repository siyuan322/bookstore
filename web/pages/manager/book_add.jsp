<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>新增图书</title>
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
    <!-- <h5 class="little_title">新增图书</h5> -->
    <div class="book_edit">
        <form class="form-horizontal" action="${pageContext.request.contextPath}/book/addBookServlet" method="post"
              enctype="multipart/form-data">
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">名称</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputEmail3" name="name">
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">价格</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputPassword2" name="price">
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">作者</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputPassword4" name="author">
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">销量</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputPassword5" name="sales">
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">库存</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputPassword6" name="stock">
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">封面</label>
                <div class="col-sm-10">
                    <input type="file" class="form-control" id="inputPassword3" name="img_path">
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">摘要</label>
                <div class="col-sm-10">
                    <textarea class="form-control" rows="2" name="brief"></textarea>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button class="btn btn-default" id="submit_book" type="submit">新 增 图 书</button>
                </div>
            </div>
        </form>
    </div>

</div>


</body>

</html>