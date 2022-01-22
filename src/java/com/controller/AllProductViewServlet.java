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
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "AllProductViewServlet", urlPatterns = {"/AllProductViewServlet"})
public class AllProductViewServlet extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        

        String dbName = "seedvado";
        String url = "jdbc:mysql://localhost/"+dbName+"?";
        String userName = "root";
        String password = "";
        
        ServletContext context = getServletContext( );
        context.log("first");  
        
        String driver = "com.mysql.jdbc.Driver";
        Class.forName(driver);
        Connection con;
        java.sql.PreparedStatement statement;

        String query ="";
   if(request.getParameter("ProductID")!=null)
   {
        String ProductID =request.getParameter("ProductID");
        query="DELETE FROM product WHERE ProductID=?;";
       
        context = getServletContext( );
        context.log("inside the servlet");  
        
        driver = "com.mysql.jdbc.Driver";
        Class.forName(driver);
        con = DriverManager.getConnection(url, userName, password);
        statement = con.prepareStatement(query);
        context.log(query);  
        statement.setString(1, ProductID);  
        context.log(statement.toString());        
        
        statement.executeUpdate();       
   }

        query="SELECT * from product";
        context.log(query);  
        Class.forName(driver);
        con = DriverManager.getConnection(url, userName, password);
        statement = con.prepareStatement(query);
        context.log(statement.toString());        
        
        ResultSet rs = statement.executeQuery();
        
   ArrayList Rows = new ArrayList();

   while (rs.next()){
        context.log("inside loop");        
       ArrayList row = new ArrayList();

                Blob blob = rs.getBlob("PictureData");
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
                
                row.add(rs.getString("ProductID"));
                row.add(rs.getString("Name"));
                row.add(rs.getString("Description"));
                row.add(rs.getString("Price"));
                row.add(rs.getString("Rating"));
                row.add(picture);
                   context.log("success1");

       Rows.add(row);
                   context.log("success1");
   }        

        
        request.setAttribute("ProductList", Rows);
            context.log("success");
            RequestDispatcher dispatcher = request.getRequestDispatcher("AllProductView.jsp");
            context.log("RedirectingProductView");
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AllProductViewServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AllProductViewServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
