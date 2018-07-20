<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="dao.*" %>
    <%@ page import="controllers.*" %>
<head profile="http://gmpg.org/xfn/11">
<title>Update Users</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout.css" type="text/css" />
<script type="text/javascript" src="scripts/mootools.js"></script>
<style>
table
{
background-color:black;
}
th
{
background-color:yellow;
}
tr
{
background-color: pink;
}
</style>
</head>
<body id="top">
<%
            if(session.getAttribute("admin")==null)
            {
                response.sendRedirect("AdminLogin.jsp");   
               
            }   
%>
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
  <div id="intro"></div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col4">
  <div class="overview">
	
	
	<%
String sql="select * from InsertUserInfo";
ResultSet rs=Conn.listAllUsers(sql);
out.println("<form method='post' action='UpdateUserProcess.jsp'>");
out.println("<table>");
%>

<tr><th></th>
<th>PIC</th><th>NAME</th><th>GENDER</th><th>ADDR1</th><th>ADDR2</th><th>MOBILE</th><th>EMAIL</th><th>DUNAME</th><th>PASSWORD</th></tr>
<% 
while(rs.next())
{
	out.println("<tr>");
	out.println("<td><input type='radio' name='user' value='"+rs.getString(7)+"' /></td>");
	
	String mypath="C:\\Pics\\"+rs.getString(9);
	out.println("<td><img src='"+mypath+"' height='50' width='50'/></td>");
	out.println("<td>"+rs.getString(1)+"</td>");
	out.println("<td>"+rs.getString(2)+"</td>");
	out.println("<td>"+rs.getString(3)+"</td>");
	out.println("<td>"+rs.getString(4)+"</td>");
	out.println("<td>"+rs.getString(5)+"</td>");
	out.println("<td>"+rs.getString(6)+"</td>");
	out.println("<td>"+rs.getString(7)+"</td>");
	out.println("<td>"+rs.getString(8)+"</td>");
	
	out.println("<tr>");
}
out.println("</table>");out.println("<br><br>");
out.println("<center><input type='submit' value='Update User' /></center>");
out.println("</form>");
%>

<h3><center><a href="AdminHome.jsp">HOME</a></center></h3>
	
	</div>
	
	 <br class="clear" />
  </div>

<!-- ####################################################################################################### -->
<div class="wrapper col5">
  <div id="footer">
      <div class="box1">
      <h2>Reader's Delight has received following awards from American Librarians Association Undertakings (A Govt of USA body) for its performance and improvement.</h2>
      <p><strong>2012-2013</strong></p>
      <p>&bull;Received 2015 Modern Library Award &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
  &bull; Award for 2014 Youth Media Award<br />
  &bull; Award for 2013 Highest Viewership<br />
   
    </div>
    <div class="box contactdetails">
      
    </div>
    <div class="box flickrbox">
      <h2>Our Cars</h2>
      <div class="wrap">
        <div class="fix"></div>
        <div class="flickr_badge_image" id="flickr_badge_image1"><a href="#"><img src="images/1.jpg" alt="" height="50px" width="50px"/></a></div>
        <div class="flickr_badge_image" id="flickr_badge_image2"><a href="#"><img src="images/2.jpg" alt="" height="50px" width="50px" /></a></div>
        <div class="flickr_badge_image" id="flickr_badge_image3"><a href="#"><img src="images/3.jpg" alt="" height="50px" width="50px" /></a></div>
        <div class="flickr_badge_image" id="flickr_badge_image4"><a href="#"><img src="images/4.jpg" alt="" height="50px" width="50px"/></a></div>
        <div class="flickr_badge_image" id="flickr_badge_image5"><a href="#"><img src="images/5.jpg" alt="" height="50px" width="50px"/></a></div>
        <div class="flickr_badge_image" id="flickr_badge_image6"><a href="#"><img src="images/6.jpg" alt="" height="50px" width="50px"/></a></div>
        <div class="fix"></div>
      </div>
    </div>
    <br class="clear" />
  </div>
</div>
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










