package com.prj.conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
	
	public static Connection getcon() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ospjsp", "root", "root");
			return con;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;

		}
		
		
	}

}
