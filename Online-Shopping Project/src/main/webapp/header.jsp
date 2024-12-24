<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/home-style.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

</head>
<header>
    <!--Header-->
    <br>
    <div class="topnav sticky">
    <%String email=session.getAttribute("email").toString();%>
   <h2>Online Shopping</h2>
   <div>
            <a ><%out.print(email);%> <i class='fas fa-plus-square'></i></a>
            <a href="home.jsp">Home<i class='fa fa-institution'></i></a>
            <a href="cart.jsp">My Cart  <i class='fas fa-cart-arrow-down'></i></a>
            <a href="order.jsp">My Orders <i class="fab fa-elementor"></i></a>
            <a href="changeDetail.jsp">Change Details <i class='fa fa-edit'></i></a>
            <a href="message.jsp">Message us <i class='fas fa-comment-alt'></i></a>
                        <a href="aboutus.jsp">About <i class='fas fa-address-book'></i></a>
            <a href="logout.jsp">Logout <i class='fas fa-share-square'></i></a>            
            <div class="search">
            <form action="searcHome.jsp">
            <input type="text" name="search" placeholder="Search">
            <button value="submit"><i class="fa fa-search"></i></button>
            </form>
            </div>
            </div>
          </div>
           <br>
           </header>
           </html>