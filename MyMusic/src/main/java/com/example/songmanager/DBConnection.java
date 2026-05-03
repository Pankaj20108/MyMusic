package com.example.songmanager;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = System.getenv().getOrDefault(
            "DB_URL",
            "jdbc:mysql://127.0.0.1:3306/Spotify_V2");
    private static final String USER = System.getenv().getOrDefault("DB_USER", "root");
    private static final String PASS = System.getenv().getOrDefault("DB_PASS", "psuthar@079");

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC driver not found", e);
        }
        return DriverManager.getConnection(URL, USER, PASS);
    }
}