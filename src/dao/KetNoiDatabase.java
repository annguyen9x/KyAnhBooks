package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class KetNoiDatabase {
	protected static Connection conn;
	
	public KetNoiDatabase() {
		String user = "root";
		String password = "";
		String url = "jdbc:mysql://localhost/SachKyAnh?useUnicode=true&characterEncoding=utf-8";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("Loi load driver: " + e.toString());
		} catch (SQLException e) {
			 System.out.println("Loi duong dan mysql: " + e.toString());
		}
	}
	
	public static void closeConnection(Connection conn) {
		try {
			conn.close();
		} catch (SQLException e) {
			System.out.println("Loi dong ket noi");
		}
	}
	
	public static Connection getConn() {
		return conn;
	}

	public static void setConn(Connection conn) {
		KetNoiDatabase.conn = conn;
	}
	
}
