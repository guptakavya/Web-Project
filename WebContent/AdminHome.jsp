<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11">
<title>Reader's Delight</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout.css" type="text/css" />
<script type="text/javascript" src="scripts/mootools.js"></script>
</head>
<body id="top">
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
  <div id="intro"><centre><h1><font color='red'>WELCOME ADMIN</font></h1></centre></div></font>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col4">
  <div class="centre">
    <h1 id="title">
	<%
            if(session.getAttribute("admin")==null)
            {
                response.sendRedirect("AdminLogin.jsp");   
               
            }   
      
      out.println("<div style='float:right'><a href='logout.jsp' style='color:black;'><img src='images/demo/logout.jpg'></a></div>");
    %>

	
	</div></h1></br> </br>
	<div></br> </br>
	<a href="UpdateUser.jsp" style="float:center;color:blue;"><h1><b>UPDATE USERS</b></h1></a></br> </br>
	<a href="DeleteUsers.jsp" style="float:center;color:blue;"><h1><b>DELETE USERS</b></h1></a></br> </br>
	<a href="View.jsp" style="float:center;color:blue;"><h1><b>VIEW CARTS</b></h1></a></br> </br>
	</div>
	
	 <br class="clear" />
  </div>
<!-- ####################################################################################################### -->

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
