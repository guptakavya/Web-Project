<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<html>

<head>
  <title>User Login</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <!-- modernizr enables HTML5 elements and feature detects -->
  <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
</head>

<body>
  <div id="main">
    <header>
      <div id="logo">
        <div id="logo_text">
          <!-- class="logo_colour", allows you to change the color of the text -->
          <h1><a href="Index.html"><span class="logo_colour">Reader's Delight</span></a></h1>
          <h2>Simple. Contemporary. Affordable</h2>
        </div>
      </div>
      <nav>
        <ul class="sf-menu" id="nav">
          <li><a href="Index.html">Home</a></li>
          <li class="selected"><a href="UserLogin.jsp">User Login</a></li>
          <li><a href="">Search for Books</a></li>
          <li><a href="AdminLogin.jsp">Admin Login</a></li>
          
          <li><a href="contact.jsp">Contact Us</a></li>
        </ul>
      </nav>
    </header>
    <div id="site_content">
      <ul id="images">
        <li><img src="images/1.jpg" width="600" height="300" alt="library_one" /></li>
        <li><img src="images/2.jpg" width="600" height="300" alt="library_two" /></li>
        <li><img src="images/3.jpg" width="600" height="300" alt="library_three" /></li>
        <li><img src="images/4.jpg" width="600" height="300" alt="library_four" /></li>
        <li><img src="images/5.jpg" width="600" height="300" alt="library_five" /></li>
        <li><img src="images/6.jpg" width="600" height="300" alt="library_six" /></li>
      </ul>
      <div id="sidebar_container">
        <div class="sidebar">
          <h3>Latest News</h3>
          <h4>New Books Launched</h4>
          <h5>January 1st, 2016</h5>
          <p>2016 sees the redesign of our Website. Take a look around and let us know what you think.<br />
            <a href="LatestNews.jsp">Read more</a></p>
          <h4>20% Discount</h4>
          <h5>Dec  30st, 2015</h5>
          <p>We are offering a 20% discount to all new customers.<br /><a href="LatestNews.jsp">Read more</a></p>
        </div>
      </div>
      <div class="content">
        <h1>User Login </h1>
        <form action="UserLoginServlet" method="post">
<table>
<tr>
<td>USERNAME</td>
<td><input type="text" name="uname" /></td>
</tr>
<tr>
<td>PASSWORD</td>
<td><input type="password" name="pwd" /></td>
</tr>
<tr>
<td>Forgot Password?</td>
<td><a href='SendMail'>CLick here to send a mail to your email</a></td>
</tr>
</table>

<input type="submit" value="Login"> <br></br>

<h3><a href="UserReg.jsp"> Register Here </a></h3>

</form>
<%
if(request.getAttribute("mesg")!=null)
{
	out.println("<font color='red'>"+request.getAttribute("mesg"));
}
%>
        
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
