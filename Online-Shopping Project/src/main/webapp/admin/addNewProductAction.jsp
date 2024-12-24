<%@page import="com.prj.conn.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id=request.getParameter("id");

String name=request.getParameter("name");
String cat=request.getParameter("category");
String p=request.getParameter("price");
String active=request.getParameter("Active");

try{
	Connection con=ConnectionProvider.getcon();
	PreparedStatement stmt = con.prepareStatement("insert into product (id,name,category,price,active)  values('"+id+"' ,'"+name+"','"+cat+"','"+p+"','"+active+"' )");
	stmt.executeUpdate();
	response.sendRedirect("addNewProduct.jsp?msg=valid");
}
catch(Exception e){
	 e.printStackTrace(); 
	response.sendRedirect("addNewProduct.jsp?msg=invalid");
}
%>
