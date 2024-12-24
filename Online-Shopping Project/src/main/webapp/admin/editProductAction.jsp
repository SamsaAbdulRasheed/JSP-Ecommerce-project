<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.prj.conn.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
try{
String id=request.getParameter("id");
String name=request.getParameter("name");
String category=request.getParameter("category");
String price=request.getParameter("price");
String Active=request.getParameter("Active");

Connection con=ConnectionProvider.getcon();
Statement stmt=con.createStatement();

int i=stmt.executeUpdate("update product set name='"+name+"',category='"+category+"',price='"+price+"', active='"+Active+"' where id='"+id+"' ");
if(Active.equals("no")){
	stmt.executeUpdate("delete from cart where id='"+id+"' and address isnull");
}
if(i>0){
	response.sendRedirect("allProductEditProduct.jsp?msg=done");
}
else{
	response.sendRedirect("allProductEditProduct.jsp?msg=invalid");

}
}
catch(Exception e){
	
}
%>