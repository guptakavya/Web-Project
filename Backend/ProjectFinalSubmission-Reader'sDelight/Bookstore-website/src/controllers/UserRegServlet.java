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

import dao.InsertDao;
import bean.UserRegBean;

@WebServlet("/UserRegServlet")
public class UserRegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserRegServlet() {
        super();
      
        
           }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
    	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	response.setContentType("text/html");
	PrintWriter out=response.getWriter();
	String name=request.getParameter("name");
	String sex=request.getParameter("sex");
	String addr1=request.getParameter("addr1");
	String addr2=request.getParameter("addr2");
	String mobile=request.getParameter("mobile");
	String email=request.getParameter("email");
	String uname=request.getParameter("uname");
	String pwd=request.getParameter("pwd");
	int failedlogin=0;
	
	//System.out.println(name+" "+sex+" "+addr1+" "+addr2+" "+mobile+" "+email+" "+uname+" "+pwd);

	UserRegBean obj=new UserRegBean();
	obj.setName(name);
	obj.setSex(sex);
	obj.setAddr1(addr1);
	obj.setAddr2(addr2);
	obj.setMobile(mobile);
	obj.setEmail(email);
	obj.setUname(uname);
	obj.setPwd(pwd);
	obj.setFailedlogin(failedlogin);
	
	String failedlog=Integer.toString(failedlogin);
	request.setAttribute("obj",obj);
	Boolean status = false;
	try {
		 
		Client client = Client.create();
		WebResource webResource = client.resource("https://localhost:9443/BookstoreService/UserRegService/checkuserreg");
	
		MultivaluedMap<String, String> formData = new MultivaluedMapImpl();
		
		formData.add("username", name);
		formData.add("sex", sex);
		formData.add("addr1", addr1);
		formData.add("addr2", addr2);
		formData.add("mobile", mobile);
		formData.add("email", email);
		formData.add("uname", uname);
		formData.add("pwd", pwd);
		formData.add("failedlogin", failedlog);
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
		session.setAttribute("UNAME",uname);
		getServletContext().getRequestDispatcher("/UserLogin.jsp").forward(request, response);
	}
	else
	{
		getServletContext().getRequestDispatcher("/UserReg.jsp").forward(request, response);
		
	}
	
	}
	

}
