package controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.core.util.MultivaluedMapImpl;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

import dao.Conn;
import dao.InsertDao;
import bean.BookBean;
import bean.CartBean;

@WebServlet("/AddCartServlet")
public class AddCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddCartServlet() {
        super();
      
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session=request.getSession();
	response.setContentType("text/html");
	PrintWriter out=response.getWriter();
	String uname=(String)session.getAttribute("UNAME");
	String bookid=request.getParameter("bookid");
	
	BookBean bb=new BookBean();
	bb.setBookid(bookid);
	
	String sql="select * from books where bookid=?";
	ResultSet rs=Conn.searchBook1(bb, sql);
	
	try {
		while(rs.next())
		{
			
		}
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	
	
	String date=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new java.util.Date() );
	String bought="NO";
	int price=Integer.parseInt((String)session.getAttribute("price"));
	String title=(String)(session.getAttribute("title"));
	int quantity=1;
			
	out.println(uname+" "+bookid+" "+title+" "+date+" "+bought+" "+" "+price+" "+quantity);

	CartBean obj=new CartBean();
	obj.setUname(uname);
	obj.setBookid(bookid);
	obj.setTitle(title);
	obj.setDate(date);
	obj.setBought(bought);
	obj.setPrice(price);
	obj.setQuantity(quantity);
	
		sql="insert into CART(uname,quantity,date,bought,bookid,title,price)values(?,?,?,?,?,?,?)";
	String msg=InsertDao.InsertCartInfo(obj, sql);
	System.out.println(msg);
   
	 if(msg.equals("success"))
	    {
		 session.setAttribute("UNAME", uname);
	      response.sendRedirect("Cart.jsp");
	      	
	    }
	    else
	    {
	    	//System.out.println("FAIL");
	    
	    }
		
	String quan=Integer.toString(quantity);
	String pric=Integer.toString(price);
	
	
	request.setAttribute("obj",obj);
	Boolean status = false;
	
	/*try {
		 
		Client client = Client.create();
		WebResource webResource = client.resource("https://localhost:9443/BookstoreService/UserRegService/checkuserreg");
	
		MultivaluedMap<String, String> formData = new MultivaluedMapImpl();
		
		formData.add("uname", uname);
		formData.add("bookid", bookid);
		formData.add("title", title);
		formData.add("date", date);
		formData.add("bought", bought);
		formData.add("price", pric);
		formData.add("quantity", quan);
		
		ClientResponse restResponse = webResource
		    .type(MediaType.APPLICATION_FORM_URLENCODED_TYPE)
		    .post(ClientResponse.class, formData);
		System.out.println("Response:"+restResponse.toString());
		if (restResponse.getStatus() != 200) {
			throw new RuntimeException("Failed : HTTP error code : " + restResponse.getStatus());
		}

		String statusString = restResponse.getEntity(String.class);
		status = Boolean.parseBoolean(statusString);
		System.out.println(status);
	} catch (Exception e) {
		e.printStackTrace();
	}*/
	
	
   
   

	
	}
	

}