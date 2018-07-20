package businesslogic;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UserRegBean;
import dao.*;

@WebServlet("/SendMail")
public class SendMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SendMail() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String uname=(String) session.getAttribute("UNAME");
	//	String uname=request.getParameter("uname");
		System.out.println(uname);
		UserRegBean obj = new UserRegBean();
		obj.setName(uname);
				
		request.setAttribute("obj", obj);
	
		String sql = "select * from InsertUserInfo where uname=?";
		ResultSet rs = Conn.fetchUserData1(sql,uname);
		
		try {
			while(rs.next())
			{
				try {
					request.setAttribute("email",rs.getString(6));
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String rEmail=(String)request.getAttribute("email");
	System.out.println(rEmail);
		MyCaptcha c=new MyCaptcha();
		String newPwd=c.GenCaptcha();
		String sEmail="readersdelight2016@gmail.com";
		String sPassword="bookstore";
		String subject="New Password";
		
		String Text="Your new Pwd is "+newPwd;
		
		SendMailToUser.SendEmailToUser1(sEmail, sPassword, rEmail, subject, Text);
		
		
		 sql="update InsertUserInfo set pwd=? where email=?";
		Conn.updatePassword(sql,rEmail,newPwd);
		
		
		System.out.println("password is "+newPwd);
		
		response.sendRedirect("UserLogin.jsp");
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			}

}
