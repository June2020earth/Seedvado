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
	<link rel="stylesheet" href="Style/completedOrder.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file = "header.jsp" %>
         <div class="ViewProduct">
            <div class="MenuSection">
                <ul>
                    <li><a href="AllProductViewServlet">All Product</a></li>
                    <li><a href="PendingOrderServlet">Pending Order</a></li>
                    <li><a href="CompleteOrderViewServlet.jsp">Complete Order</a></li>
                </ul>
            </div>
            <div class="RightSection">
            <div class="CardSection">
                <div class="cur-day">
                    <a href="completedOrderServlet?Date=1"><h3>This day</h3></a>
                    <div class="product-section">
                    <% 
                        ArrayList rowsDay = new ArrayList();
                        rowsDay=(ArrayList)request.getAttribute("ProductListMonth");
                        String date=(String)request.getAttribute("Date");
                        if(date.equals("1")){
                        for(int i=0;i<rowsDay.size();i++) {
                            ArrayList row=(ArrayList)rowsDay.get(i);
                    %>   
                    <div class="product-delete">
                    <jsp:include page="product.jsp">
                        <jsp:param name="ProductID" value="<%=row.get(0)%>"/>
                        <jsp:param name="Name" value="<%=row.get(1)%>"/>
                        <jsp:param name="Description" value="<%=row.get(2)%>"/>
                        <jsp:param name="Price" value="<%=row.get(3)%>"/>
                        <jsp:param name="PictureData" value="<%=row.get(5)%>"/>
                        <jsp:param name="Rating" value="<%=row.get(4)%>"/>
                        <jsp:param name="Page" value="CompletedOrder"/>
                        <jsp:param name="Date" value="<%=date%>"/>
                    </jsp:include>
                    </div>
                    <%}}%>
                    </div>    
                </div>
                <div class="cur-month">
                    <a href="completedOrderServlet?Date=2"><h3>This month</h3></a>
                    <div class="product-section">
                    <% 
                        ArrayList rows = new ArrayList();
                        rows=(ArrayList)request.getAttribute("ProductListMonth");
                        if(date.equals("2")){
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
                        <jsp:param name="Page" value="CompletedOrder"/>
                        <jsp:param name="Date" value="<%=date%>"/>
                    </jsp:include>
                    </div>
                    <%}}%>
                    </div>    
                </div>
                <div class="cur-year">
                    <a href="completedOrderServlet?Date=3"><h3>This year</h3></a>
                    <div class="product-section">
                    <% 
                        ArrayList rowsYear = new ArrayList();
                        rowsYear=(ArrayList)request.getAttribute("ProductListMonth");
                        if(date.equals("3")){
                        for(int i=0;i<rowsYear.size();i++) {
                            ArrayList row=(ArrayList)rowsYear.get(i);
                    %>   
                    <div class="product-delete">
                    <jsp:include page="product.jsp">
                        <jsp:param name="ProductID" value="<%=row.get(0)%>"/>
                        <jsp:param name="Name" value="<%=row.get(1)%>"/>
                        <jsp:param name="Description" value="<%=row.get(2)%>"/>
                        <jsp:param name="Price" value="<%=row.get(3)%>"/>
                        <jsp:param name="PictureData" value="<%=row.get(5)%>"/>
                        <jsp:param name="Rating" value="<%=row.get(4)%>"/>
                        <jsp:param name="Page" value="CompletedOrder"/>
                        <jsp:param name="Date" value="<%=date%>"/>
                    </jsp:include>
                    </div>
                    <%}}%>                    
                    </div>    
                </div>
                <div class="cur-all">
                    <a href="completedOrderServlet?Date=4"><h3>All</h3></a>
                    <div class="product-section">
                    <% 
                        ArrayList rowsAll = new ArrayList();
                        rowsAll=(ArrayList)request.getAttribute("ProductListMonth");
                        if(date.equals("4")){
                        for(int i=0;i<rowsAll.size();i++) {
                            ArrayList row=(ArrayList)rowsAll.get(i);
                    %>   
                    <div class="product-delete">
                    <jsp:include page="product.jsp">
                        <jsp:param name="ProductID" value="<%=row.get(0)%>"/>
                        <jsp:param name="Name" value="<%=row.get(1)%>"/>
                        <jsp:param name="Description" value="<%=row.get(2)%>"/>
                        <jsp:param name="Price" value="<%=row.get(3)%>"/>
                        <jsp:param name="PictureData" value="<%=row.get(5)%>"/>
                        <jsp:param name="Rating" value="<%=row.get(4)%>"/>
                        <jsp:param name="Page" value="CompletedOrder"/>
                        <jsp:param name="Date" value="<%=date%>"/>
                    </jsp:include>
                    </div>
                    <%}}%>                    
                    </div>    
                </div>
            </div>
<% if (request.getAttribute("OrderList") != null) {%> 
 
<table class="PendingOrderClass">
    <tr>
        <th>OrderID</th>
        <th>Name</th>
        <th>Address</th>
        <th>Quantity</th>
        <th>Date</th>
    </tr>
    <%
        rows = new ArrayList();
        rows=(ArrayList)request.getAttribute("OrderList");

        for(int i=0;i<rows.size();i++) {

        ArrayList row=(ArrayList)rows.get(i);
        String complete;
        if(row.get(4).equals("0"))
            complete="Incomplete";
        else
            complete="Completed";
        %>
        <tr>
            <td><%=row.get(0)%></td>
            <td><%=row.get(1)%></td>
            <td><%=row.get(2)%></td>
            <td><%=row.get(3)%></td>
            <td><%=row.get(4)%></td>
        </tr>
     <% } %>   
</table>    
<% } %>  
            </div>      
        </div>
    </body>
</html>
