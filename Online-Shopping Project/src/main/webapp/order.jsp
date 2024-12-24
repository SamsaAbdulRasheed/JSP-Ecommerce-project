<%@page import="java.sql.Date"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.prj.conn.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
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

</head>
<body>
<div style="color: white; text-align: center; font-size: 20px;">My Orders <i class="fab fa-elementor"></i></div>

<table style="margin-bottom:10px;">
<thead>
<tr>
<th>Product name</th>
<th>Category</th>
<th>Quantity</th>
<th>Price</th>
<th>Sub Total</th>
<th> Order Date</th>
<th> Delivery Date</th>
<th> Payment Method</th>
<th>Status</th>

</tr>
</thead>
<tbody>
<tr>
<%
String emailid=session.getAttribute("email").toString();

try{
	Connection con=ConnectionProvider.getcon();
	Statement stmt=con.createStatement();
	ResultSet rs= stmt.executeQuery("select * from product inner join cart on id=cart.product_id and email='"+emailid+"' and address is not null ");
	while(rs.next()){
	%>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(8) %></td>				 							
		<td><%=rs.getString(9) %></td>				 							
		<td><%=rs.getString(10) %></td>			
		<td><%=rs.getString(16) %></td>				 							
		<td><%=rs.getString(17) %></td>				 							
		<td><%=rs.getString(18) %></td>				 							
		<td><%=rs.getString(19) %></td>				 							
			 							
		</tr>
	<% }
}
catch(Exception e){
	
}
%>
</tbody>
</table>
</body>
</html>