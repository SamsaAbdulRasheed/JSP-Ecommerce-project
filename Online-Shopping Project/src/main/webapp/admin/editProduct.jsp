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
<link rel="stylesheet" href="../css/addProduct-style.css">
</head>
<body>
 <a  class="nav" href="allProductEditProduct.jsp" style="color:white;"> <i class="fas fa-arrow-circle-left"> Back</i> </a>
<%

	String id=request.getParameter("id");
	Connection con=ConnectionProvider.getcon();
	Statement stmt=con.createStatement();
	ResultSet rs= stmt.executeQuery("select * from product where id='"+id+"' ");
	while(rs.next()){

		%>
<form action="editProductAction.jsp" method="post">
<input  type="hidden"  name="id" value="<%=rs.getString(1)%>">
<div class="left-div">
<h3>Enter Name</h3>
<input class="input-style"  type="text" value="<%=rs.getString(2)%>" name="name" placeholder="Enter Product Name" required>
<hr>
</div>
<div class="right-div">
<h3>Enter Category</h3>
<input class="input-style"  type="text" name="category" value="<%=rs.getString(3)%>" placeholder="EnterCategory" required>
<hr>
</div>
<div class="left-div">
<h3>Enter Price</h3>
<input class="input-style"   type="text" name="price"value="<%=rs.getString(4)%>" placeholder="Enter Price" required>
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
<button class="btn" > save<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
<%} %>
</body>
</html>