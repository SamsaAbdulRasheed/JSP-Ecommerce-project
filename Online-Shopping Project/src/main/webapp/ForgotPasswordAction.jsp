<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.prj.conn.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String email=request.getParameter("email");
String mobile=request.getParameter("mobile");
String SecurityQustion=request.getParameter("securityQustion");
String answer=request.getParameter("answer");
String password=request.getParameter("pwd");

int z=0;

try{
	Connection con=ConnectionProvider.getcon();
	 Statement stmt= con.createStatement();	
	 ResultSet rs= stmt.executeQuery("select * from user where email='" +email+ "'  and mobilenumber='" +mobile+ "'  and SecurityQustion='" +SecurityQustion+"'  and answer='" +answer+"' ");
	 while(rs.next()){
		 z=1;
		stmt.executeUpdate(" update user  set  password='" +password+ "'  where email='" +email+"'  ");
		response.sendRedirect("ForgotPassword.jsp?msg=done");
	 }
	 if(z==0){
			response.sendRedirect("ForgotPassword.jsp?msg=invalid");
	 }
}
catch(Exception e){
	e.printStackTrace();
}
 %>