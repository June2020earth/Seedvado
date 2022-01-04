package com.controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import com.model.profile;
import com.mysql.jdbc.PreparedStatement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jingx
 */
@WebServlet(urlPatterns = {"/EditProfileServlet"})
public class EditProfileServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        String driver = "com.mysql.jdbc.Driver";
        String dbname = "Seedvado";
        String url = "jdbc:mysql://localhost/"+dbname+"?";
        String username = "root";
        String password = "";
        HttpSession session = request.getSession();
        profile user =(profile)session.getAttribute("user");
        String uname  = request.getParameter("uname");
        String gender  = request.getParameter("gender");
        String phone  = request.getParameter("phone");        
        String address  = request.getParameter("address");
        String id = user.getUserID();
        String query="UPDATE USER SET Name=?, Gender=?, Phone=?, Address=?";
        query+="WHERE UserID=?";
        Class.forName(driver);
        Connection con = DriverManager.getConnection(url,username,password);
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        st.setString(1,uname);
        st.setString(2,gender);
        st.setString(3,phone);
        st.setString(4,address);
        st.setString(5,id);
        st.executeUpdate();
        
        
        user.setName(uname);
        user.setGender(gender);
        user.setPhone(phone);
        user.setAddress(address);
        
        session.setAttribute("user", user);
        
        st.close();
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/ViewProfile.jsp");
        dispatcher.forward(request, response);
//        response.sendRedirect("ViewProfile.jsp");
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
        } catch (SQLException ex) {
            Logger.getLogger(EditProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EditProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EditProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
