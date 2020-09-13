package project2222;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
	static Connection conn=null;
	
	public static Connection getConnection(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2222","root","");
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return conn ; // return connection object
	}
	}


