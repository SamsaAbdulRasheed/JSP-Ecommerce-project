<%@page import="java.sql.Date"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.prj.conn.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="adminHeader.jsp"  %>
            <%@ include file="../footer.jsp"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.prj.conn.ConnectionProvider"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/addProduct-style.css?v=1.1">
</head>
<body>
<div style="color: white; text-align: center; font-size: 20px; ">Cancel Order  <i class='fas fa-window-close'></i></div>

<div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>Email</th>
                    <th>Mobile Number</th>
			 		<th>Product Id</th>
                    <th>Product Name</th>
                    <th>Category</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Sub Total</th>
                    <th>Address</th>
                    <th>City</th>
                    <th>State</th>
                    <th>Country</th>
                    <th>Ordered Date</th>
                    <th>Expected Delivery Date</th>
                    <th>Payment Method</th>
					<th>Status</th>                                        
                    
                </tr>
            </thead>
            <tbody>
                <%
                try {
                    Connection con = ConnectionProvider.getcon();
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("select * from product inner join cart on id=cart.product_id  and status='cancel' ");
                    while (rs.next()) {
                %>
                <tr>
                                          <td><%=rs.getString(6)%></td>
                                          <td><%=rs.getString(15)%></td>
                                          <td><%=rs.getString(1)%></td>
                                          <td><%=rs.getString(2)%></td>
                                          <td><%=rs.getString(3)%></td>
                                          <td><%=rs.getString(8)%></td>
                                          <td><%=rs.getString(9)%></td>
                                          <td><%=rs.getString(10)%></td>
                                          <td><%=rs.getString(11)%></td>
                                          <td><%=rs.getString(12)%></td>
                                          <td><%=rs.getString(13)%></td>
                                          <td><%=rs.getString(14)%></td>
                                          <td><%=rs.getString(16)%></td>
                                          <td><%=rs.getString(17)%></td>
                                                                <td><%=rs.getString(18)%></td>
                                                                <td><%=rs.getString(19)%></td>
                      
                </tr>
                <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                %>
            </tbody>
        </table>
        </div>
</body>
</html>