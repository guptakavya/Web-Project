package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Conn;
import bean.CartBean;
import bean.UserRegBean;
import businesslogic.MyCaptcha;
import businesslogic.*;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CartServlet() {
        super();
      
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session=request.getSession();
		
	response.setContentType("text/html");
	PrintWriter out=response.getWriter();
	String uname=request.getParameter("uname");
	String bookid=request.getParameter("bookid");
	String title=request.getParameter("title");
	String date=request.getParameter("date");
	//String cid=request.getParameter("cid");
	String bought="YES";
	int price=Integer.parseInt((String)session.getAttribute("price"));
	int quantity=Integer.parseInt(request.getParameter("quantity"));
		
	//out.println(uname+" "+bookid+" "+title+" "+date+" "+bought+" "+" "+price+" "+quantity);

	CartBean obj=new CartBean();
	obj.setUname(uname);
	obj.setBookid(bookid);
	obj.setTitle(title);
	obj.setDate(date);
	obj.setBought(bought);
	obj.setPrice(price);
	obj.setQuantity(quantity);
	 String [] cid=request.getParameterValues("cid");
	 String sql="update CART set bought=?,quantity=? where cid=?";
     for(int i=0;i<cid.length;i++)
     {
    	 String msg=Conn.updateBought(sql,bought,quantity,cid[i]);
     	
     	//out.println(cid[i]+"<br>");
     }
    
		UserRegBean obj1 = new UserRegBean();
		uname=(String) session.getAttribute("UNAME");
		obj1.setName(uname);
				
		request.setAttribute("obj", obj1);
	
		 sql = "select * from InsertUserInfo where uname=?";
		ResultSet rs = Conn.fetchUserData1(sql,uname);
		
		try {
			while(rs.next())
			{
				try {
					session.setAttribute("email",rs.getString(6));
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		String rEmail=(String)session.getAttribute("email");
	System.out.println(rEmail);
		
		String sEmail="readersdelight2016@gmail.com";
		String sPassword="bookstore";
		//String rEmail=;
		String subject="Confirmation";
		String Text="Your Order has been purchased";		
		
		SendMailToUser.SendEmailToUser1(sEmail, sPassword, rEmail, subject, Text);
		
		
		//System.out.println("password is "+newPwd);
		
			
  response.sendRedirect("Cart.jsp");

	
	}
	

}