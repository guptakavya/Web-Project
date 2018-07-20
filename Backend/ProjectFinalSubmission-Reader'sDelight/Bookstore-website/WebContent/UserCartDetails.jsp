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
<h3> Shopping History of Items Purchased</h3>

<%
String uname=(String)session.getAttribute("UNAME");

//System.out.println(uname);
String bought="YES";

String sql="select * from cart where uname=? and bought=?";
ResultSet rs=Conn.fetchHistory(sql,uname,bought);
out.println("<form action='UserReviewProcess.jsp' method='post'>");

out.println("<table>");
out.println("<tr><td></td>");
out.println("<td>CARTID</td>");

out.println("<td>BOOKID</td>");	
out.println("<td>TITLE</td>");
out.println("<td>PRICE</td>");
out.println("<td>QUANTITY</td>");
out.println("<td>DATE PURCHASED</td>");
out.println("<td>MY REVIEW</td></tr>");
while(rs.next())
{
	out.println("<tr><td><input type='radio' name='cid' value='"+rs.getString(8)+"' /></td>");
			out.println("<td>"+rs.getString(8)+"</td>");
			//out.println("<td>"+rs.getString(1)+"</td>");
		
			//out.println("<td>"+rs.getString(3)+"</td>");
			
			out.println("<td>"+rs.getString(5)+"</td>");
			
			out.println("<td>"+rs.getString(6)+"</td>");
			
			out.println("<td>"+rs.getString(7)+"</td>");
			
			out.println("<td>"+rs.getString(2)+"</td>");
			out.println("<td>"+rs.getString(3)+"</td>");
			if(rs.getString(9)!=null)
			{out.println("<td>"+rs.getString(9)+"</td>");}
			else
			{out.println("<td>"+"</td>");}
			out.println("<td bgcolor='#FF6699'><input type='submit' value='Add/Modify Review'></td></tr>");
	}
out.println("</table>");

out.println("</form>");
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



