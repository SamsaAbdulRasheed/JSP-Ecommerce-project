<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.prj.conn.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ include file="header.jsp"  %>
            <%@ include file="footer.jsp"  %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/addProduct-style.css">
<style type="text/css">
</style>
</head>



<body>
<div style="color: white; text-align: center; font-size: 20px;">Home <i class='fa fa-institution'></i></div>
<%String msg=request.getParameter("msg");

if("added".equals(msg)){%>
	<h4 class="alert">Product Added to Cart</h4>
<%}
if("exist".equals(msg)){%>
	<h4 class="alert"> Product already exists in cart ! Quantity increased !</h4>
<%}%>
<% 
if("invalid".equals(msg)){%>
<h4 class="alert"> Something went wrong ! Try again !</h4>
<% }%>
<div class="table-container">
<table>
<thead>
<tr>
<th>id</th>
<th>Product</th>
<th>category</th>
<th>price</th>
<th> Add To Cart </th>
</tr>
</thead>
<tbody>
<tr>
<%
try{
	Connection con=ConnectionProvider.getcon();
	Statement stmt=con.createStatement();
	ResultSet rs= stmt.executeQuery("select * from product where active='yes' ");
	while(rs.next()){%>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><i class="fa fa-inr"></i> <%=rs.getString(4) %></td>
		<td><a href="addcart.jsp?id=<%=rs.getString(1)%>"> Add to Cart <i class="fas fa-cart-plus"></i></a></td>
		</tr>
	<% }
}
catch(Exception e){

}%>

</tbody>
</table>
</div>
</body>
</html>