
<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%
    String coursesname = request.getParameter("name");
    String duration = request.getParameter("duration");

    Connection con;
    PreparedStatement pst;
try{
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspstudm","root","110022Sa");
    pst = con.prepareStatement("insert  into course(coursesname,duration)values(?,?)");
    pst.setString(1, coursesname);
    pst.setString(2, duration);
    pst.executeUpdate();
    response.sendRedirect("course.jsp");
    }
    catch (Exception e){

    }

    System.out.println("Record add");

%>