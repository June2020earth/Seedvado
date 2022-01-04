/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.controller;

import com.model.profile;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author User
 */
public class CheckConnection {
    
    public profile checkLogin(String email, String userpassword) throws SQLException,
            ClassNotFoundException {
        
        
        String dbName = "seedvado";
        String url = "jdbc:mysql://localhost/"+dbName+"?";
        String userName = "root";
        String password = "";
        
        String driver = "com.mysql.jdbc.Driver";
        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, userName, password);
        String query = "SELECT * FROM user WHERE Email = ? and Password = ?";
        PreparedStatement statement = con.prepareStatement(query);
        statement.setString(1, email);
        statement.setString(2, userpassword);
        
        ResultSet result = statement.executeQuery();
 
        profile user = null;
 
        if (result.next()) {
            user = new profile();
            user.setUserID(result.getString("UserID"));
            user.setName(result.getString("Name"));
            user.setEmail(result.getString("Email"));
            user.setGender(result.getString("Gender"));
            user.setPhone(result.getString("Phone"));
            user.setAddress(result.getString("Address"));
            
        }
 
        con.close();
 
        return user;
        
        
    }
}
