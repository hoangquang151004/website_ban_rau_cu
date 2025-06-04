package com.database;

import java.sql.*;

public class DBcontext {
    private static final String URL = "jdbc:mysql://localhost:3306/qlbanrau?useUnicode=true&characterEncoding=UTF-8";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    public Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // load JDBC
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Kết nối thành công");
            return conn;
        } catch (Exception e) {
            System.out.println("Kết nối thất bại!");
            e.printStackTrace();
            return null;
        }
    }

    public static void main(String[] args) {
        DBcontext db = new DBcontext();
        db.getConnection();
    }

}