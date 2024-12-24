<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.prj.conn.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String email=session.getAttribute("email").toString();
String address=request.getParameter("address");
String city=request.getParameter("city");
String state=request.getParameter("state");
String country=request.getParameter("country");
String number=request.getParameter("number");

try{
	Connection con=ConnectionProvider.getcon();
	PreparedStatement stmt=con.prepareStatement("update user set mobilenumber=? ,address=?, city=?, state=?,country=? where email=?");

	stmt.setString(1, number);
	stmt.setString(2, address);
	stmt.setString(3, city);
	stmt.setString(4, state);
	stmt.setString(5,country );
	stmt.setString(6, email);
stmt.executeUpdate();
response.sendRedirect("changedetails.jsp?msg=updated");
	
}
catch(Exception e){
	response.sendRedirect("changedetails.jsp?msg=not");

}
%>