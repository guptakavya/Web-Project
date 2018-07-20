package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Connect {
	
	public static String url="jdbc:mysql://localhost:3306/Bookstore";
	public static String username="root";
	public static String  password="root";
	

	public static Statement Connect() throws Exception
	{
		
		 
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,username,password);
		System.out.println("successfully connected with database");
		Statement st=con.createStatement();
		return st;
	}

}
