<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.prj.conn.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
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

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

</head>
<body>
<div style="color: white; text-align: center; font-size: 20px; padding-botom:10px;">All Products & Edit Products <i class='fab fa-elementor'></i></div>
<%String msg=request.getParameter("msg");

if("done".equals(msg)){%>
	<h4 class="alert">Product Successfully Updated!</h4>
<%}
if("invalid".equals(msg)){%>
	<h4 class="alert">Some thing went wrong! Try again!</h4>
<%}
%>
<div class="table-container">
<table>
<thead>
<tr>
<th>id</th>
<th>Product</th>
<th>category</th>
<th>price</th>
<th> active </th>
<th> edit </th>
</tr>
</thead>
<tbody>
<tr>
<%
try{
	Connection con=ConnectionProvider.getcon();
	Statement stmt=con.createStatement();
	ResultSet rs= stmt.executeQuery("select * from product");
	while(rs.next()){%>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><i class="fa fa-inr"></i> <%=rs.getString(4) %></td>
		<td><%=rs.getString(5)%></td>
		<td><a href="editProduct.jsp?id=<%=rs.getString(1) %>"><i class="fas fa-pen-fancy"></i> Edit</a></td>
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