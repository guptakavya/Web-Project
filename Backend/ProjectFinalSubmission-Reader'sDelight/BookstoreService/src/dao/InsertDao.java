package dao;
import java.sql.*;
import bean.*;

public class InsertDao {
public static String username="root";
public static String password="root";
public static Connection con=null;
public static String url="jdbc:mysql://localhost:3306/Bookstore";
public static PreparedStatement ps=null;
public static ResultSet rs=null; 
static
{
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection(url,username,password);
		System.out.println("Successfully connected");
	}
	catch(Exception e)
	{ 
		System.out.println("Exception: "+e.toString());
	}
}

public static void main(String args[])
{
	
}
public static String InsertUserInfo(UserRegBean m,String sql)
{
	try
	{
		ps=con.prepareStatement(sql);
		
		ps.setString(1,m.getName());
		ps.setString(2,m.getSex());
		ps.setString(3,m.getAddr1());
		ps.setString(4,m.getAddr2());
		ps.setString(5,m.getMobile());
		ps.setString(6,m.getEmail());
		ps.setString(7,m.getUname());
		ps.setString(8,m.getPwd());
		ps.setInt(9,m.getFailedlogin());
		int i=ps.executeUpdate();
		if(i==1)
	    {
	    	return "success";
	    }
	    else
	    {
	       return "fail";	
	    }
		
		
	}
	catch(Exception e)
	{
		System.out.println("Exception: "+e.toString());
	}

	return "mgit";

}

public static String InsertCartInfo(CartBean m,String sql)
{
	try
	{
		ps=con.prepareStatement(sql);
		
		ps.setString(1,m.getUname());
		ps.setInt(2,m.getQuantity());
		ps.setString(3,m.getDate());
		ps.setString(4,m.getBought());
		ps.setString(5,m.getBookid());
		ps.setString(6,m.getTitle());
		ps.setInt(7,m.getPrice());
			
	
		
		int i=ps.executeUpdate();
		if(i==1)
	    {
		
	    	return "success";
	    }
	    else
	    {
	  
	       return "fail";	
	    }
		
		
	}
	catch(Exception e)
	{
		System.out.println("Exception: "+e.toString());
	}

	return "mgit";

}

}