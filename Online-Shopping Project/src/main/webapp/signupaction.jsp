<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.prj.conn.ConnectionProvider"%>
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
String name=request.getParameter("name");
String email=request.getParameter("email");
String mobile=request.getParameter("mobile");
String securityQustion=request.getParameter("securityQustion");
String answer=request.getParameter("answer");
String password=request.getParameter("pwd");
String address="";
String city="";
String state="";
String country="";

try{
	Connection con=ConnectionProvider.getcon();
	PreparedStatement stmt = con.prepareStatement("insert into user values(? , ? , ? , ? , ? , ? , ? , ? , ? , ? )");
	stmt.setString(1, name);
	stmt.setString(2, email);
	stmt.setString(3, mobile);
	stmt.setString(4, securityQustion);
	stmt.setString(5, answer);
	stmt.setString(6, password);
	stmt.setString(7, address);
	stmt.setString(8, city);
	stmt.setString(9, state);
	stmt.setString(10, country);
	stmt.executeUpdate();
	response.sendRedirect("signup.jsp?msg=valid");
}
catch(Exception e)
{ 
	response.sendRedirect("signup.jsp?msg=Invalid");
}
%>
</body>
</html>