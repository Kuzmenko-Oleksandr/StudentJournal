
<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%
    String studentname = request.getParameter("sname");
    String rollNum = request.getParameter("rollN");
    String batch = request.getParameter("batch");
    String adress = request.getParameter("adress");
    String phone = request.getParameter("phone");

    Connection con;
    PreparedStatement pst;
try{
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspstudm","root","110022Sa");
    pst = con.prepareStatement("insert  into student(studname,rollNo, batch, adress, phone)values(?,?,?,?,?)");
    pst.setString(1, studentname);
    pst.setString(2, rollNum);
    pst.setString(3, batch);
    pst.setString(4, adress);
    pst.setString(5, phone);
    pst.executeUpdate();
    response.sendRedirect("student.jsp");
    }
    catch (Exception e){

    }

    System.out.println("Record add");

%>