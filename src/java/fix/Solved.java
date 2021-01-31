/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fix;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 * @author genz
 */
public class Solved {
    public String idEror;
    public String idTeknisi;
    public String idMesin;
    public String komentar;
    
    //variable database
    Connection conn;
    Statement stmt;
    ResultSet rs;
    
    public void insertError(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/atm","root","");
            stmt = conn.createStatement();
            String sql = "INSERT INTO informasi_error(id_eror,id_teknisi,id_mesin,komentar) VALUES('"+idEror+"','"+idTeknisi+"','"+idMesin+"','"+komentar+"')";
            stmt.execute(sql);
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
