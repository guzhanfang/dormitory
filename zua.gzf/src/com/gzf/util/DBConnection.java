package com.gzf.util;

import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private final static String driver = "com.mysql.jdbc.Driver";
	private final static String url = "jdbc:mysql://localhost:3306/dormitory?useunicode=true&characterEncroding=utf-8";
	private final static String user = "root";
	private final static String password = "123456";
	private static java.sql.Connection connection = null;
	static {
		try {
			Class.forName(driver);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public static java.sql.Connection getConnection() throws SQLException {

		if (connection == null) {
			connection = DriverManager.getConnection(url, user, password);
		}
		return connection;
	}
}
