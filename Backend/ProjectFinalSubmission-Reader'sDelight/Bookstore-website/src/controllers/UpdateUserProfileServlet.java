package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Conn;
import bean.UserRegBean;

@WebServlet("/UpdateUserProfileServlet")
public class UpdateUserProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public UpdateUserProfileServlet() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		String name=request.getParameter("a1");
		String sex=request.getParameter("a2");
		String addr1=request.getParameter("a3");
		String addr2=request.getParameter("a4");
		String mobile=request.getParameter("a5");
		String email=request.getParameter("a6");
		String uname=(String)session.getAttribute("UNAME");
		String pwd=request.getParameter("a8");
		
		UserRegBean obj=new UserRegBean();
		
		obj.setName(name);
		obj.setSex(sex);
        obj.setEmail(email);
		obj.setPwd(pwd);
		obj.setMobile(mobile);
		obj.setAddr1(addr1);
		obj.setAddr2(addr2);
		obj.setUname(uname);
		
		
		String sql="update InsertUserInfo set name=?,sex=?,addr1=?,addr2=?,mobile=?,email=?,pwd=? where uname=?";
         String m=Conn.updateUsers(sql, obj);
         response.sendRedirect("UserHome.jsp");
		
	}

}
