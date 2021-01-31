/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fix;

import java.sql.*;

/**
 *
 * @author genz
 */
public class FixError {
    public String deskripsi;
    public int a = 0;
    public String kode = "-";
    public String masalah = "-";
    public String solusi = "-";
    
    //variable database
    Connection conn;
    Statement stmt;
    ResultSet rs;
    
    public void setSolusi(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/atm","root","");
            stmt = conn.createStatement();
            String sql = "select masalah, solusi from error where id_eror='"+kode+"'";
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                masalah = rs.getString(1);
                solusi = rs.getString(2);
            }
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    
    public void setKode(){
        String low = deskripsi.toLowerCase();
        
        if (low.contains("print")) {
            if (low.contains("panas")) {
                kode = "E0001";
            } else if (low.contains("respon")) {
                if (low.contains("tidak")) {
                    kode = "E0005";
                } else if (low.contains("belum")) {
                    kode = "E0005";
                }
            } else if (low.contains("kertas") && low.contains("habis")) {
                kode = "E0003";
            } else {
                kode = "NOT FOUND";
            }
        } else if (low.contains("kertas")) {
            if (low.contains("macet")) {
                kode = "E0002";
            } else if (low.contains("tuas") && low.contains("buka")) {
                kode = "E0006";
            } else if (low.contains("otong")) {
                kode = "E0004";
            } else if (low.contains("eluar")) {
                if (low.contains("tidak")) {
                    kode = "E0002";
                } else if (low.contains("belum")) {
                    kode = "E0002";
                }
            } else {
                kode = "NOT FOUND";
            }
        } else if (low.contains("dispenser")) {
            if (low.contains("kerja")) {
                if (low.contains("tidak")) {
                    kode = "E0018";
                } else if (low.contains("belum")) {
                    kode = "E0018";
                }
            } else if (low.contains("fault")) {
                kode = "E0018";
            } else if (low.contains("macet")) {
                kode = "E0018";
            } else {
                kode = "NOT FOUND";
            }
        } else if (low.contains("exit shutter")) {
            if (low.contains("buka")) {
                if (low.contains("tidak")) {
                    kode = "E0019";
                } else if (low.contains("belum")) {
                    kode = "E0019";
                }
            } else {
                kode = "NOT FOUND";
            }
        } else if (low.contains("gambar")) {
            if (low.contains("normal")) {
                if (low.contains("tidak")) {
                    kode = "E0007";
                } else if (low.contains("belum")) {
                    kode = "E0007";
                }
            } else {
                kode = "NOT FOUND";
            }
        } else if (low.contains("kartu")) {
            if (low.contains("dalam") && low.contains("card")) {
                kode = "E0008";
            } else if (low.contains("baca")) {
                if (low.contains("tidak")) {
                    kode = "E0009";
                } else if (low.contains("belum")) {
                    kode = "E0009";
                }
            } else if (low.contains("olak")) {
                kode = "E0010";
            } else if (low.contains("eluar")) {
                if (low.contains("tidak")) {
                    kode = "E0011";
                } else if (low.contains("belum")) {
                    kode = "E0011";
                }
            } else {
                kode = "NOT FOUND";
            }
        } else if (low.contains("tombol")) {
            if (low.contains("ungsi")) {
                if (low.contains("tidak")) {
                    kode = "E0020";
                } else if (low.contains("belum")) {
                    kode = "E0020";
                }
            } else {
                kode = "NOT FOUND";
            }
        } else if (low.contains("menu")) {
            if (low.contains("lengkap")) {
                if (low.contains("tidak")) {
                    kode = "E0013";
                } else if (low.contains("belum")) {
                    kode = "E0013";
                }
            } else {
                kode = "NOT FOUND";
            }
        } else if (low.contains("layar")) {
            if (low.contains("001")) {
                kode = "E0015";
            } else if (low.contains("002")) {
                kode = "E0014";
            } else if (low.contains("003")) {
                kode = "E0016";
            } else if (low.contains("mati")) {
                kode = "E0012";
            } else {
                kode = "NOT FOUND";
            }
        } else if (low.contains("uang")) {
            if (low.contains("eluar")) {
                if (low.contains("tidak")) {
                    kode = "E0017";
                } else if (low.contains("belum")) {
                    kode = "E0017";
                }
            } else {
                kode = "NOT FOUND";
            }
        } else {
            kode = "NOT FOUND";
        }
    }
}
