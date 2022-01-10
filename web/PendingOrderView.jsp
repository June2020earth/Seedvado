<%-- 
    Document   : SellerView
    Created on : Jan 7, 2022, 8:20:32 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="Style/SellerViewProduct.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file = "header.jsp" %>
        <div class="ViewProduct">
            <div class="MenuSection">
                <ul>
                    <li><a href="AllProductView.jsp">All Product</a></li>
                    <li><a href="PendingOrderView.jsp">Pending Order</a></li>
                    <li><a href="CompleteOrderView.jsp">Complete Order</a></li>
                </ul>
            </div>
            <div class="CardSection">
                <%@ include file = "product.jsp" %>
                
            </div>
        </div>
    </body>
</html>
