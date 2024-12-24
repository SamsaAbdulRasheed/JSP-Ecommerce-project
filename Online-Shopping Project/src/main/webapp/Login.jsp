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
<div id="container">
<div class="signup">
<form action="LoginAction.jsp" method="post">
<input type="email" name="email" placeholder="Enter Your Email" required>
<input type="password"  name="pwd" placeholder="Enter Password" required>
<input type="submit"  value="Login">
</form>
 <h2> <a href="signup.jsp">Sign UP</a></h2>
 <h2><a href="ForgotPassword.jsp">Forgot Password</a></h2>
 </div>
 <div class="whysignLogin">
<%
String msg=request.getParameter("msg");
if("notExist".equals(msg)){%>
	 <h1>Incorrect Username and Password</h1>
<% }
if("Invalid".equals(msg)){%>
	 	<h1>Some thing Went Wrong! Try Again ! </h1>
<%}
%>
 

   <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
</div>
</div>
</body>
</html>