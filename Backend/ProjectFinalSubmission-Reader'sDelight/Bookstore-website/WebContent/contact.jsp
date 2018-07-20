<!DOCTYPE HTML>
<html>

<head>
  <title>Contact Us</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <!-- modernizr enables HTML5 elements and feature detects -->
  <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
</head>

<body>
  <div id="main">
    <header>
      <div id="logo">
        <div id="logo_text">
          <!-- class="logo_colour", allows you to change the colour of the text -->
          <h1><a href="index.html">Reader's <span class="logo_colour">Delight</span></a></h1>
          <h2>Simple. Contemporary. Affordable. </h2>
        </div>
      </div>
      <nav>
        <ul class="sf-menu" id="nav">
          <li><a href="index.html">Home</a></li>
          <li><a href="UserLogin.jsp">User Login</a></li>
          <li><a href="">Search Books</a></li>
          <li><a href="AdminLogin.jsp">Admin Login</a></li>
          <li class="selected"><a href="contact.jsp">Contact Us</a></li>
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
          <h4>New Website Launched</h4>
          <h5>January 1st, 2016</h5>
          <p>2016 sees the redesign of our website. Take a look around and let us know what you think.<br /><a href="LatestNews.jsp">Read more</a></p>
          <h4>20% Discount</h4>
          <h5>December 30th, 2015</h5>
          <p>We are offering a 20% discount to all new customers.<br /><a href="LatestNews.jsp">Read more</a></p>
        </div>
      </div>
      <div class="content">
        <h1>Contact Us</h1>
        <p>Our address is <i>
        1270 McCallum Blvd, Dallas, Texas 75252</i>
        </p>
        <p>Our email address is  <i>readersdelight2016@gmail.com</i></p>
        <p> Send us a mail Now  <a href="ContactUs.jsp"> Clicking Here! </a>
        <p>Call us at <b> 1800-1800-1800</b>
        </p>
       
        
      </div>
    </div>
    <footer>
      <p>Copyright &copy;Reader's Delight
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
