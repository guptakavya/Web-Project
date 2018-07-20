package controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;
import javax.ws.rs.core.Response;
import javax.ws.rs.PathParam;
 

import dao.InsertDao;
import bean.Admin;
import bean.UserRegBean;

@Path("/AdminLoginService")
public class AdminLoginService  {
	
	@Path("/checkuserreg")
	@POST
	@Consumes("application/x-www-form-urlencoded")
    @Produces(MediaType.TEXT_PLAIN)
	
	public Response isValidUser(MultivaluedMap<String, String> formParam) {
		System.out.println("Inside ValidUSer");
		
		boolean response = false;
		String name=formParam.getFirst("username");
		
		
		Admin obj=new Admin();
		obj.setUsername(name);
		
		obj.setPassword(formParam.getFirst("pwd"));
		
		try
		{
			String msg=obj.Validate();
			System.out.println(msg);
			
			if(msg.equals("success"))
			{
				response=true;
				
			}
			else
			{	response=false;
				
			}
		}
		catch(Exception e)
		{
		System.out.println(e);	
		}
		
		
		return Response.ok().entity(String.valueOf(response)).build();
	}
	
	@Path("/availableusername/{username}")
	@GET
	public String availableUsername(@PathParam("username") String username) {
		return username + "001";
	}

	

}
