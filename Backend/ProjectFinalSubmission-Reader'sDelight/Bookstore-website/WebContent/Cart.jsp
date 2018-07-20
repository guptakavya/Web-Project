<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
 <%@ page import="dao.*" %>


<html>

<head>
  <title>Shopping Cart</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <!-- modernizer enables HTML5 elements and feature detects -->
  <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js" ></script>
  <script>

	function myfunction(){
		$(this).parents('tr').remove();
		alert("This");
	};

</script>
  
</head>

<body>
<%
            if(session.getAttribute("UNAME")==null)
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
          <li><a href="UserLogin.jsp">User Login</a></li>
          <li><a href="Search.jsp">Search</a></li>
           <li class="selected"><a href="Cart.jsp">Shopping Cart</a></li>
           <li><a href="UserCartDetails.jsp">Shopping History</a></li>
          <li><a href="AdminLogin.jsp">Admin Login</a></li>
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
          <p>2016 sees the redesign of our website. Take a look around and let us know what you think.<br />
            <a href="LatestNews.jsp">Read more</a></p>
          <h4>20% Discount</h4>
          <h5>Dec  30st, 2015</h5>
          <p>We are offering a 20% discount to all new customers.<br /><a href="LatestNews.jsp">Read more</a></p>
        </div>
      </div>
      <div class="content">
      <h3> Items in Cart</h3>
      
      <h4><a href="Search.jsp">Add More Items</a></h4>
<%
String uname=(String)session.getAttribute("UNAME");
String bought="NO";
String sql="select * from cart where uname=? and bought=?";
ResultSet rs=Conn.fetchUserData5(sql,uname,bought);
out.println("<form method='post' action='CartServlet'>");
out.println("<table id='table1' border=1><br/>");

	out.println("<tr><th></th><th>Cart ID</th><th>BOOKID</th><th>TITLE</th><th>DATE</th><th>PRICE</th><th>QUANTITY</th></tr>");
	while(rs.next())
	{
		out.println("<tr id='no'>");
		out.println("<td><input type='checkbox' name='cid' value='"+rs.getString(8)+"' /></td>");
		out.println("<td>"+rs.getString(8)+"</td>");
		//out.println("<td>"+rs.getString(1)+"</td>");
		out.println("<td>"+rs.getString(5)+"</td>");
		out.println("<td>"+rs.getString(6)+"</td>");
		
		out.println("<td>"+rs.getString(3)+"</td>");
		out.println("<td>"+rs.getString(7)+"</td>");
		session.setAttribute("price",rs.getString(7));
		out.println("<td><input type='text' name='quantity' value='"+rs.getString(2)+"'/></td>");
		//out.println("<td>"+rs.getString(4)+"</td>");
		
		
		
		out.println("</tr>");
	}
	out.println("</table>");out.println("<br><br>");
	out.println("<center><input type='submit' value='Buy Now' /></center><br/>");
//	out.println("<center><input type='button' class='deleterow' onClick='myFunction()' value='Delete Row' /></center>");
	
out.println("</form>");
//out.println("<td><button onclick='myFunction()'>Delete Row</button></td>");
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
