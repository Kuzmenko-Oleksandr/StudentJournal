<%--
  Created by IntelliJ IDEA.
  User: alexander
  Date: 22.05.2020
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>

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



<h3> Student performance</h3>
<%--    <div class="col-md-6">--%>
<%--        <form action="" method="get">--%>
<%--            <input type="text" class="form-control" name="q" placeholder="Search..."/>--%>
<%--        </form>--%>
<%--    </div>--%>



<table id="tbl-course" class="table table-bordered table-striped table-hover">
    <thead>
    <tr>
        <th>Your number</th>
        <th>Your group name</th>
        <th>Item</th>
        <th>Date of day</th>
        <th>Points</th>
        <th>Presence or Absent</th>
        <th class="text-center"></th>
    </tr>
    </thead>
    <tbody>
    <%
        String host = "jdbc:mysql://localhost:3306/jspstudm";
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(host, "root", "110022Sa");
        st = conn.createStatement();
        String query = request.getParameter("q");
        String data ;
        if (query!=null) {
            data = "select sj.id, s.rollNo, b.batchname, c.coursesname, sj.sdata, sj.point, sj.presence from studentjournal sj JOIN student s ON sj.rollNumber =s.id JOIN batch b ON sj.batch =b.id JOIN course c ON sj.course =c.id where s.rollNo like '%" + query + "%' or b.batchname like '%" + query + "%' or c.coursesname like '%\"+query+\"%' ";
        }else {
            data = "select sj.id, s.rollNo, b.batchname, c.coursesname, sj.sdata, sj.point, sj.presence from studentjournal sj JOIN student s ON sj.rollNumber =s.id JOIN batch b ON sj.batch =b.id JOIN course c ON sj.course =c.id order by id desc ";
        }
        rs = st.executeQuery(data);
        while (rs.next()){
    %>
    <tr>
        <td><%=rs.getString("s.rollNo")  %></td>
        <td><%= rs.getString("b.batchname") %></td>
        <td><%=rs.getString("c.coursesname")  %></td>
        <td><%= rs.getString("sj.sdata") %></td>
        <td><%=rs.getString("sj.point")  %></td>
        <td><%=rs.getString("sj.presence")  %></td>
        <td class="text-center"></td>
    </tr>
    <%}%>
    </tbody>
</table>

</body>
</html>
