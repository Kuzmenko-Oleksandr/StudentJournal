
<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%
    String rollNum = request.getParameter("rollNum");
    String batch = request.getParameter("sjbatchname");
    String coursesname = request.getParameter("sjcoursesname");
    String data = request.getParameter("sdata");
    String point = request.getParameter("spoint");
    String spresence = request.getParameter("spresence");

    Connection con;
    PreparedStatement pst;
try{
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspstudm","root","110022Sa");
    pst = con.prepareStatement("insert  into studentjournal(rollNumber, batch, course, sdata, point, presence )values(?,?,?,?,?,?)");
    pst.setString(1, rollNum);
    pst.setString(2, batch);
    pst.setString(3, coursesname);
    pst.setString(4, data);
    pst.setString(5, point);
    pst.setString(6, spresence);
    pst.executeUpdate();
    response.sendRedirect("studentjournal.jsp");
}
catch (Exception e){

}

    System.out.println("Record add");

%>