package controllers;
import bean.*;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public UserLogin() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		PrintWriter out=response.getWriter();
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		LoginBean obj=new LoginBean();
		obj.setUsername(username);
		obj.setPassword(password);
		
		try
		{
			String msg=obj.Validate();
			out.println(msg);
			
			if(msg.equals("success"))
			{
				HttpSession session=request.getSession();
				session.setAttribute("username",username);
				getServletContext().getRequestDispatcher("/index.html").forward(request, response);
			}
			else
			{
				getServletContext().getRequestDispatcher("/UserLogin.jsp").forward(request, response);
			}
		}
		catch(Exception e)
		{
		out.println(e);	
		}
		
		
		
	}

}
