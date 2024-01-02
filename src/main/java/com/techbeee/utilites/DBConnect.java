package com.techbeee.utilites;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
	private static final String username = "root";
	private static final String password = "root";
	private static final String jdbUrl = "jdbc:mysql://localhost:3306/empdb";
	private static final String driverName = "com.mysql.cj.jdbc.Driver";
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Connection conn = null;

			Class.forName(driverName);
			conn = DriverManager.getConnection(jdbUrl, username, password);
			
			if (conn != null) {
				System.out.println("Database Connection Successfull!");
				return conn;
			}
		return conn;
	}
}
