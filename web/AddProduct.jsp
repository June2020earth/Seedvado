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
	<link rel="stylesheet" href="Style/AddProduct.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file = "header.jsp" %>
        <form action="AddProductServlet" method="post" id="addProductForm" enctype="multipart/form-data">
            <div class="form-section">
            <div class="left-section">
                <label for="productImage" class="productImage-label">
                    <i class="productImage-i"></i> Custom Upload
                </label>
                <input type="file" name="productImage" id="productImage" placeholder="Insert your image here">
            </div>
            <div class="right-section">
                <p class="prodcutAddTag">Name</p>
                <input type="text" id="productName" name="productName" placeholder="e.g. Tai Wen Jun">
                <p class="prodcutAddTag">Description</p>
                <input type="text" id="Description" name="Description" placeholder="e.g. Best seeds in the world">
                <p class="prodcutAddTag">Price</p>
                <input type="text" id="productPrice" name="productPrice" placeholder="e.g. 20">      
                
                <div class="right-bottom-section">
                    <input type="submit" value="Post Product" id="productAddSubmit">
                </div>
            </div>
            </div>            
s        </form>
    </body>
</html>
