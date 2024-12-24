<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.prj.conn.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ include file="header.jsp"%>
        <%@ include file="footer.jsp"%>
<%
String emailid=session.getAttribute("email").toString();
String id=request.getParameter("id");
int quantity=1;
int price=0;
int total=0;
int cart_total=0;
int z=0;
try{
	Connection con=ConnectionProvider.getcon();
	 Statement stmt= con.createStatement();	
	 ResultSet rs= stmt.executeQuery("select * from product where id='"+id+"' ");
	 while(rs.next()){
		 price=rs.getInt(4);
		 total=price;
	 }
	 ResultSet rs1= stmt.executeQuery("select * from cart where email='"+emailid+"' and product_id='"+id+"' and address is null");
	while(rs1.next()){
	 quantity=rs1.getInt(3);
	 quantity=quantity+1;
	 cart_total=rs1.getInt(5);
	total= cart_total+price;
	 z=1;
	}
	if(z==1){
		  stmt.executeUpdate("update cart set quantity='"+quantity+"' ,total='"+total+"' where email='"+emailid+"' and product_id='"+id+"' ");
		  response.sendRedirect("home.jsp?msg=exist");

	}
	if(z==0){
	PreparedStatement stmt1=con.prepareStatement("insert into cart  (email,product_id,quantity,price,total)  values(?,?,?,?,?)");
			stmt1.setString(1, emailid);
			stmt1.setString(2, id);
			stmt1.setInt (3, quantity);
			stmt1.setInt(4, price);
			stmt1.setInt(5, total);
			stmt1.executeUpdate();
	 response.sendRedirect("home.jsp?msg=added");

	
	}
}
catch(Exception e){
	  e.printStackTrace();
	 response.sendRedirect("home.jsp?msg=invalid");

}

%>