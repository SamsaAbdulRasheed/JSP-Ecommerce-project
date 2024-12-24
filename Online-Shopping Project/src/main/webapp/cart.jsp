<%@page import="java.sql.Statement"%>
<%@page import="com.prj.conn.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp"  %>
        <%@ include file="footer.jsp"  %>
        <%
        String emailid=session.getAttribute("email").toString();
        int total=0;
        int z=0;
        String id=request.getParameter("id");

        String msg=request.getParameter("msg");

                try{
                	Connection con=ConnectionProvider.getcon();
                	Statement stmt=con.createStatement();
        	ResultSet rs= stmt.executeQuery("select sum(total) from cart where email='"+emailid+"' and address is null"); 
        	while(rs.next()){
        		total=rs.getInt(1);
        	}
        		
                
        %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/addProduct-style.css">

</head>
<body>
<div style="color: white; text-align: center; font-size: 20px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>
<table style="margin-bottom:10px;">
<thead>
<tr>
<th>Product id</th>
<th>Product name</th>
<th>quantity</th>
<th>Price</th>
<th>Sub Total</th>
<th> Order</th>
</tr>
</thead>
<tbody>
<tr>
<%
if("not".equals(msg)){%>
<h4 class="alert">something went wrong! </h4>
<%}
if("ordered".equals(msg)){%>
<h4 class="alert">Ordered</h4>
<%}
if("notpossible".equals(msg)){%>
	<h4 class="alert">There is only one quantity ! So click on remove</h4>
<%}

	ResultSet rs1 = stmt.executeQuery("select * from product inner join cart on id=cart.product_id and email='"+emailid+"'  and address is null  ");
	while(rs1.next()){
	z=1;
	%>
		<td><%=rs1.getString(1) %></td>
		<td><%=rs1.getString(2) %></td>
		<td><a href="increment.jsp?id=<%= rs1.getString(1)%>&quantity=inc"><i class="fa-sharp fa-solid fa-circle-plus"></i> </a> <%=rs1.getString(8) %> <a href="increment.jsp?id=<%=rs1.getString(1)%>&quantity=dec"><i class="fa-sharp fa-solid fa-circle-minus"></i></a></td>
		</td>
		<td><%=rs1.getString(4) %></td>
		<td><%=rs1.getString(10) %></td>				 							
		<td><a href="remove.jsp?pid=<%= rs1.getString(1)%>"> Remove <i class="fa-solid fa-trash"></i></a></td>
		</tr>
	<% }
}
catch(Exception e){
	
}
%>
</tbody>
</table>
	<h4 style="padding-top:5px;">Total price: <%out.println(total); %></h4>
	<form action="address.jsp">
<button class="btn" style="margin-bottom: 70px;"> Order</button>
</form>
</body>
</html>