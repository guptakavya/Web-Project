   package controllers;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;
import javax.ws.rs.core.Response;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.core.util.MultivaluedMapImpl;

import dao.Conn;
import dao.InsertDao;
import bean.UserLoginBean;
import bean.UserRegBean;
@Path("/UserLoginService")
public class UserLoginService  {
	@Path("/checkuserreg")
	@POST
	@Consumes("application/x-www-form-urlencoded")
    @Produces(MediaType.TEXT_PLAIN)
	
	public Response isValidUser(MultivaluedMap<String, String> formParam) {
		System.out.println("Inside ValidUSer");
		
		boolean response = false;
		String name=formParam.getFirst("username");
		
		
		UserLoginBean obj=new UserLoginBean();
		obj.setName(name);
		
		obj.setPwd(formParam.getFirst("pwd"));
		
				
		String sql = "select * from InsertUserInfo where uname=? AND pwd=?";
		String msg = Conn.checkUser(obj, sql);
		
		System.out.println(msg);
	    if(msg.equals("success"))
	    {
	    	//System.out.println("SUCCESS");
	    	response=true;
	      	
	    }
	    else
	    {response=false;
	    	//System.out.println("FAIL");
	    
	    }
		
		return Response.ok().entity(String.valueOf(response)).build();
	}
	
	
	}


