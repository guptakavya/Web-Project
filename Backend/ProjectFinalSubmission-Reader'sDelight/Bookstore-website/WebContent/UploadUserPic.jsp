<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" %>   
<%@ page import="dao.*" %>



<% String saveFile=""; %>
<% String file1=""; %>
<% int count=1; %>

 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload User Pic</title>
</head>
<body>
<%

String uname=(String)session.getAttribute("UNAME");

String contentType = request.getContentType();
if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
          DataInputStream in = new DataInputStream(request.getInputStream());
          
          int formDataLength = request.getContentLength();
          byte dataBytes[] = new byte[formDataLength];
          int byteRead = 0;
          int totalBytesRead = 0;
          while (totalBytesRead < formDataLength) {
                  byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                  totalBytesRead += byteRead;
                  }
          String file = new String(dataBytes);
         
          saveFile = file.substring(file.indexOf("filename=\"") + 10);
          saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
          saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
          int lastIndex = contentType.lastIndexOf("=");
          String boundary = contentType.substring(lastIndex + 1,contentType.length());
          int pos;
          pos = file.indexOf("filename=\"");
          pos = file.indexOf("\n", pos) + 1;
          pos = file.indexOf("\n", pos) + 1;
          pos = file.indexOf("\n", pos) + 1;
          int boundaryLocation = file.indexOf(boundary, pos) - 4;
          int startPos = ((file.substring(0, pos)).getBytes()).length;
          int endPos = ((file.substring(0, boundaryLocation))
.getBytes()).length;
       
          FileOutputStream fileOut = new FileOutputStream("C:\\Pics\\"+saveFile); 
          fileOut.write(dataBytes, startPos, (endPos - startPos));
          fileOut.flush();
          fileOut.close();
          
}

String sql="update InsertUserInfo set PIC=? where UNAME=?";
Conn.updateUserPic(saveFile,sql,uname);

response.sendRedirect("UserHome.jsp");

%>
</body>
</html>