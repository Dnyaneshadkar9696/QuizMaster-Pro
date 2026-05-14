package com.quizmaster.util;

import java.sql.*;

public class DbConnection {

	// here basically we do the db connection and use it if we required

	public static Connection getConnections() {

		Connection con = null;

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");

			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/QuizMaster", "root", "lotus");

			System.out.println("Database connected successfully");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return con;

	}

}