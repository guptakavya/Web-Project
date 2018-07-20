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

import bean.Admin;

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AdminLogin() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		Admin obj=new Admin();
		obj.setUsername(username);
		obj.setPassword(password);
		
		request.setAttribute("obj",obj);
		Boolean status = false;
		try {
			 
			Client client = Client.create();
			WebResource webResource = client.resource("https://localhost:9443/BookstoreService/AdminLoginService/checkuserreg");
		
			MultivaluedMap<String, String> formData = new MultivaluedMapImpl();
			
			formData.add("username", username);
			
			formData.add("pwd", password);
			
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
		}
		if(status)
		{
			HttpSession session=request.getSession();
			
			session.setAttribute("admin",username);
			getServletContext().getRequestDispatcher("/AdminHome.jsp").forward(request, response);
			
			
		}
		else
		{
			getServletContext().getRequestDispatcher("/AdminLogin.jsp").forward(request, response);
			
		}
	}

}
