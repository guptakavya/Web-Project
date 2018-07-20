<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="dao.*" %>
     <%@ page import="bean.UserLoginBean" %>

<html>

<head>
  <title>User Home</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <!-- modernizr enables HTML5 elements and feature detects -->
  <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
  <style>
#S
{
float:right;
}
#headerdiv
{
background-color: #6666FF;
height:200px;
}
#pic
{
background-color:#000000;
margin:10px;
height:150px;
width:150px;
}
</style>
</head>

<body>
<% if(session.getAttribute("UNAME")==null)
{
	response.sendRedirect("UserLogin.jsp");
}
%>
  <div id="main">
    <header>
      <div id="logo">
        <div id="logo_text">
          <!-- class="logo_colour", allows you to change the colour of the text -->
          <h1><a href="Index.html">Reader's<span class="logo_colour">Delight</span></a></h1>
          <h2>Simple. Contemporary. Affordable</h2>
        </div>
      </div>
      <nav>
        <ul class="sf-menu" id="nav">
          <li><a href="Index.html">Home</a></li>
          <li class="selected"><a href="UserLogin.jsp">User Login</a></li>
          <li><a href="AdminLogin.jsp">Admin Login</a></li>
          <li><a href="Search.jsp">Search for Books</a></li>
          <li><a href="Cart.jsp">Shopping cart</a></li>
          <li><a href="UserCartDetails.jsp">Shopping History</a></li>
          <li><a href="contact.jsp">Contact Us</a></li>
        </ul>
      </nav>
    </header>
    <div id="site_content">
      
      <div id="sidebar_container">
        <div class="sidebar">
          <h3>Latest News</h3>
          <h4>New Books Launched</h4>
          <h5>January 1st, 2016</h5>
          <p>2016 sees the redesign of our Website. Take a look around and let us know what you think.<br />
            <a href="LatestNews.jsp">Read more</a></p>
          <h4>20% Discount</h4>
          <h5>Dec 30st, 2015</h5>
          <p>We are offering a 20% discount to all new customers.<br /><a href="LatestNews.jsp">Read more</a></p>
        </div>
      </div>
      <div class="content">
        <h1>User Home </h1>
       
<br><br>
<div id=headerdiv>
	<div id=pic>
	<%
String uname=(String)session.getAttribute("UNAME");

String lastlogin=(String)session.getAttribute("lastlogin");
int failedlogin=Integer.parseInt((String)session.getAttribute("failedlogin")); 
System.out.println(failedlogin);
String sql="select * from InsertUserInfo where uname=?";
ResultSet rs=Conn.fetchUserData1(sql,uname);

while(rs.next())
{
	String mypath="C:\\Pics\\"+rs.getString(9);
out.println("<img src='"+mypath+"' height='150' width='150'/>");

}

	%>
</div>
	<% out.println("<font size=+2>"+"Welcome "+uname+"</font>");%>
	 
	<a id=S href="UserLogout.jsp"> Logout </a>
	

</div>
<%
	
out.println("<p> Time of Last Login : "+lastlogin);
out.println("<p> Number of Failed attempts : "+failedlogin);


	%>

<FORM  ENCTYPE="multipart/form-data" action="UploadUserPic.jsp"  METHOD=POST>
	          <INPUT NAME="F1" TYPE="file">
			  <INPUT TYPE="submit" VALUE="Upload Pic"  />
			  </FORM>


<br> 
    <br><center>
  
  <h3><a href="UpdateUserProfile.jsp"> Click here to Update your Profile! </a></h3>
    <h3><a href="Search.jsp"> Click here to Start your Search! </a></h3></center>
       
      </div>
    </div>
    
    <footer>
      <p>Copyright &copy; Reader's Delight
    </footer>
  </div>
  <p>&nbsp;</p>
  <!-- javascript at the bottom for fast page loading -->
  <script type="text/javascript" src="js/jquery.js"></script>
  <script type="text/javascript" src="js/jquery.easing-sooper.js"></script>
  <script type="text/javascript" src="js/jquery.sooperfish.js"></script>
  <script type="text/javascript" src="js/jquery.kwicks-1.5.1.js"></script>
  <script type="text/javascript">
    $(document).ready(function() {
      $('#images').kwicks({
        max : 600,
        spacing : 2
      });
      $('ul.sf-menu').sooperfish();
    });
  </script>
</body>
</html>