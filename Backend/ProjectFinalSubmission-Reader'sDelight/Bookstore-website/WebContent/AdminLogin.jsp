<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11">
<title>Reader's Delight</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout.css" type="text/css" />
<script type="text/javascript" src="scripts/mootools.js"></script></head>
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
  <div id="intro"></div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col4">
  <div class="overview">
  
  <%
  if(session.getAttribute("admin")!=null)
  {
	  response.sendRedirect("/AdminHome.jsp");
  }
  
  
  %>
    
      <br />
	  <br />
	  <br />
	  <br />
	  <div style="margin-left:300px;">
	  <h1><b>Admin Login Here</h1>
      <img class="imgl" src="images/demo/Admin.jpg" alt="" width="125" height="125"  />
      <form action="AdminLogin" method="post">
      <table style="width:300px;">
	  <tr><td>UserName</td><td><input type="text" name="username" /></td></tr>
	  <tr><td>Password</td><td><input type="password" name="password" /></td></tr>
	  <tr><td>        </td><td><input type="submit" value="Login" /></td></tr>
	  <tr><td>        </td><td> <a href="Register.html" style="float:right; font-weight:bold; color:#000099;"></a></td></tr>
	  </table>
	  </form>
	  </div>
	  
	  <br />
	  <br />
	  <br />
	  <br />
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->

<!-- ####################################################################################################### -->
<div class="wrapper col6">
  <div id="copyright">
    <p class="fl_left"> <a href="#"></a></p>
    <p class="fl_right"><a href="http://www.os-templates.com/" title="Free Website Templates"></a></p>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<script type="text/javascript" src="scripts/toggle.js"></script>
</body>
</html>
