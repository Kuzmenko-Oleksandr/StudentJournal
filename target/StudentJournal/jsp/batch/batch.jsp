<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%><%--
  Created by IntelliJ IDEA.
  User: alexander
  Date: 18.05.2020
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        body {
            background-image: url(/images/background.jpg); /* Путь к фоновому изображению */

        }
    </style>
    <link href="../../component/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="../../component/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">

    <title>ADD NEW GROUP</title>
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
                <a class="nav-link" href="/">Home </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../course/course.jsp" >ADD NEW ITEM</a>

            </li>
            <li class="nav-item">
                <a class="nav-link" href="../batch/batch.jsp">ADD NEW GROUP</a>
            </li>
            <li class="nav-item">
                <a class="nav-link " href="../student/student.jsp">ADD NEW STUDENT</a>
            </li>
            <li class="nav-item">
                <a class="nav-link " href="../studentjournal/studentjournal.jsp">Student journal</a>
            </li>
        </ul>
    </div>
</nav>

    <h1>ADD NEW GROUP</h1>
        <div class="row">
            <div class="col-sm-4">
                <form method="POST" align="left" action="add.jsp">
                    <div>
                        <label class="form-label">Group</label>
                        <input type="text" id="bname" name="bname" placeholder="Input group name" class="form-control" required>
                    </div>
                    <div>
                        <input type="submit"  name="submit" class="btn btn-info" value="submit" style="margin-top: 20px" >
                        <input type="reset" name="reset" class="btn btn-warning" value="reset" style="margin-top: 20px">
                    </div>
                </form>
            </div>
            <div class="col-sm-8">
                <div class="panel-body">
                    <table id="tbl-course" class="table table-bordered table-striped table-hover" >
                        <thead>
                            <tr>
                                <th>Group</th>
                                <th>Delete</th>
                            </tr>
                        <tbody>
                            <%
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;

                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspstudm","root","110022Sa");
                                String query = "select * from batch";
                                Statement st = con.createStatement();
                                rs = st.executeQuery(query);
                                while(rs.next())
                                {
                                    String id = rs.getString("id");



                            %>
                            <tr>
                                <td><%=rs.getString("batchname")  %></td>
                                <td><a href="batchdelete.jsp?id=<%=id %>">Delete</a> </td>
                            </tr>

                            <% } %>
                        </tbody>





                    </table>
                </div>
            </div>
        </div>

</body>
</html>
