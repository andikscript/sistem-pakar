/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package home;

import java.sql.*;
/**
 *
 * @author genz
 */
public class HomeAwal {
    //variable dokumen jsp
    public int jumlahJenisEror;
    public int jumlahFixEror;
    public int jumlahUser;
    
    //variable database
    Connection conn;
    Statement stmt;
    ResultSet rs;

    public void run(){
        setJumlahJenisEror();
        setJumlahFixEror();
        setJumlahUser();
    }
    
    public void setJumlahJenisEror(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/atm","root","");
            stmt = conn.createStatement();
            String sql = "select count(id_eror) from error";
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                jumlahJenisEror = Integer.parseInt(rs.getString("count(id_eror)"));
            }
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    
    public void setJumlahFixEror(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/atm","root","");
            stmt = conn.createStatement();
            String sql = "select count(id_informasi) from informasi_error";
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                jumlahFixEror = Integer.parseInt(rs.getString("count(id_informasi)"));
            }
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    
    public void setJumlahUser(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/atm","root","");
            stmt = conn.createStatement();
            String sql = "select count(id_user) from user"; 
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                jumlahUser = Integer.parseInt(rs.getString("count(id_user)"));
            }
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    
}
