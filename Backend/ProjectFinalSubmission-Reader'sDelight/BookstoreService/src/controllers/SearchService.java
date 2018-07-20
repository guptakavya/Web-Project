package controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import bean.UserRegBean;

@Path("/SearchService")
public class SearchService  {
	
	@Path("/checkuserreg")
	@POST
	@Consumes("application/x-www-form-urlencoded")
    @Produces(MediaType.TEXT_PLAIN)
	
	public Response isValidUser(MultivaluedMap<String, String> formParam) {
		System.out.println("Inside ValidUSer");
		
		boolean response = false;
		String name=formParam.getFirst("username");
		
		
		UserRegBean obj=new UserRegBean();
		obj.setName(name);
		obj.setSex(formParam.getFirst("sex"));
		obj.setAddr1(formParam.getFirst("addr1"));
		obj.setAddr2(formParam.getFirst("addr2"));
		obj.setMobile(formParam.getFirst("mobile"));
		obj.setEmail(formParam.getFirst("email"));
		obj.setUname(formParam.getFirst("uname"));
		obj.setPwd(formParam.getFirst("pwd"));
		obj.setFailedlogin(Integer.parseInt(formParam.getFirst("failedlogin")));
		
		String sql="insert into INSERTUSERINFO(name,sex,addr1,addr2,mobile,email,uname,pwd,failedlogin)values(?,?,?,?,?,?,?,?,?)";
		String msg=InsertDao.InsertUserInfo(obj, sql);
		
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
