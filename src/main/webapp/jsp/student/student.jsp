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
<%
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        body {
            background-image: url(/images/background.jpg);

        }
    </style>
    <link href="../../component/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="../../component/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">

    <title>ADD NEW STUDENT</title>
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

    <h1>Student Registration</h1>
        <div class="row">
            <div class="col-sm-4">
                <form method="POST" align="left" action="add.jsp">
                    <div>
                        <label class="form-label">Student Name</label>
                        <input type="text" id="sname" name="sname" placeholder="Student Name" class="form-control" required>
                    </div>
                    <div>
                        <label class="form-label"> Number for search </label>
                        <input name = "rollN" id="rollN" class="form-control" placeholder="Input number for search" required>
                    </div>
                    <div>
                        <label class="form-label"> Group </label>
                        <select name = "batch" id="batch" class="form-control">
                            <%


                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspstudm","root","110022Sa");
                                String query = "select * from batch";
                                Statement st = con.createStatement();
                                rs = st.executeQuery(query);
                                while (rs.next())
                                {
                                    String id = rs.getString("id");
                                    String batchname = rs.getString("batchname");
                            %>
                            <option value="<%=id %>"><%=batchname %></option>
                            <%
                                }
                            %>

                        </select>
                    </div>
                    <div>
                        <label class="form-label">Address</label>
                        <input type="text" id="adress" name="adress" placeholder="Input student address" class="form-control" required>
                    </div>
                    <div>
                        <label class="form-label">Phone number</label>
                        <input type="text" id="phone" name="phone" placeholder="Input student phone number" class="form-control" required>
                    </div>

                    <div>
                        <input type="submit"  name="submit" class="btn btn-info" value="submit" style="margin-top: 20px" >
                        <input type="reset" name="reset" class="btn btn-warning" value="reset" style="margin-top: 20px">
                    </div>
                </form>
            </div>
            <div class="col-sm-8">
                <div class="panel-body">
                    <table id="tbl-course" class="table table-bordered table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Student name</th>
                                <th>Number for search</th>
                                <th>Group</th>
                                <th>Student address</th>
                                <th>Phone number</th>
                                <th>Edit</th>

                            </tr>
                        <tbody>
                            <%


                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspstudm","root","110022Sa");
                                String query1 = "select s.id, s.studname,s.rollNo, b.batchname, s.adress, s.phone from student s JOIN batch b ON s.batch = b.id";
                                Statement st1 = con.createStatement();
                                rs = st.executeQuery(query1);
                                while(rs.next())
                                {
                                    String id = rs.getString("s.id");



                            %>
                            <tr>
                                <td><%=rs.getString("s.studname")  %></td>
                                <td><%= rs.getString("s.rollNo") %></td>
                                <td><%=rs.getString("b.batchname")  %></td>
                                <td><%= rs.getString("s.adress") %></td>
                                <td><%=rs.getString("s.phone")%></td>
                                <td><a href="studentdelete.jsp?id=<%=id %>">Delete</a> </td>
                            </tr>
                            <%}%>


                        </tbody>





                    </table>
                </div>
            </div>
        </div>

</body>
</html>
