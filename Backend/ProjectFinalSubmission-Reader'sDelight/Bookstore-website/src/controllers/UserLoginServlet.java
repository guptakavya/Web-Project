   package controllers;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.sql.*;

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

import dao.Conn;
import bean.UserLoginBean;
@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserLoginServlet() {
		super();

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		// PrintWriter out=response.getWriter();
		String uname = request.getParameter("uname");
		String pwd = request.getParameter("pwd");

		UserLoginBean obj = new UserLoginBean();
		obj.setUname(uname);
		obj.setPwd(pwd);
		
		
		request.setAttribute("obj", obj);
	
		
		String sql = "select * from InsertUserInfo where uname=? AND pwd=?";
		String msg = Conn.checkUser(obj, sql);
		
		HttpSession session = request.getSession();
		session.setAttribute("UNAME", uname);
		if (msg.equals("success"))
		{	
			
			sql="select * from insertuserinfo where uname=?";
			ResultSet rs=Conn.fetchUserData1(sql, uname);
			try {
				while(rs.next())
				{
					try {
						session.setAttribute("lastlogin", rs.getString(10));
						session.setAttribute("failedlogin", rs.getString(11));
					} catch (SQLException e) {
						
						e.printStackTrace();
					}
				}
			} catch (SQLException e) {
			
				e.printStackTrace();
			}
			String lastlogin=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new java.util.Date() );
			System.out.println(lastlogin);
			obj.setLastlogin(lastlogin);
			
			sql="update insertuserinfo set lastlogin=? where uname=?";
			msg=Conn.updateUserLogin(obj, sql);
						
			response.sendRedirect("UserHome.jsp");
					
		} 
		else 
		{
			//System.out.println("FAIL");
			sql="select * from insertuserinfo where uname=?";
			ResultSet rs=Conn.fetchUserData1(sql, uname);
			try {
				while(rs.next())
				{
					try {
						session.setAttribute("failedlogin", rs.getString(11));
					} catch (SQLException e) {
						
						e.printStackTrace();
					}
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			
			int failedlogin=Integer.parseInt((String)session.getAttribute("failedlogin")); 
			
			failedlogin++;
			obj.setFailedlogin(failedlogin);
			System.out.println(failedlogin);
			sql="update insertuserinfo set failedlogin=? where uname=?";
			msg=Conn.updateUserLogin3(obj, sql);
			
			
			
			request.setAttribute("mesg", "Enter Correct Details");
			getServletContext().getRequestDispatcher("/UserLogin.jsp").forward(
					request, response);

		}
		}

	}


