<%-- 
    Document   : View
    Created on : Dec 28, 2021, 10:06:00 PM
    Author     : jingx
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.model.profile" %>
<% 
   profile user = (profile)session.getAttribute("user");
   String username = user.getName();
   String email = user.getEmail();
   String gender = user.getGender();
   String phone = user.getPhone();
   String address = user.getAddress();
   
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

		<!-- Bootstrap -->
		<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

		<!-- Slick -->
		<link type="text/css" rel="stylesheet" href="css/slick.css"/>
		<link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

		<!-- nouislider -->
		<link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

		<!-- Font Awesome Icon -->
		<link rel="stylesheet" href="css/font-awesome.min.css">

		<!-- Custom stlylesheet -->
		<link type="text/css" rel="stylesheet" href="css/style.css"/>
        
</head>
<body>
    <header>
        <!-- MAIN HEADER -->
        <div id="header">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- LOGO -->
                    <div class="col-md-3">
                        <div class="header-logo">
                            <a href="#" class="logo">
                                Seedvado
                            </a>
                        </div>
                    </div>
                    <!-- /LOGO -->

                    <!-- SEARCH BAR -->
                    <div class="col-md-6">
                        <div class="header-search">
                            <form>
                                <select class="input-select">
                                    <option value="0">All Categories</option>
                                    <option value="1">Category 01</option>
                                    <option value="1">Category 02</option>
                                </select>
                                <input class="input" placeholder="Search here">
                                <button class="search-btn">Search</button>
                            </form>
                        </div>
                    </div>
                    <!-- /SEARCH BAR -->

                    <!-- ACCOUNT -->
                    <div class="col-md-3 clearfix">
                        <div class="header-ctn">
                            <!-- Wishlist -->
                            <div>
                                <a href="#">
                                    <i class="fa fa-heart-o"></i>
                                    <span>Your Wishlist</span>
                                    <div class="qty">2</div>
                                </a>
                            </div>
                            <!-- /Wishlist -->

                            <!-- Cart -->
                            <div class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                    <i class="fa fa-shopping-cart"></i>
                                    <span>Your Cart</span>
                                    <div class="qty">3</div>
                                </a>
                                <div class="cart-dropdown">
                                    <div class="cart-list">
                                        <div class="product-widget">
                                            <div class="product-img">
                                                <img src="./img/product01.png" alt="">
                                            </div>
                                            <div class="product-body">
                                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                                <h4 class="product-price"><span class="qty">1x</span>$980.00</h4>
                                            </div>
                                            <button class="delete"><i class="fa fa-close"></i></button>
                                        </div>

                                        <div class="product-widget">
                                            <div class="product-img">
                                                <img src="./img/product02.png" alt="">
                                            </div>
                                            <div class="product-body">
                                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                                <h4 class="product-price"><span class="qty">3x</span>$980.00</h4>
                                            </div>
                                            <button class="delete"><i class="fa fa-close"></i></button>
                                        </div>
                                    </div>
                                    <div class="cart-summary">
                                        <small>3 Item(s) selected</small>
                                        <h5>SUBTOTAL: $2940.00</h5>
                                    </div>
                                    <div class="cart-btns">
                                        <a href="#">View Cart</a>
                                        <a href="#">Checkout  <i class="fa fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>
                            </div>
                            <!-- /Cart -->

                            <!-- Menu Toogle -->
                            <div class="menu-toggle">
                                <a href="#">
                                    <i class="fa fa-bars"></i>
                                    <span>Menu</span>
                                </a>
                            </div>
                            <!-- /Menu Toogle -->
                        </div>
                    </div>
                    <!-- /ACCOUNT -->
                </div>
                <!-- row -->
            </div>
            <!-- container -->
        </div>
        <!-- /MAIN HEADER -->
    </header>
    <!-- /HEADER --> 
    <!--/Side Bar Menu-->
    <div class="main-body">
        <div class="sidemenu">
            <div class="userheader">
                <div class="profilepic">
                    <img src="Image/profilepic.jpg" alt="">
                </div>
                <p>Yong Jing Xuan</p>
            </div>
           <div class="myprofile">
            <i class="fa fa-database" aria-hidden="true"></i>
            <p>My Profile</p>
           </div>
           <div class="myprofile">
            <i class="fa fa-credit-card-alt" aria-hidden="true"></i>
            <p>My Purchase</p>
           </div>
           <div class="myprofile">
            <i class="fa fa-envelope" aria-hidden="true"></i>
            <p>Notification</p>
           </div>
           <div class="myprofile">
            <i class="fa fa-diamond" aria-hidden="true"></i>
            <p>My Voucher</p>
           </div>
        </div>
        <!--/SideBar Menu-->
        <!--Showcasae-->
        <div class="showcase">
            <h1>My Profile</h1>
            <table class="userinfo">
                <tr>
                    <th>Name</th>
                    <td><% out.println(username); %></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><% out.println(email); %></td>
                </tr>
                <tr>
                    <th>Gender</th>
                    <td><% out.println(gender ); %></td>
                </tr>
                <tr>
                    <th>Phone</th>
                    <td><% out.println(phone); %></td>
                </tr>
                <tr>
                    <th>Address</th>
                    <td><% out.println(address); %></td>
                </tr>
            </table>
            <a href="#" class="btn btn-primary">Edit Profile</a>
        </div>
    </div>
    
</body>
</html>
