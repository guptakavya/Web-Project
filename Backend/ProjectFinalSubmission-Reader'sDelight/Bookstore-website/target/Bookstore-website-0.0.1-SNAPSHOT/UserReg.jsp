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
  <style >

#captcha
{
background-color: yellow;
color: red;
text-align: center;
}
</style>
<script type="text/javascript" src="jquery-1.11.2.min.js"></script>
<script>
$(document).ready( function()
{
   
	var letters =/^[A-Za-z]+$/;
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/; 
	
	 
	 $("#email").blur(function()
	{
	   var myval=$("#email").val();
	  
	  if(myval.match(mailformat))
	  {
	     $("#emailMsg").html("<img src='validyes.jpg' height='30' width='30' />");
	  }
	  else
	  {
	    $("#emailMsg").html("<img src='validno.jpg' height='30' width='30' /><font color='RED'>Enter Valid Email address </font>");
	    $("#email").focus();
	  }
	 });
	 $("#captcha").load("Captcha.jsp");
	    $("#new").click(function(){ $("#captcha").load("Captcha.jsp");});
		      
});
</script>
</head>

<body>
  <div id="main">
    <header>
      <div id="logo">
        <div id="logo_text">
          <!-- class="logo_colour", allows you to change the colour of the text -->
          <h1><a href="Index.html"><span class="logo_colour">Reader's Delight</span></a></h1>
          <h2>Simple. Contemporary. Affordable</h2>
        </div>
      </div>
      <nav>
        <ul class="sf-menu" id="nav">
          <li><a href="Index.html">Home</a></li>
          <li class="selected"><a href="UserLogin.jsp">User Login</a></li>
          <li><a href="">Search for books</a></li>
          <li><a href="AdminLogin.jsp">Admin Login</a></li>
          <li><a href="#">Example Drop Down</a>
            <ul>
              <li><a href="#">Drop Down One</a></li>
              <li><a href="#">Drop Down Two</a>
                <ul>
                  <li><a href="#">Sub Drop Down One</a></li>
                  <li><a href="#">Sub Drop Down Two</a></li>
                  <li><a href="#">Sub Drop Down Three</a></li>
                  <li><a href="#">Sub Drop Down Four</a></li>
                  <li><a href="#">Sub Drop Down Five</a></li>
                </ul>
              </li>
              <li><a href="#">Drop Down Three</a></li>
              <li><a href="#">Drop Down Four</a></li>
              <li><a href="#">Drop Down Five</a></li>
            </ul>
          </li>
          <li><a href="contact.jsp">Contact Us</a></li>
        </ul>
      </nav>
    </header>
    <div id="site_content">
      <ul id="images">
        <li><img src="images/1.jpg" width="600" height="300" alt="gallery_buildings_one" /></li>
        <li><img src="images/2.jpg" width="600" height="300" alt="gallery_buildings_two" /></li>
        <li><img src="images/3.jpg" width="600" height="300" alt="gallery_buildings_three" /></li>
        <li><img src="images/4.jpg" width="600" height="300" alt="gallery_buildings_four" /></li>
        <li><img src="images/5.jpg" width="600" height="300" alt="gallery_buildings_five" /></li>
        <li><img src="images/6.jpg" width="600" height="300" alt="gallery_buildings_six" /></li>
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
  
                  <font color="#00CC66"> <br>
                    New User?  Register Now!!</font> </strong></h2>
            
            <form action="UserRegServlet" method="post">
              <table frame="void">
                <tr>
                  <td width="155">*Name</td>
                  <td width="226"><input type="text" name="name"></td>
                </tr>
                <tr>
                  <td>Gender</td>
                  <td><input type="radio" name="sex" value="male">
                    Male
                    <input type="radio" name="sex" value="female">
                    Female
                <tr>
                                    <td>*Address</td>
                    <td><input type="text" name="addr1">
                                        <p>
                                          <input type="text" name="addr2">
                                                                                            </tr>
                                  <tr>
                                    <td>*Mobile</td>
                                    <td><input type="text" name="mobile"></td>
                                  </tr>
                                  <tr>
                                    <td>*Email</td>
                                    <td><input type="text" name="email" id=email></td>
                                    <td id=emailMsg></td>
                                  </tr>
                                  <tr>
                                    <td>*Choose Your Username</td>
                                    <td><input type="text"  name="uname"></td>
                                  </tr>
                                  <tr>
                                    <td>*Choose Your Password</td>
                                    <td><input type="password"  name="pwd"></td>
                                  <tr>
                                    <td></td>
                                    <td id="captcha"></td>
                                    <td><a id="new" href="#">New Captcha</a></td>
                                  </tr>
                                  <tr>
                                    <td>Enter Captcha</td>
                                    <td><input type="text" name="captcha"/></td>
                                    <td id="H"><%
                              if(request.getAttribute("captcha")!=null)
                              {
                            	  
                            	  out.println("<font color='red'>"+request.getAttribute("captcha")+"</font>");
                              }
                            %>
                                    </td>
                                  </tr>
              </table>
                <input name="submit" type="submit" value="Register">
              <input name="reset" type="reset" value="Cancel">
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
