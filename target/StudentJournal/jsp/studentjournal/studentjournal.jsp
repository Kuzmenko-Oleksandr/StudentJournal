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
            background-image: url(/images/background.jpg); /* Путь к фоновому изображению */

        }
    </style>
    <link href="../../component/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="../../component/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">

    <title>Title</title>
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
                        <label class="form-label"> Student number </label>
                        <select name = "rollNum" id="rollNum" class="form-control" placeholder="Student number for search" required>
                            <%


                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspstudm","root","110022Sa");
                                String query = "select * from student";
                                Statement st = con.createStatement();
                                rs = st.executeQuery(query);
                                while (rs.next())
                                {
                                    String id = rs.getString("id");
                                    String rollNum = rs.getString("rollNo");
                            %>
                            <option value="<%=id %>"><%=rollNum %></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <label class="form-label"> Item name </label>
                    <select name = "sjcoursesname" id="sjcoursesname" class="form-control" placeholder="Item name" required>
                        <%


                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspstudm","root","110022Sa");
                            String query2 = "select * from course";
                            Statement st2 = con.createStatement();
                            rs = st.executeQuery(query2);
                            while (rs.next())
                            {
                                String id = rs.getString("id");
                                String sjcoursesname = rs.getString("coursesname");
                        %>
                        <option value="<%=id %>"><%=sjcoursesname %></option>
                        <%
                            }
                        %>
                    </select>
                    <div>
                        <label class="form-label"> Group </label>
                        <select name = "sjbatchname" id="sjbatchname" class="form-control">
                            <%


                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspstudm","root","110022Sa");
                                String query1 = "select * from batch";
                                Statement st1 = con.createStatement();
                                rs = st.executeQuery(query1);
                                while (rs.next())
                                {
                                    String id = rs.getString("id");
                                    String sjbatchname = rs.getString("batchname");
                            %>
                            <option value="<%=id %>"><%=sjbatchname %></option>
                            <%
                                }
                            %>

                        </select>
                    </div>
                    <div>
                        <label class="form-label">Date of day</label>
                        <input type="date" id="sdata" name="sdata" placeholder="Data" class="form-control" required>
                    </div>
                    <div>
                        <label class="form-label">Point</label>
                        <input type="text" id="spoint" name="spoint" placeholder="Point" class="form-control" required>
                    </div>
                    <div>
                        <label class="form-label">Presence or Absent</label>
                        <input type="text" id="spresence" name="spresence" placeholder="Presence" class="form-control" required>
                    </div>

                    <div>
                        <input type="submit" name="submit" class="btn btn-info" value="submit" style="margin-top: 20px">
                        <input type="reset" name="reset" class="btn btn-warning" value="reset" style="margin-top: 20px">
                    </div>
                </form>
            </div>
            <div class="col-sm-8">
                <div class="panel-body">
                    <table id="tbl-course" class="table table-bordered table-striped table-hover">
                        <thead>
                            <tr>

                                <th>Student number for search</th>
                                <th>Group</th>
                                <th>Item name</th>
                                <th>Date of day</th>
                                <th>Points</th>
                                <th>Presence or Absent</th>
                                <th>Delete</th>
                            </tr>
                        <tbody>
                            <%


                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspstudm","root","110022Sa");
                                String query3 = "select sj.id, s.rollNo, b.batchname, c.coursesname, sj.sdata, sj.point, sj.presence from studentjournal sj JOIN student s ON sj.rollNumber =s.id JOIN batch b ON sj.batch =b.id JOIN course c ON sj.course =c.id ";
                                Statement st3 = con.createStatement();
                                rs = st.executeQuery(query3);
                                while(rs.next())
                                {
                                    String id = rs.getString("sj.id");



                            %>
                            <tr>
                                <td><%=rs.getString("s.rollNo")  %></td>
                                <td><%= rs.getString("b.batchname") %></td>
                                <td><%=rs.getString("c.coursesname")  %></td>
                                <td><%= rs.getString("sj.sdata") %></td>
                                <td><%=rs.getString("sj.point")  %></td>
                                <td><%=rs.getString("sj.presence")  %></td>

                                <td><a href="studentjournaldelete.jsp?id=<%=id %>">Delete</a> </td>
                            </tr>
                            <%}%>


                        </tbody>





                    </table>
                </div>
            </div>
        </div>

</body>
</html>
