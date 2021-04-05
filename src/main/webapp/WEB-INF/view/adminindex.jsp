<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: alexander
  Date: 22.05.2020
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <link href="../../component/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="../../component/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <style>
        body {
            background-image: url(/images/background.jpg); /* Путь к фоновому изображению */

        }
    </style>
    <title>STUDEN JOURNAL</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Journal</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../../jsp/course/course.jsp">ADD NEW ITEM</a>

            </li>
            <li class="nav-item">
                <a class="nav-link" href="../../jsp/batch/batch.jsp">ADD NEW GROUP</a>
            </li>
            <li class="nav-item">
                <a class="nav-link " href="../../jsp/student/student.jsp">ADD NEW STUDENT</a>
            </li>
            <li class="nav-item">
                <a class="nav-link " href="../../jsp/studentjournal/studentjournal.jsp">Student journal</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value='/logout'/>" >Logout</a>
            </li>
        </ul>
    </div>
</nav>
<h1>Welcome to STUDENT ONLINE SYSTEM</h1>
<img src="../images/student.png" alt=""/>
</body>
</html>

