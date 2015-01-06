<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>  


<%!
Connection con;
Statement st;
ResultSet rs;

%>

<%! public void DBConnect()

{
	
		try{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","cricket");
		st=con.createStatement();
		
	}
	catch(Exception ex){
		System.out.println("Error:"+ex);
	
}
}

%>

<%! public void getData()
{
		try{
		String query ="select * from guests where name='Suhail'";
		st.addBatch("create table junoon(junoon1 int, junoon2 int);");
        st.addBatch("insert into junoon(junoon1,junoon2) values(1,2)");
        st.addBatch("update junoon set junoon1='5',junoon2='8'");
        int[] a=st.executeBatch();	
		rs=st.executeQuery(query);
	System.out.println("Records from Database");
	while(rs.next()){
		
		String idguests =rs.getString("idguests");
		String name =rs.getString("name");
		String identity =rs.getString("identity");
		System.out.println("IDguests:"+idguests+" "+"Name:"+name+" "+"Identity:"+identity);
	}
		
		}
	catch(Exception ex){
		System.out.println(ex);
	}
		
			}
%>


<%
DBConnect();
getData();

%>

<form method="post" action="NewFile.jsp">

<input type="text" name="username">

<input type="submit" value="Submit">
</form>
<%String name=request.getParameter("username"); %>

<%=name%>

<%! public int add(int a,int b)
{
	return a+b;
}


%>

<%int c=add(2,4); %>

<%=c%>

</body>
</html>