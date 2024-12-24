<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.prj.conn.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="adminHeader.jsp"  %>
        <%@ include file="../footer.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/addProduct-style.css?v=1.1">
</head>
<body>
<div style="color: white; text-align: center; font-size: 20px; padding-bottom:10px;">Add New Product  <i class='fas fa-plus-square'></i></div>

<%
String msg=request.getParameter("msg");
if("valid".equals(msg)){%>
	<h4>Product Added Successfully</h4>
<%} %>
<% 
if("invalid".equals(msg)){%>
<h4>Something went wrong ! try again </h4>
<%} %>
<%

int id=1;
try{
	Connection con=ConnectionProvider.getcon();
	Statement stmt=con.createStatement();
	ResultSet rs= stmt.executeQuery("select max(id) from product");
	while(rs.next()){
		id=rs.getInt(1);
		id=id+1;
	}
}
	catch(Exception e){
	
}

%>
<h4>Product Id :<%out.println(id); %></h4>
<form  action="addNewProductAction.jsp" method="post">
<input  type="hidden"  name="id" value="<%out.println(id); %>">
<div class="left-div">
<h3>Enter Name</h3>
<input class="input-style"  type="text" name="name" placeholder="Enter Product Name" required>
<hr>
</div>
<div class="right-div">
<h3>Enter Category</h3>
<input class="input-style"  type="text" name="category" placeholder="EnterCategory" required>
<hr>
</div>
<div class="left-div">
<h3>Enter Price</h3>
<input class="input-style"   type="text" name="price" placeholder="Enter Price" required>
<hr>
</div>
<div class="right-div">
<h3>Active</h3>
<select class="input-style" name="Active">
<option value="yes">yes</option>
<option value="No">No</option>
</select>
<hr>
</div>
<div class="button">
<button class="btn"> save<i class='far fa-arrow-alt-circle-right'></i></button>
</div>
</form>
</body>
</html>