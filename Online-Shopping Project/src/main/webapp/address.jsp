<%@page import="com.mysql.cj.xdevapi.Table"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.prj.conn.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ include file="header.jsp"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/addProduct-style.css">

</head>
<body>
<%
String emailid=session.getAttribute("email").toString();
String pid=request.getParameter("pid");
String quantity="";
String price="";
String total="";

String msg=request.getParameter("msg");
if("valid".equals(msg)){%>
	<h4>Product Added Successfully</h4>
<%} %>
<% 
if("invalid".equals(msg)){%>
<h4>Something went wrong ! try again </h4>
<%} %>
<table style="margin-bottom:10px;">
<thead>
<tr>
<th>Product id</th>
<th>Product name</th>
<th>quantity</th>
<th>Price</th>
<th>Sub Total</th>
</tr>
</thead>
<tbody>
<tr>
<%


try{
Connection con=ConnectionProvider.getcon();
Statement stmt=con.createStatement();
	ResultSet rs1 = stmt.executeQuery("select * from product inner join cart on id=cart.product_id and email='"+emailid+"' where address is null ");
	while(rs1.next()){
	%>
		<td><%=rs1.getString(1)%></td>
				<td><%=rs1.getString(2)%></td>
		
		<td><%=rs1.getString(8)%></td>
				<td><%=rs1.getString(9)%></td>	
								<td><%=rs1.getString(10)%></td>				 							
							 							
 </tr>
<%}%>
</tbody>
</table>
<form action="addressAction.jsp" method="post">
<%

	ResultSet rs = stmt.executeQuery("select * from user where email='"+emailid+"'  ");
while(rs.next()){
	
	%>
<div class="left-div">
<h3>Enter Address</h3>
<input class="input-style" value="<%=rs.getString(7)%>"  type="text" name="Address" placeholder="Enter Address" required>
<hr>
</div>
<div class="right-div">
<h3>Enter City</h3>
<input class="input-style"  value="<%=rs.getString(8)%>" type="text" name="City" placeholder="Enter City" required>
<hr>
</div>
<div class="left-div">
<h3>Enter State</h3>
<input class="input-style" value="<%=rs.getString(9)%>"   type="text" name="State" placeholder="Enter State" required>
<hr>
</div>
<div class="right-div">
<h3>Enter Country</h3>
<input class="input-style" value="<%=rs.getString(10)%>"    type="text" name="Country" placeholder="Enter Country" required>
<hr>
</div>

<hr style="width:100%;">
<div class="left-div">
<h3>Enter Payment Method</h3>
<select name="payment" class="input-style" >
<option>cash On Delivery</option>
<option>Online Payment</option>
</select> 
<hr>
</div>

<div class="right-div">
<h3>Enter Mobile Number</h3>
<input class="input-style"   type="text"  value="<%=rs.getString(3)%>" name="number" placeholder="Enter Mobile Number" required>
<hr>
</div>
<h3>Fill Form Correctly </h3>
<button class="btn">submit</button>
<%
}
}
catch(Exception e){
	
}
%>
</form>
</body>
</html>