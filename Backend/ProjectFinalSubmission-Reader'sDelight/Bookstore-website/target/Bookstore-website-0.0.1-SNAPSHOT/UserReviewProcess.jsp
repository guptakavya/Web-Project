<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*" %>
 <%@ page import="dao.*" %>
<html>

<head>
  <title>CART</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <!-- modernizr enables HTML5 elements and feature detects -->
  <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
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
          <h1><a href="Index.html"><span class="logo_colour">Reader's Delight</span></a></h1>
          <h2>Simple. Contemporary. Affordable</h2>
        </div>
      </div>
      <nav>
        <ul class="sf-menu" id="nav">
          <li><a href="Index.html">Home</a></li>
          <li class="selected"><a href="UserLogin.jsp">User Login</a></li>
          <li><a href="Search.jsp">Search for Books</a></li>
          <li><a href="AdminLogin.jsp">Admin Login</a></li>
           <li><a href="Cart.jsp">Shopping cart</a></li>
          <li class="selected"><a href="UserCartDetails.jsp">Shopping History</a></li>
          
          <li><a href="contact.php">Contact Us</a></li>
        </ul>
      </nav>
    </header>
    <div id="site_content">
      
      <div id="sidebar_container">
        <div class="sidebar">
          <h3>Latest News</h3>
          <h4>New Cars Launched</h4>
          <h5>January 1st, 2016</h5>
          <p>2016 sees the redesign of our website. Take a look around and let us know what you think.<br />
            <a href="LatestNews.jsp">Read more</a></p>
          <h4>20% Discount</h4>
          <h5>Dec 30st, 2015</h5>
          <p>We are offering a 20% discount to all new customers.<br /><a href="LatestNews.jsp">Read more</a></p>
        </div>
      </div>
      <div class="content">


	<%
String cid=request.getParameter("cid");
String uname=session.getAttribute("UNAME").toString();

String sql="select * from cart where uname=? and cid=?";
ResultSet rs=Conn.fetchHistory1(sql,uname,cid);
out.println("<form method='post' action='ReviewServlet'>");
out.println("<table>");
while(rs.next())
{
	out.println("<tr><td>CID</td><td>"+rs.getString(8)+"</td></tr>");
	out.println("<tr><td>BOOKID</td><td>"+rs.getString(5)+"</td></tr>");
	out.println("<tr><td>TITLE</td><td>"+rs.getString(6)+"</td></tr>");
	out.println("<tr><td>REVIEW</td><td><input type='text' name='review' value='"+rs.getString(9)+"'/></td></tr>");
	session.setAttribute("cid", rs.getString(8));
	session.setAttribute("bookid", rs.getString(5));
	session.setAttribute("UNAME", rs.getString(1));
}
out.println("</table>");
out.println("<input type='submit' value='Update' />");
out.println("</form>");

%>

 

 
      </div>
    </div>
    <footer>
      <p>Copyright &copy; Hire A CAB
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




