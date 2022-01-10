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
      <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/seedvado?"
         user = "root"  password = ""/>
 
      <sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from product;
      </sql:query>
         
         <div class="ViewProduct">
            <div class="MenuSection">
                <ul>
                    <li><a href="AllProductView.jsp">All Product</a></li>
                    <li><a href="PendingOrderView.jsp">Pending Order</a></li>
                    <li><a href="CompleteOrderView.jsp">Complete Order</a></li>
                </ul>
            </div>
            <div class="CardSection">
                <c:forEach var = "row" items = "${result.rows}">
                    <jsp:include page="product.jsp">
                        <jsp:param name="Name" value="${row.Name}"/>
                        <jsp:param name="Picture" value="${row.Picture}"/>
                        <jsp:param name="Description" value="${row.Description}"/>
                        <jsp:param name="Price" value="${row.Price}"/>
                        <jsp:param name="Rating" value="${row.Rating}"/>
                    </jsp:include>
                </c:forEach>
            </div>
        </div>
    </body>
</html>
