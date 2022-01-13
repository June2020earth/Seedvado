<%-- 
    Document   : SellerView
    Created on : Jan 7, 2022, 8:20:32 PM
    Author     : acer
--%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
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
                    <li><a href="AllProductViewServlet">All Product</a></li>
                    <li><a href="PendingOrderServlet">Pending Order</a></li>
                    <li><a href="completedOrderServlet">Complete Order</a></li>
                </ul>
            </div>
            <div class="RightSection">
            <div class="CardSection">
                    <% 
                        ArrayList rows = new ArrayList();
                        rows=(ArrayList)request.getAttribute("ProductList");
                        for(int i=0;i<rows.size();i++) {
                            ArrayList row=(ArrayList)rows.get(i);
                    %>   
                    <div class="product-delete">
                    <jsp:include page="product.jsp">
                        <jsp:param name="ProductID" value="<%=row.get(0)%>"/>
                        <jsp:param name="Name" value="<%=row.get(1)%>"/>
                        <jsp:param name="Description" value="<%=row.get(2)%>"/>
                        <jsp:param name="Price" value="<%=row.get(3)%>"/>
                        <jsp:param name="PictureData" value="<%=row.get(5)%>"/>
                        <jsp:param name="Rating" value="<%=row.get(4)%>"/>
                    </jsp:include>
                        <a href="AllProductViewServlet?ProductID=<%=row.get(0)%>"><img id="deleteButton" src="Image/delete_black_24dp.svg"></a>
                    </div>
                    <%}%>
            </div>
                <button id="AddProductButton"><a href="AddProduct.jsp">Add</a></button>
            </div>
        </div>
    </body>
</html>
