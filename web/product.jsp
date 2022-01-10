<%-- 
    Document   : product
    Created on : Jan 7, 2022, 8:43:37 PM
    Author     : acer
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
        <div class="product">
											<div class="product-img">
												<img src="Image/<%=request.getParameter("Picture")%>.jpg" alt="">
												<div class="product-label">
													<span class="sale">-30%</span>
													<span class="new">NEW</span>
												</div>
											</div>
											<div class="product-body">
                                                                                            <%
                                                                                                double price=Double.parseDouble(request.getParameter("Price"));
                                                                                                DecimalFormat f = new DecimalFormat("##.00");
                                                                                                int rating=Integer.parseInt(request.getParameter("Rating"));
                                                                                            %>
												<h3 class="product-name"><a href="#"><%=request.getParameter("Name") %></a></h3>
												<h4 class="product-price">RM <%=f.format(price)%></h4>
												<p class="product-category"><%=request.getParameter("Description") %></p>
												<div class="product-rating">
                                                                                                    <% for(int i=0;i<rating;i++) {%>
													<i class="fa fa-star"></i>
                                                                                                    <% } %>    
                                                                                                    <% for(int i=rating;i<5;i++) {%>
                                                                                                        <i class="fa fa-star-o"></i>
                                                                                                    <% } %>    
												</div>
										
											</div>
											
										</div>
    </body>
</html>
