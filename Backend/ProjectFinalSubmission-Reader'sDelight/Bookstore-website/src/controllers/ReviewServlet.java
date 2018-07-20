package controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Conn;
import dao.InsertDao;
import bean.CartBean;

@WebServlet("/ReviewServlet")
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReviewServlet() {
        super();
      
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		HttpSession session=request.getSession();
	response.setContentType("text/html");
	PrintWriter out=response.getWriter();
	
	String uname=(String) session.getAttribute("UNAME");
	String bookid=(String)session.getAttribute("bookid");
	String cid=(String)session.getAttribute("cid");
	String review=request.getParameter("review");	
	out.println(uname+" "+bookid+" "+review+ " "+cid);
	
	CartBean obj=new CartBean();
	obj.setUname(uname);
	obj.setBookid(bookid);
	obj.setCid(cid);
	obj.setReview(review);
	
	String sql="update cart set review=? where bookid=? and uname=? and cid=?";
	String msg=Conn.updateReview(obj, sql);
    if(msg.equals("success"))
    {
    	//System.out.println("SUCCESS");
    	
      response.sendRedirect("UserCartDetails.jsp");
      
    }
    else
    {
    	System.out.println("FAIL");
    
    }

	
	}
	

}