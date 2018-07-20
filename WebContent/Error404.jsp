<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isErrorPage="true"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" type="text/css" href="css/style.css" />
 
  <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
<title>Error Page</title>
</head>
<body>
  <div id="main">
    <header>
      <div id="logo">
        <div id="logo_text">
          
          <h1><a href="Index.html">Reader's Delight- Bookstore</a></h1>
          <h2>Simple. Contemporary. Affordable </h2>
        </div>
      </div>
      <nav>
        <ul class="sf-menu" id="nav">
          <li class="selected"><a href="Index.html">Home</a></li>
          <li><a href="UserLogin.jsp">User Login</a></li>
          <li><a href="Search.jsp">Search</a></li>
          <li><a href="AdminLogin.jsp">Admin Login </a></li>
          <li><a href="contact.jsp">Contact Us</a></li>
        </ul>
      </nav>
    </header>
    <div id="site_content">
      <ul id="images">
        <li><a href="UserLogin.jsp"><img src="images/1.jpg" width="600" height="300" alt="library_one" /></a></li>
        <li><a href="Search.jsp"><img src="images/2.jpg" width="600" height="300" alt="library_two" /></a></li>
        <li><a href="Cart.jsp"><img src="images/3.jpg" width="600" height="300" alt="library_three" /></a></li>
        <li><a href="UserCartDetails.jsp"><img src="images/4.jpg" width="600" height="300" alt="library_four" /></a></li>
        <li><a href="AdminLogin.jsp"><img src="images/5.jpg" width="600" height="300" alt="library_five" /></a></li>
        <li><a href="contact.jsp"><img src="images/6.jpg" width="600" height="300" alt="library_six" /></a></li>
      </ul>
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
        <h1>PAGE NOT FOUND! </h1>
        
		
      </div>
    </div>
    <footer>
      <p>Copyright &copy; Reader's Delight </p>
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