<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.prj.conn.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
try{
	String pid=request.getParameter("pid");
	String email=request.getParameter("email");
	String date=request.getParameter("date");

	Connection con=ConnectionProvider.getcon();
	PreparedStatement stmt= con.prepareStatement("update cart set status='Delivered' where email=?   and product_id=? and  orderdate=? and   address is not null");
    stmt.setString(1, email);
    stmt.setString(2, pid);
    stmt.setString(3, date);
	stmt.executeUpdate();
	response.sendRedirect("ordersreceived.jsp?msg=delivered");

}
catch(Exception e){
	response.sendRedirect("ordersreceived.jsp?msg=invalid");

}
%>