<%@ page import="java.sql.*" %>
<%@ page import="dao.*" %>
<%@ page import="controllers.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11">
<title>Reader's Delight</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout.css" type="text/css" />
<script type="text/javascript" src="scripts/mootools.js"></script>
</head>
<body id="top">
<div class="wrapper col1">
  <div class="accordion">
    <div id="socialise">
      <ul>
        <li><a href="https://www.linkedin.com"><img src="images/linkedin.gif" alt="" /><span>Linked In</span></a></li>
        <li><a href="https://www.skype.com"><img src="images/skype.gif" alt="" /><span>Skype</span></a></li>
        <li><a href="https://www.facebook.com"><img src="images/facebook.gif" alt="" /><span>Facebook</span></a></li>
        <li class="last"><a href="https://www.twitter.com"><img src="images/twitter.gif" alt="" /><span>Twitter</span></a></li>
      </ul>
      <br class="clear" />
    </div>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col2">
  <div id="header">
    <p class="toggler"><a href="#socialise">Open &amp; Close SocialBar</a></p>
    <div id="logo" style="width:900px;">
      <h1><a href="#">Reader's Delight</a></h1>
      <p>&nbsp;</p>
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col3">
  <div id="intro"><centre><h1><font color='red'>WELCOME ADMIN</font></h1></centre></div></font>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col4">
  <div class="centre">
    <h1 id="title">
	<%
            if(session.getAttribute("admin")==null)
            {
                response.sendRedirect("AdminLogin.jsp");   
               
            }   
      
      out.println("<div style='float:right'><a href='logout.jsp' style='color:black;'><img src='images/demo/logout.jpg'></a></div>");
    %>

	
	<%
String uname=request.getParameter("user");
//out.println(uname);
String sql="select * from InsertUserInfo where uname=?";
ResultSet rs=Conn.fetchUserData1(sql,uname);
out.println("<form method='post' action='UpdateUserServlet'>");
out.println("<table>");
while(rs.next())
{
	String mypath="C:\\Pics\\"+rs.getString(9);
	out.println("<tr><td><img src='"+mypath+"' height='50' width='50'/></td><td></tr>");
	out.println("<tr><td>NAME</td><td><input type='text' name='a1' value='"+rs.getString(1)+"'/></td></tr>");
	out.println("<tr><td>GENDER</td><td><input type='text' name='a2' value='"+rs.getString(2)+"'/></td></tr>");
	out.println("<tr><td>ADDR1</td><td><input type='text' name='a3' value='"+rs.getString(3)+"'/></td></tr>");
	out.println("<tr><td>ADDR2</td><td><input type='text' name='a4' value='"+rs.getString(4)+"'/></td></tr>");
	out.println("<tr><td>MOBILE</td><td><input type='text' name='a5' value='"+rs.getString(5)+"'/></td></tr>");
	out.println("<tr><td>EMAIL</td><td><input type='text' name='a6' value='"+rs.getString(6)+"'/></td></tr>");
	out.println("<tr><td>UNAME</td><td>"+rs.getString(7)+"</td></tr>");
	session.setAttribute("UNAME",rs.getString(7));
	out.println("<tr><td>PASSWORD</td><td><input type='text' name='a8' value='"+rs.getString(8)+"'/></td></tr>");
}
out.println("</table>");
out.println("<input type='submit' value='Update' />");
out.println("</form>");

%>
<!-- ####################################################################################################### -->

<!-- ####################################################################################################### -->
<div class="wrapper col6">
  <div id="copyright">
    <p class="fl_left"><a href="#"></a></p>
    <p class="fl_right"><a href="http://www.os-templates.com/" title="Free Website Templates"></a></p>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<script type="text/javascript" src="scripts/toggle.js"></script>
</body>
</html>
