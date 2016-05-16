package cyb.cybnet.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtility {
	public static Connection conn;

	public static Connection getConnection() {
		if (conn == null) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cybnet_db", "root", "toor");
			} catch (Exception ex) {
				ex.printStackTrace();
				return null;
			}
		}
		return conn;
	}
}
