
<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%
    String batchname = request.getParameter("bname");


    Connection con;
    PreparedStatement pst;
try{
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspstudm","root","110022Sa");
    pst = con.prepareStatement("insert  into batch(batchname)values(?)");
    pst.setString(1, batchname);
    pst.executeUpdate();
    response.sendRedirect("batch.jsp");
    }
    catch (Exception e){

    }

    System.out.println("Record add");

%>