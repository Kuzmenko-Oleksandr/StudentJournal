<%--<!--<%&#45;&#45;-->--%>
<%--<!--  Created by IntelliJ IDEA.-->--%>
<%--<!--  User: alexander-->--%>
<%--<!--  Date: 22.05.2020-->--%>
<%--<!--  Time: 21:52-->--%>
<%--<!--  To change this template use File | Settings | File Templates.-->--%>
<%--<!--&#45;&#45;%>-->--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="../../component/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="../../component/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <style>
        body {
            background-image: url(/images/background.jpg); /* Путь к фоновому изображению */

        }
    </style>
</head>
<body>
<div class="row">
    <div class="col-sm-4">
        <form method="POST" action="">
            <div align="left">
                <div>
                    <label class="form-label"> <h3>IF YOU TEACHER USE LOGIN AND PASSWORD</h3> </label>
                </div>
                <label class="form-label">Login</label>
                <input type="text" id="login" name="login" class="form-control" placeholder="login" size="30px" required>
            </div>
            <div align="left">
                <label class="form-label">Password</label>
                <input type="password" id="password" class="form-control" name="password" placeholder="Password" size="30px" required>
            </div>
            </br>

            <div align="left">
                <input type="submit" id="submit"  name="submit" value="submit" class="btn btn-info">
                <input type="reset" id="reset" name="reset" value="reset" class="btn btn-warning">
            </div>
        </form>
    </div>
    <div class="col-sm-4">
        <div>
            <label class="form-label"><h3>IF YOU STUDENT USE SEARCH</h3> </label>
        </div>
        <form method="post" action="/jsp/studentinfo/studentinfo.jsp">
            <div align="left">
                <center><img src="/images/result.png" width="100" height="100"></center>
                <center><input type="text" class="form-control" name="q" placeholder="Search..." style="width: auto; margin-top: 5px" required/></center>
                <center><input class="btn btn-info" type="submit" name="submit" value="submit" size="30px" style="margin-top: 20px" required></center>
            </div>
        </form>
    </div>
</div>

</body>
</html>
