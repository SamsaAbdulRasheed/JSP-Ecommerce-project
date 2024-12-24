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
<link rel="stylesheet" href="css/addProduct-style.css">

<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

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
int z=0;
String search=request.getParameter("search");
try{
	Connection con=ConnectionProvider.getcon();
	Statement stmt=con.createStatement();
	ResultSet rs = stmt.executeQuery("select * from product where (name like '%"+search+"%' or category like '%"+search+"%') and active= 'yes' ");
	while(rs.next()){
	z=1;
	%>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><i class="fa fa-inr"></i> <%=rs.getString(4) %></td>
		<td><a href="addcart.jsp"> Add to Cart <i class="fas fa-cart-plus"></i></a></td>
		</tr>
	<% }

}
catch(Exception e){

}%>

</tbody>
</table>
<%
if(z==0){%>
<h1 style="color: white; text-align: center;"> Nothing to Show</h1>	
<%} %>

</body>
</html>