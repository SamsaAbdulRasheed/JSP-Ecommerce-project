<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.prj.conn.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String email=session.getAttribute("email").toString();
String pid=request.getParameter("id");
String inde=request.getParameter("quantity");
int quantity=0;
int price=0;
int total=0;
try{
	Connection con=ConnectionProvider.getcon();
	Statement stmt= con.createStatement();
	ResultSet rs= stmt.executeQuery("select * from cart where email='"+email+"' and product_id='"+pid+"' ");
	while(rs.next()){
		quantity=rs.getInt(3);
		price=rs.getInt(4);
		total=rs.getInt(5);
	}
	if(quantity==1 && inde.equals("dec")){
		response.sendRedirect("cart.jsp?msg=notpossible");
	}
	else if(quantity !=1 && inde.equals("dec")){
		total=total-price;
		quantity=quantity-1;
		PreparedStatement stmt1= con.prepareStatement("UPDATE cart SET quantity=? , total=? WHERE email=? AND product_id=? ");
		stmt1.setInt(1, quantity);
		stmt1.setInt(2, total);
		stmt1.setString(3, email);
		stmt1.setString(4, pid);
		stmt1.executeUpdate();
        response.sendRedirect("cart.jsp");

	}
	else {
		total=total+price;
		quantity=quantity+1;
		PreparedStatement stmt1= con.prepareStatement("UPDATE cart SET quantity=? ,total=? WHERE email=? AND product_id=? ");
		stmt1.setInt(1, quantity);
		stmt1.setInt(2, total);
		stmt1.setString(3, email);
		stmt1.setString(4, pid);
		stmt1.executeUpdate();
		response.sendRedirect("cart.jsp");


	}
}
catch(Exception e){

}
%>
</body>
</html>