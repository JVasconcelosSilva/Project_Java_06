/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.project.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Jefferson V.
 */
public class DB {
    
    public static final String DRIVER_CLASS = "org.apache.derby.jdbc.ClientDriver";
    public static final String URL = "jdbc:derby://localhost:1527/Yunic";
    public static final String USER = "app";
    public static final String PASS = "app";
    
    public static Connection getConnection() throws Exception{
        Class.forName(DB.DRIVER_CLASS);
        return DriverManager.getConnection(URL, USER, PASS);
    }
    
    public static ArrayList<Object[]> getQuery(String SQL, Object[] parameters) throws Exception{
        ArrayList<Object[]> list = new ArrayList<>();
        
        Class.forName(DRIVER_CLASS);
        
        Connection con = DriverManager.getConnection(URL, USER, PASS);
        
        PreparedStatement stmt = con.prepareStatement(SQL);
        for(int i = 0; i < parameters.length; i++){
            
            stmt.setObject(i+1, parameters[i]);
            
        }
        
        ResultSet rs = stmt.executeQuery();
        
        while(rs.next()){
            Object row[] = new Object[rs.getMetaData().getColumnCount()];
            for(int i = 0; i < rs.getMetaData().getColumnCount(); i++){
                row[i] = rs.getObject(i+1);
            }
            list.add(row);
        }
        rs.close();
        stmt.close();
        con.close();
        return list;
    }
    
    public static void addPerfil(String SQL, Object[] parameters) throws Exception{
        ArrayList<Object[]> list = new ArrayList<>();
        
        Class.forName(DRIVER_CLASS);
        
        Connection con = DriverManager.getConnection(URL, USER, PASS);
        
        PreparedStatement stmt = con.prepareStatement(SQL);
        for(int i = 0; i < parameters.length; i++){
            
            stmt.setObject(i+1, parameters[i]);
            
        }
        
        stmt.execute();
        
        stmt.close();
        con.close();
    }
    
}
