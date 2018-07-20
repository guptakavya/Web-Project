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
import bean.CartBean;

@Path("/CartService")
public class CartService  {
	
	@Path("/checkuserreg")
	@POST
	@Consumes("application/x-www-form-urlencoded")
    @Produces(MediaType.TEXT_PLAIN)
	
	public Response isValidUser(MultivaluedMap<String, String> formParam) {
		System.out.println("Inside ValidUSer");
		
		boolean response = false;
	
		
		
		CartBean obj=new CartBean();
		
		obj.setUname(formParam.getFirst("uname"));
		obj.setBookid(formParam.getFirst("bookid"));
		obj.setTitle(formParam.getFirst("title"));
		obj.setDate(formParam.getFirst("date"));
		obj.setBought(formParam.getFirst("bought"));
		obj.setPrice(Integer.parseInt(formParam.getFirst("price")));
		obj.setQuantity(Integer.parseInt(formParam.getFirst("quantity")));
		
		
		
	String	sql="insert into CART(uname,quantity,date,bought,bookid,title,price)values(?,?,?,?,?,?,?)";
		String msg=InsertDao.InsertCartInfo(obj, sql);
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
