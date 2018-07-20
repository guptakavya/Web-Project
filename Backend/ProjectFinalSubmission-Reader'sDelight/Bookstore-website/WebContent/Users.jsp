<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="dao.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List Of Users</title>
</head>
<body>
<%

String sql="select * from InsertUserInfo";
ResultSet rs=Conn.fetchUserData(sql);
out.println("<table>");
while(rs.next())
{
	String mypath="C:\\Pics\\"+rs.getString(9);
	out.println("<tr>");
	out.println("<td>");
	out.println("<img src='"+mypath+"' height='100' width='100'>");
	out.println("</td>");
	out.println("<td>"+rs.getString(1)+"</td>");
	out.println("<td>"+rs.getString(2)+"</td>");
	out.println("<td>"+rs.getString(3)+"</td>");
	out.println("<td>"+rs.getString(4)+"</td>");
	out.println("<td>"+rs.getString(5)+"</td>");
	out.println("<td>"+rs.getString(6)+"</td>");
	out.println("<td>"+rs.getString(7)+"</td>");
	out.println("<td>"+rs.getString(8)+"</td>");
	out.println("</tr>");
	
}
out.println("</table>");

%>


</body>
</html>