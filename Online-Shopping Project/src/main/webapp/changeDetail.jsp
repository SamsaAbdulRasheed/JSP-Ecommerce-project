<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp"  %>
        <%@ include file="footer.jsp"  %>
         
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/changedetail-style.css?v=1.1">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String msg=request.getParameter("msg");

if("updated".equals(msg)){%>
<h4>Details Updated Successfully</h4>
<%}
if("not".equals(msg)){%>
<h4>something went wrong! try again !</h4>
<%}%>

<div style="color: white; text-align: center; font-size: 20px; padding-bottom:-10px; ">Change Details <i class='fa fa-institution'></i></div>
   
<div class="details">
<form action="changedetailAction.jsp" method="post">
<input type="text" name="address" placeholder="Enter your address">
<input type="text" name="city" placeholder="Enter your city">
<input type="text" name="state" placeholder="Enter your state">
<input type="text" name="country" placeholder="Enter your country">
<input type="text" name="number" placeholder="Enter your mobile Number">
      <input type="submit" value="submitt">

</form>
</div>

</body>
</html>