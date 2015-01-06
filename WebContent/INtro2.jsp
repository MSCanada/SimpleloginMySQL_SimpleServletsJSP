<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#top {
    text-align:center;
    padding:100px;
}
#bottom {
	background-color:#eeeeee;
    text-align:center;   
    padding:5px;	      
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%
String username=request.getParameter("username");
String password=request.getParameter("password");
boolean s=(username.equals("suhail") && password.equals("cricket"));

if (s==false)
{
	response.sendRedirect("Intro.jsp");
}

%>
<div id="top"></div>
<div id="bottom">
<p> Welcome to the online registration system of Hotel Management. 
<br>
What would you like to do.
</p>
<form action="Enter.jsp">
<input type="radio" name="operation" value="enter" checked>Enter Data
<br>
<input type="radio" name="operation" value="access">Access Data
<br><br>
<input type="submit" value="Submit">
</form> 










</div>
</body>
</html>