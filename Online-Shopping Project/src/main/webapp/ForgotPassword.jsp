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
    <form  action="ForgotPasswordAction.jsp"  method="post">
      <input type="email" name="email" placeholder="Enter  Email" required>
      <input type="number" name="mobile" placeholder="Enter  Mobile Number" required>
      <select name="securityQustion">
      <option value="What was you first car ?">What was you first car ?</option>
      <option value="what is the name of your pet ?">what is the name of your pet ?</option>
      <option value="what elementry school did you attend ?">what elementary school did you attend ?</option>
      <option  value="what is the name of the town where you born ?">what is the name of the town where you born ?</option>
      </select>
      <input type="text" name="answer" placeholder="Enter Answer" required>
      <input type="password" name="pwd" placeholder="Enter Your New Password" required>
      <input type="submit" value="save">
      </form>
            <h2><a href="Login.jsp">Login</a></h2>
      
  </div>
<div class='whyforgotPassword'>
  
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{ %>
<h1>Password Successfully Registered</h1>
<% } %>
<% if("invalid".equals(msg)){%>
	<h1>Some thing Went Wrong! Try Again ! </h1>
<%  } %>
    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>
</body>
</html>