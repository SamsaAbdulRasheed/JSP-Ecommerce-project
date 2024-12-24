<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.Statement"%>
<%@page import="com.prj.conn.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
    <%@ include file="adminHeader.jsp"  %>
        <%@ include file="../footer.jsp"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/addProduct-style.css">

</head>
<body>
<div style="color: white; text-align: center; font-size: 20px; padding-bottom:5px;">Messages Received<i class='fas fa-comment-alt'></i></div>
<div class="table-container">
<table style="margin-bottom:10px;">
<thead>
<tr>
<th>email</th>
<th>Message</th>

</tr>
</thead>
<tbody>
<tr>
<%
String email=session.getAttribute("email").toString();
try{
	Connection con=ConnectionProvider.getcon();
	Statement stmt=con.createStatement();
	ResultSet rs = stmt.executeQuery("select * from message  ");
	while(rs.next()){
	%>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		
		</tr>
	<% }
}
catch(Exception e){
	
}
%>
</tbody>
</table>
</div>
</body>
</html>