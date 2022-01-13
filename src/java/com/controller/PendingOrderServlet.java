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
@WebServlet(name = "PendingOrderServlet", urlPatterns = {"/PendingOrderServlet"})
public class PendingOrderServlet extends HttpServlet {

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
        
        String ProductID  = request.getParameter("productID");
        String query="SELECT * FROM CusOrder WHERE productID=?";

        String dbName = "seedvado";
        String url = "jdbc:mysql://localhost/"+dbName+"?";
        String userName = "root";
        String password = "";
        
        ServletContext context = getServletContext( );
        context.log(ProductID);  
        context.log("first");  
        
        String driver = "com.mysql.jdbc.Driver";
        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, userName, password);
        java.sql.PreparedStatement statement = con.prepareStatement(query);
        context.log(query);  
        statement.setString(1, ProductID);  
        context.log(statement.toString());        
        
        ResultSet rs = statement.executeQuery();
        
   ArrayList Rows = new ArrayList();

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
                row.add(rs.getString("Complete"));
                row.add(ProductID);
                
       
       Rows.add(row);
   }        
   
   //Product List
        {
            query="SELECT * from product";            
            context = getServletContext( );
            context.log("first");  
        
        Class.forName(driver);
        con = DriverManager.getConnection(url, userName, password);
        statement = con.prepareStatement(query);
        context.log(query);  
        context.log(statement.toString());        
        
        ResultSet rsProduct = statement.executeQuery();
        
   ArrayList RowsProduct = new ArrayList();

   while (rsProduct.next()){
        context.log("inside loop");        
       ArrayList row = new ArrayList();

                Blob blob = rsProduct.getBlob("PictureData");
                   context.log("success1");
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
                
                row.add(rsProduct.getString("ProductID"));
                row.add(rsProduct.getString("Name"));
                row.add(rsProduct.getString("Description"));
                row.add(rsProduct.getString("Price"));
                row.add(rsProduct.getString("Rating"));
                row.add(picture);
                   context.log("success1");

       RowsProduct.add(row);
                   context.log("success1");
   }        
        
        request.setAttribute("ProductList", RowsProduct);            
        }
        
        request.setAttribute("OrderList", Rows);
            RequestDispatcher dispatcher = request.getRequestDispatcher("PendingOrderView.jsp");
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
