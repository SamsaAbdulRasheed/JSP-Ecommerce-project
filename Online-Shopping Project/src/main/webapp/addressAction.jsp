<%@page import="java.sql.PreparedStatement"%>
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
String email = session.getAttribute("email").toString();
String address = request.getParameter("Address");
String city = request.getParameter("City");
String state = request.getParameter("State");
String country = request.getParameter("Country");
String payment = request.getParameter("payment");
String status ="processing";
String number = request.getParameter("number");

try {
    Connection con = ConnectionProvider.getcon();
    PreparedStatement stmt1 = con.prepareStatement("UPDATE user SET address=?, city=?, state=?, country=? WHERE email=?");
    stmt1.setString(1, address);
    stmt1.setString(2, city);
    stmt1.setString(3, state);
    stmt1.setString(4, country);
    stmt1.setString(5, email);  
    stmt1.executeUpdate();
    
    PreparedStatement stmt = con.prepareStatement(
    	    "UPDATE cart SET address=?, city=?, state=?, country=?, mobilenumber=?, orderdate=NOW(), " +
    	    "deliverydate=DATE_ADD(orderdate, INTERVAL 7 DAY), paymentmethode=?, status=? " +
    	    "WHERE email=? AND address IS NULL"
    	);
    	stmt.setString(1, address);
    	stmt.setString(2, city);
    	stmt.setString(3, state);
    	stmt.setString(4, country);
    	stmt.setString(5, number);
    	stmt.setString(6, payment);  
    	stmt.setString(7, status);
    	stmt.setString(8, email);


    stmt.executeUpdate();
    response.sendRedirect("cart.jsp?msg=ordered");
} catch (Exception e) {
    response.sendRedirect("cart.jsp?msg=not");
}
%>
</body>
</html>