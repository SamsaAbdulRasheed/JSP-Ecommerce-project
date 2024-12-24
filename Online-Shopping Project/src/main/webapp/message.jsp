<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ include file="header.jsp"  %>
            <%@ include file="footer.jsp"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/changedetail-style.css?v=1.1">
</head>
<body>


<div style="color: white; text-align: center; font-size: 20px; margin-top:-5px;">Message Us <i class='fas fa-comment-alt'></i></div>
<%String msg=request.getParameter("msg");

if("done".equals(msg)){%>
	<h4 class="alert">Message Successfully send</h4>
<%}
if("invalid".equals(msg)){%>
	<h4 class="alert"> Something went wrong ! Try again !</h4>
<%}%>
	
<div  class="container">
<form action="messageAction.jsp" method="post">
<textarea name="message" placeholder="Enter your Message" rows="7" cols="30" required>
</textarea>
<br>
<button class="btn">Submit</button> 
     </form>
      </div>
</body>
</html>