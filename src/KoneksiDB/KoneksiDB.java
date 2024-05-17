package KoneksiDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class KoneksiDB {

    public Connection con;
    private final String driver = "com.mysql.jdbc.Driver";
    private final String url = "jdbc:mysql://localhost:3306/sistem_transaksi";
    private final String user = "root";
    private final String pwd = "";

    public void koneksi() {
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, user, pwd);
            System.out.println("Koneksi Berhasil");
        } catch (Exception e) {
            System.out.println("Error:\nKoneksi Data Gagal\n");
            e.printStackTrace();
        }
    }

    public ResultSet ambilData(String SQL) {
        try {
            con = DriverManager.getConnection(url, user, pwd);
            Statement st = con.createStatement();
            return st.executeQuery(SQL);
        } catch (Exception e) {
            System.out.println("Error:\nPengecekan Data Gagal Diakses!");
            e.printStackTrace();
            return null;
        }
    }

    public void aksi(String SQL) {
        try {
            con = DriverManager.getConnection(url, user, pwd);
            PreparedStatement statement = con.prepareStatement(SQL);
            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            System.out.println("Error:\nAksi Gagal Diakses!");
            e.printStackTrace();
        }
    }
}