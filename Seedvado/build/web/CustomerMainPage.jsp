<%-- 
    Document   : CustomerMainPage
    Created on : Jan 6, 2022, 11:48:40 PM
    Author     : User
--%>

<%@page import="com.model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Main Page</title>
    <style>
/*        .content123{
            margin: auto;
        }
        
        table{
            width: 50%;
        }
        
*/        table, th, td{
            border: 1px solid black;
            border-collapse: collapse;
            text-align: center;
        }
        
/*        th, td{
            text-align: center;
            padding: 150px;
        }*/
    </style>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

		<!-- Bootstrap -->
		<link type="text/css" rel="stylesheet" href="Style/bootstrap.min.css"/>

		<!-- Slick -->
		<link type="text/css" rel="stylesheet" href="Style/slick.css"/>
		<link type="text/css" rel="stylesheet" href="Style/slick-theme.css"/>

		<!-- nouislider -->
		<link type="text/css" rel="stylesheet" href="Style/nouislider.min.css"/>

		<!-- Font Awesome Icon -->
		<link type="text/css" rel="stylesheet" href="Style/font-awesome.min.css"/>

		<!-- Custom stlylesheet -->
		<link type="text/css" rel="stylesheet" href="Style/style.css"/>
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
                                </div>
                                <!-- /Cart -->
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
        <div class="content123">
            <table>
                <tr>
                    <th>Index</th>
                    <th>ProductID</th>
                    <th>Picture</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Description</th>
                    <th>Category</th>
                </tr>

                <c:forEach items="${sessionScope.product}" var="currentproduct" varStatus="loop"> 
                    <tr>
                        <td><c:out value="${loop.index + 1}" /></td>
                        <td><c:out value="${currentproduct.productID}" /></td>
                        <td><img src="data:image/jpg;base64,${currentproduct.picture}" width="100" height="100"/></td>
                        <td><c:out value="${currentproduct.name}" /></td>
                        <td>RM<fmt:formatNumber type="number" value="${currentproduct.price}" minFractionDigits="2" /></td>
                        <td><c:out value="${currentproduct.description}" /></td>
                        <td><c:out value="${currentproduct.category}" /></td>

                    </tr>
                </c:forEach>    
            </table>
        </div>
    </body>
</html>
