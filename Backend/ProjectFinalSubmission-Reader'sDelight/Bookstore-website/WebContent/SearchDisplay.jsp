 <%@ page import="java.sql.*" %>
  <%@ page import="java.util.*" %>
  <%@ page import="bean.*" %>
  <%@ page import="dao.*" %>
<!DOCTYPE HTML>
<html>

<head>
  <title>Search</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
 <script src="js/sorttable.js"></script>
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
          
          <h1><a href="Index.html">Reader's Delight- Bookstore</a></h1>
          <h2>Simple. Contemporary. Affordable </h2>
        </div>
      </div>
      <nav>
        <ul class="sf-menu" id="nav">
          <li><a href="Index.html">Home</a></li>
          <li><a href="UserLogin.jsp">User Login</a></li>
          <li class="selected"><a href="Search.jsp">Search</a></li>
          <li><a href="AdminLogin.jsp">Admin Login </a></li>
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
          <h5>Dec 30st, 2015</h5>
          <p>We are offering a 20% discount to all new customers.<br /><a href="LatestNews.jsp">Read more</a></p>
        </div>
      </div>
      <div class="content" align="center">
        <h1>Search Results! </h1>
      
      
        <%
        String uname=(String)session.getAttribute("UNAME");
        session.setAttribute("UNAME",uname); %>
       
		<%
		
		
		String title=(String)session.getAttribute("title");
		String author=(String)session.getAttribute("author");
		String genre=(String)session.getAttribute("genre");
			
		
		//out.println(uname+" "+title+" "+author+" "+genre);

		BookBean obj=new BookBean();
		obj.setUname(uname);
		obj.setAuthor(author);
		obj.setTitle(title);
		obj.setGenre(genre);
		
		out.println("<form action='AddCartServlet' method='post'>");
		String sql="select * from books where title=? or author=? or genre=?";
		ResultSet rs=Conn.searchBook(obj, sql);
		
		out.println("<table class='sortable' border='1'><tr><th><th>BookId</th><th>Genre</th><th>Title</th><th>Author</th><th>cost</th></tr>");
		try {
			while(rs.next()){
				out.println("<tr><td><input type='radio' name='bookid' value='"+rs.getString(1)+"' /></td>");
			out.println("<td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td></tr>");
			session.setAttribute("title",rs.getString(3));
			session.setAttribute("price",rs.getString(5));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		out.println("</table>");
		out.println("<input type='submit' value='Add to Cart'>");
		session.setAttribute("UNAME",uname);
		
		out.println("</form>");
		
		%>
	<h3><a href="Review.jsp"></a></h3>
		
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
