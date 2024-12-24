<%@page import="java.awt.Color"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/signup-style.css">
</head>
<body>
<div id='container'>
  <div class='signup'>
    <form  action="signupaction.jsp"  method="post">
      <input type="text" name="name" placeholder="Enter  Name" required>
      <input type="email" name="email" placeholder="Enter  Email" required>
      <input type="number" name="mobile" placeholder="Enter  Mobile Number" required>
      <select name="securityQustion">
      <option value="What was you first car ?">What was you first car ?</option>
      <option value="what is the name of your pet ?">what is the name of your pet ?</option>
      <option value="what elementry school did you attend ?">what elementary school did you attend ?</option>
      <option  value="what is the name of the town where you born ?">what is the name of the town where you born ?</option>
      </select>
      <input type="text" name="answer" placeholder="Enter Answer" required>
      <input type="password" name="pwd" placeholder="Enter Password" required>
      <input type="submit" value="signup">
      </form>
      <h2><a href="Login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
  
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{ %>
<h1  style="color: green;" >Successfully Registered</h1>
<% } %>
<% if("Invalid".equals(msg)){%>
	<h1>Some thing Went Wrong! Try Again ! </h1>
<%  } %>
    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>

</body>
</html>