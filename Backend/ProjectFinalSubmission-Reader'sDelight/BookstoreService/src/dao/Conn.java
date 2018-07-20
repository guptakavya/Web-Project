package dao;
import java.sql.*;
import bean.*;
import controllers.*;

import java.util.Date;

public class Conn {
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


public static String checkUser(UserLoginBean m,String sql)
{
	try
	{
		ps=con.prepareStatement(sql);
		ps.setString(1,m.getUname());
		ps.setString(2,m.getPwd());
		
		ResultSet rs=ps.executeQuery();
		int i=0;
		while(rs.next())
			{i++;}
		if(i==0)
	    {
			
	    	return "fail";
	    }
	    else
	    {
	       return "success";	
	    }
		
		
	}
	catch(Exception e)
	{
		System.out.println("Exception: "+e.toString());
	}

	return "mgit";

}
public static String updateUserLogin(UserLoginBean m,String sql)
{
	try
	{
		
		ps=con.prepareStatement(sql);
		ps.setString(2,m.getUname());
		 ps.setString(1,m.getLastlogin());
		
		int i=ps.executeUpdate();
		if(i==0)
	    {
			System.out.println("fail");
	    	return "fail";
	    }
	    else
	    {
	       return "success";	
	    }
		
		
	}
	catch(Exception e)
	{
		System.out.println("Exception: "+e.toString());
	}

	return "mgit";

}
public static String updateUserLogin3(UserLoginBean m,String sql)
{
	try
	{
		
		ps=con.prepareStatement(sql);
		ps.setString(2,m.getUname());
		 ps.setInt(1,m.getFailedlogin());
		
		int i=ps.executeUpdate();
		if(i==0)
	    {
			System.out.println("fail");
	    	return "fail";
	    }
	    else
	    {
	       return "success";	
	    }
		
		
	}
	catch(Exception e)
	{
		System.out.println("Exception: "+e.toString());
	}

	return "mgit";

}
public static String updateUserLogin1(UserRegBean m,String sql)
{
	try
	{
		
		ps=con.prepareStatement(sql);
		ps.setString(2,m.getName());
		 ps.setString(1,m.getEmail());
		
		int i=ps.executeUpdate();
		if(i==0)
	    {
			System.out.println("fail");
	    	return "fail";
	    }
	    else
	    {
	       return "success";	
	    }
		
		
	}
	catch(Exception e)
	{
		System.out.println("Exception: "+e.toString());
	}

	return "msg";

}
public static String updatePassword(String sql,String email,String pwd)
{
	try
	{
	ps=con.prepareStatement(sql);
	ps.setString(2,email);
	ps.setString(1,pwd);
	int i=ps.executeUpdate();
    
    if(i==0)
    { 
    
    	 return "fail";
    	 
    }
    else
    {
    	return "success";
    }
	
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	return "xyz";
}
public static String updateUserPic(String picname,String sql,String uname)
{
	try
	{
	ps=con.prepareStatement(sql);
	ps.setString(1,picname);
	ps.setString(2,uname);
	int i=ps.executeUpdate();
    
    if(i==0)
    { 
         //System.out.println("Fail");
    	 return "fail";
    	 
    }
    else
    {
    	return "success";
    }
	
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	return "xyz";
}

public static String updateBought(String sql,String bought,int quantity,String cid)
{
	try
	{
	ps=con.prepareStatement(sql);
	ps.setString(1,bought);
	ps.setInt(2,quantity);
	ps.setString(3,cid);
	int i=ps.executeUpdate();
    
    if(i==0)
    { 
         //System.out.println("Fail");
    	 return "fail";
    	 
    }
    else
    {
    	return "success";
    }
	
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	return "xyz";
}



public static ResultSet fetchUserData(String sql)
{
	try
	{
		ps=con.prepareStatement(sql);
		rs=ps.executeQuery();
	}
	catch(Exception e)
	{
		System.out.println("Exception :"+e.toString());
	}
	return rs;
}
public static ResultSet searchBook(BookBean m,String sql)
{
	try
	{
		ps=con.prepareStatement(sql);
		ps.setString(1, m.getTitle());
		ps.setString(2, m.getAuthor());
		ps.setString(3, m.getGenre());
		rs=ps.executeQuery();
		System.out.println("success");
	}
	catch(Exception e)
	{
		System.out.println("Exception :"+e.toString());
	}
	return rs;
}
public static ResultSet searchBook1(BookBean m,String sql)
{
	try
	{
		ps=con.prepareStatement(sql);
		ps.setString(1, m.getBookid());
	
		rs=ps.executeQuery();
		System.out.println("success");
	}
	catch(Exception e)
	{
		System.out.println("Exception :"+e.toString());
	}
	return rs;
}
public static ResultSet fetchUserData1(String sql,String uname)
{
	try
	{
		ps=con.prepareStatement(sql);
		ps.setString(1,uname);
		rs=ps.executeQuery();
	}
	catch(Exception e)
	{
		System.out.println("Exception :"+e.toString());
	}
	return rs;
}
public static ResultSet fetchUserData5(String sql,String uname,String bought)
{
	try
	{
		ps=con.prepareStatement(sql);
		ps.setString(1,uname);
		ps.setString(2, bought);
		rs=ps.executeQuery();
	}
	catch(Exception e)
	{
		System.out.println("Exception :"+e.toString());
	}
	return rs;
}
public static ResultSet fetchHistory(String sql,String uname,String bought)
{
	try
	{
		ps=con.prepareStatement(sql);
		ps.setString(1,uname);
		ps.setString(2,bought);
		rs=ps.executeQuery();
	}
	catch(Exception e)
	{
		System.out.println("Exception :"+e.toString());
	}
	return rs;
}
public static ResultSet fetchHistory1(String sql,String uname,String bookid)
{
	try
	{
		ps=con.prepareStatement(sql);
		ps.setString(1,uname);
		ps.setString(2,bookid);
		rs=ps.executeQuery();
	}
	catch(Exception e)
	{
		System.out.println("Exception :"+e.toString());
	}
	return rs;
}
public static ResultSet fetchUserData2(String sql,int rid)
{
	try
	{
		ps=con.prepareStatement(sql);
		ps.setInt(1,rid);
		rs=ps.executeQuery();
	}
	catch(Exception e)
	{
		System.out.println("Exception :"+e.toString());
	}
	return rs;
}

public static ResultSet listAllUsers(String sql)
{
	
	try
	{
	ps=con.prepareStatement(sql);
    rs=ps.executeQuery();
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
  
 return rs;
	
}
public static String deleteUsers(String sql,String uname)
{
	try
	{
	ps=con.prepareStatement(sql);
	ps.setString(1,uname);
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
		System.out.println(e.toString());
	}
  
	
	
	return "success";
}
public static String updateUsers(String sql,UserRegBean obj)
{
	
	
	try
	{
	ps=con.prepareStatement(sql);
	ps.setString(1,obj.getName());
	ps.setString(2,obj.getSex());
	ps.setString(3,obj.getAddr1());
	ps.setString(4,obj.getAddr2());
	ps.setString(5,obj.getMobile());
	ps.setString(6,obj.getEmail());
	ps.setString(7,obj.getPwd());
	ps.setString(8,obj.getUname());
	
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
		System.out.println(e.toString());
	}
  
	
	
	return "success";
}
public static String updateReview(CartBean obj,String sql)
{
	
	
	try
	{
	ps=con.prepareStatement(sql);
	ps.setString(1,obj.getReview());
	ps.setString(2,obj.getBookid());
	ps.setString(3,obj.getUname());
	ps.setString(4,obj.getCid());
	
	
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
		System.out.println(e.toString());
	}
  
	
	
	return "success";
}

public static void main(String args[])
{
	
}
}