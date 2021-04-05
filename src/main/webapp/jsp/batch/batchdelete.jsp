<%--
  Created by IntelliJ IDEA.
  User: alexander
  Date: 19.05.2020
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%
    String batchid = request.getParameter("id");


    Connection con;
    PreparedStatement pst;
    try{
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspstudm","root","110022Sa");
    pst = con.prepareStatement("delete from batch where id =?");
    pst.setString(1, batchid);
    pst.executeUpdate();
        response.sendRedirect("batch.jsp");
    }
    catch (Exception e){

    }

    System.out.println("Record deleted");

%>

