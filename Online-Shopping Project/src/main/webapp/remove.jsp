<%@page import="javax.xml.crypto.dsig.spec.DigestMethodParameterSpec"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.prj.conn.ConnectionProvider"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
String email=session.getAttribute("email").toString();
String id=request.getParameter("pid");
try{
	Connection con=ConnectionProvider.getcon();
	PreparedStatement stmt=con.prepareStatement ("delete from cart where email='"+email+"' and product_id='"+id+"' ");
	stmt.executeUpdate();
	response.sendRedirect("cart.jsp");
}
catch(Exception e){
	
}
	 %>
</body>
</html>