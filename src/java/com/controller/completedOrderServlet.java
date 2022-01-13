/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author acer
 */
@WebServlet(name = "completedOrderServlet", urlPatterns = {"/completedOrderServlet"})
public class completedOrderServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        
        
        ServletContext context = getServletContext( );

        String date="";
        if(request.getParameter("Date")!=null)
        {
            context.log("displaying");
            date=request.getParameter("Date");
            context.log(""+date);
            context.log((String)request.getParameter("Date"));
        }
        //query="SELECT * from product";

        String dbName = "seedvado";
        String url = "jdbc:mysql://localhost/"+dbName+"?";
        String userName = "root";
        String password = "";
        
        context.log("first");  
        
        String driver = "com.mysql.jdbc.Driver";
        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, userName, password);
        
        ResultSet rsOrder=null;
        String query;
        java.sql.PreparedStatement statement;
        if(date.equals("1"))
        {
        query="SELECT * from cusorder WHERE DAY(Date) = DAY(CURDATE()) AND MONTH(Date) = MONTH(CURDATE()) AND YEAR(Date) = YEAR(CURDATE())";
        context.log(query);  
        statement = con.prepareStatement(query);
        context.log(statement.toString());        
        rsOrder = statement.executeQuery();    
        }    
        else if(date.equals("2"))
        {
        query="SELECT * from cusorder WHERE MONTH(Date) = MONTH(CURDATE()) AND YEAR(Date) = YEAR(CURDATE())";
        context.log(query);  
        statement = con.prepareStatement(query);
        context.log(statement.toString());        
        rsOrder = statement.executeQuery();    
        }    
        else if(date.equals("3"))
        {
        query="SELECT * from cusorder WHERE YEAR(Date) = YEAR(CURDATE())";
        context.log(query);  
        statement = con.prepareStatement(query);
        context.log(statement.toString());        
        rsOrder = statement.executeQuery();    
        }    
        else if(date.equals("4"))
        {
        query="SELECT * from cusorder";
        context.log(query);  
        statement = con.prepareStatement(query);
        context.log(statement.toString());        
        rsOrder = statement.executeQuery();    
        }            
                
            
         
        

        
   ArrayList RowsMonth = new ArrayList();
   ArrayList ListedProduct = new ArrayList();
   Boolean listed=false;
   if(rsOrder!=null)
   {
   while (rsOrder.next()){
                String ProductID=rsOrder.getString("ProductID");
                for(int i=0;i<ListedProduct.size();i++) 
                {
                    context.log((String)ListedProduct.get(i));
                    String ListedProductString=(String)ListedProduct.get(i);
                    context.log("ProductID"+ProductID);
                    if(ListedProductString.equals(ProductID))
                    {
                        listed=true;
                        context.log("same");
                    }
                }
                if(!listed)
                {    
                ListedProduct.add(ProductID);
                ResultSet rs;
                //Insert product into row
                
                    query="SELECT * from product WHERE ProductID=?";
                    Class.forName(driver);
                    con = DriverManager.getConnection(url, userName, password);
                    statement = con.prepareStatement(query);
                    statement.setString(1,ProductID);
                    rs = statement.executeQuery();
                    context.log(query);
                    context.log(statement.toString());
                
                    rs.next();
                context.log("inside loop");        
                ArrayList row = new ArrayList();
                   context.log("success1");

                Blob blob = rs.getBlob("PictureData");
                   context.log("success2");

                InputStream inputStream = blob.getBinaryStream();
                   context.log("success2");
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                   context.log("success1");
                
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);                  
                }
                 
                byte[] imageBytes = outputStream.toByteArray();
                String picture = Base64.getEncoder().encodeToString(imageBytes);
                   context.log("success1");
                
                row.add(rs.getString("ProductID"));
                row.add(rs.getString("Name"));
                row.add(rs.getString("Description"));
                row.add(rs.getString("Price"));
                row.add(rs.getString("Rating"));
                row.add(picture);
                   context.log("success1");

       RowsMonth.add(row);
                   context.log("success1");
                }
                else
                listed=false;
    }        
   }
   //Get table
        String ProductID  = request.getParameter("productID");
        query="SELECT * FROM CusOrder WHERE productID=? AND COMPLETE=TRUE";

        context.log(ProductID);  
        context.log("first");  
        
        Class.forName(driver);
        con = DriverManager.getConnection(url, userName, password);
        statement = con.prepareStatement(query);
        context.log(query);  
        statement.setString(1, ProductID);  
        context.log(statement.toString());        
        
        ResultSet rs = statement.executeQuery();
        
   ArrayList RowsOrder = new ArrayList();

   while (rs.next()){
        context.log("inside loop");        
       ArrayList row = new ArrayList();
       
                row.add(rs.getString("OrderID"));
                query="SELECT * FROM User WHERE userID=?";
                context = getServletContext( );
                Class.forName(driver);
                con = DriverManager.getConnection(url, userName, password);
                statement = con.prepareStatement(query);
                context.log(query);  
                statement.setString(1, rs.getString("BuyerID"));
                
                context.log(statement.toString());        
                ResultSet rs2 = statement.executeQuery();
        context.log("three");
                rs2.next();
                row.add(rs2.getString("Name"));
                row.add(rs2.getString("Address"));
                row.add(rs.getString("Quantity"));
                row.add(rs.getString("Date"));
                row.add(ProductID);
                
       
       RowsOrder.add(row);
   }
        request.setAttribute("OrderList", RowsOrder);

        request.setAttribute("ProductListMonth", RowsMonth);
        request.setAttribute("Date", date);
            context.log("success");
            RequestDispatcher dispatcher = request.getRequestDispatcher("completedOrder.jsp");
            context.log("Redirecting to other page");
            dispatcher.forward(request, response);        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
