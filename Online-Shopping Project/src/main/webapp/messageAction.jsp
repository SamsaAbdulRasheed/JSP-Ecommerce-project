<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.prj.conn.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String email=session.getAttribute("email").toString();
String message=request.getParameter("message");
try{
	Connection con=ConnectionProvider.getcon();
PreparedStatement stmt=con.prepareStatement("insert into message values(?,?)");
stmt.setString(1, email);
stmt.setString(2, message);
stmt.executeUpdate();
response.sendRedirect("message.jsp?msg=done");
}
catch(Exception e){
	response.sendRedirect("message.jsp?msg=invalid");

}
%>