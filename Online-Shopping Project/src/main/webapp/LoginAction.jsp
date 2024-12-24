<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.prj.conn.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String email=request.getParameter("email");
String pwd=request.getParameter("pwd");
if("admin@inmkes.com".equals(email) && "admin".equals(pwd)){
	session.setAttribute("email", email);
	response.sendRedirect("admin/adminhome.jsp");
}
else{
	int z=0;
	try{
		 Connection con=ConnectionProvider.getcon();
		 Statement stmt= con.createStatement();
		ResultSet rs= stmt.executeQuery("select * from user where email='"+email+ "'  &&  password='"+pwd+"' ");
		while(rs.next()){
			
			z=1;
			session.setAttribute("email", email);
			response.sendRedirect("home.jsp");
		}
		if(z==0){
			response.sendRedirect("Login.jsp?msg=notExist");
		}
	}
	catch(Exception e){
		response.sendRedirect("Login.jsp?msg=Invalid");

	}
}

	
	
	 

%>