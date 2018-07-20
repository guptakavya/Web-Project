package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;


import dao.Conn;
import bean.BookBean;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchServlet() {
        super();
      
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		HttpSession session=request.getSession();
	response.setContentType("text/html");
	PrintWriter out=response.getWriter();
	String uname=(String)session.getAttribute("UNAME");
	String title=request.getParameter("title");
	String author=request.getParameter("author");
	String genre=request.getParameter("genre");
		
	session.setAttribute("title",title);
	session.setAttribute("author",author);
	session.setAttribute("genre",genre);
	
	out.println(uname+" "+title+" "+author+" "+genre);

	BookBean obj=new BookBean();
	obj.setUname(uname);
	obj.setAuthor(author);
	obj.setTitle(title);
	obj.setGenre(genre);
	
	
	String sql="select * from books where title=? or author=? or genre=?";
	ResultSet rs=Conn.searchBook(obj, sql);
		
	 response.sendRedirect("SearchDisplay.jsp");
	
	out.println("<table border='1'><tr><th>BookId</th><th>Genre</th><th>Title</th><th>Author</th><th>cost</th></tr>");
	try {
		while(rs.next()){

		out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td></tr>");
		}
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	out.println("</table>"); 

	
   /* if(msg.equals("success"))
    {
    	//System.out.println("SUCCESS");
    	
      response.sendRedirect("UserHome.jsp");
      
    }
    else
    {
    	System.out.println("FAIL");
    
    }*/

	
	}
	

}