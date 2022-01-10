/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.controller;

import com.model.Product;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;

/**
 *
 * @author User
 */
public class ProductDAO {
    String dbname = "Seedvado";
    String url = "jdbc:mysql://localhost/"+dbname+"?";
    String username = "root";
    String password = "";
    
    public ArrayList<Product> get()throws SQLException, IOException {
//        Product product = null;
        ArrayList <Product> product = new ArrayList<Product>();
        
        
        String sql = "SELECT * FROM product";
        
        try(Connection con = DriverManager.getConnection(url, username, password)){
            PreparedStatement statement = con.prepareStatement(sql);
//            statement.setInt(1, id);
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                Product productobj = new Product();
                int productID = result.getInt("ProductID");
                Blob blob = result.getBlob("Picture");
                String name = result.getString("Name");
                double price = result.getDouble("Price");
                String description = result.getString("Description");
                String category = result.getString("Category");
                
                InputStream inputStream = blob.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);                  
                }
                 
                byte[] imageBytes = outputStream.toByteArray();
                String picture = Base64.getEncoder().encodeToString(imageBytes);
                 
                inputStream.close();
                outputStream.close();
                
//                product.add(new Product(productID,picture,name,price,description,category));

                
                productobj.setProductID(productID);
                productobj.setPicture(picture);
                productobj.setName(name);
                productobj.setPrice(price);
                productobj.setDescription(description);
                productobj.setCategory(category);
                product.add(productobj);
            }
        } catch (SQLException | IOException ex) {
            ex.printStackTrace();
            throw ex;
        }
        
        return product;
    }
}
