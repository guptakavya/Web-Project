package controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.*;

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public DeleteUserServlet() {
        super();
       
    }

	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
	      
		    PrintWriter out=response.getWriter();
	        String [] user=request.getParameterValues("user");
	        String sql="delete from InsertUserInfo where uname=?";
	        for(int i=0;i<user.length;i++)
	        {
	        	String msg=Conn.deleteUsers(sql, user[i]);
	        	out.println(user[i]+"<br>");
	        }
	        response.sendRedirect("DeleteUsers.jsp");
	
	
	
	}

}
