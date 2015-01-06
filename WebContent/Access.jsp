<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %> 
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
<title>Access.jsp</title>
</head>
<body>
<%!
Connection con;
Statement st;
ResultSet rs;

String id_data;
String idguests;
String name;
String  gender;
String codreservations;
String date_start;
String date_end;
String status_;
String payment;
String room_number;
String description;
String occupants;
%>
<%! public void initialize() 
{
id_data="0";

}
%>


<%! public void DBConnect()

{	
		try{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","cricket");
		st=con.createStatement();
		
	}
	catch(Exception ex){
		System.out.println("Error:"+ex);
	
}
}

%>
<%DBConnect(); %>

<%! public void execute_test(String table,String data)

{
		try{
			
			
			String query ="select * from "+table+" where idguests='"+data+"'";
			
			rs=st.executeQuery(query);
			
				}
	catch(Exception ex){
		System.out.println(ex);
	}
		
			}
%>

<div id="top">
<form method="post" action="Access.jsp">
Enter your ID Number: <input type="text" name="id_data">
<br><br><br><input type="submit" value="Submit">
</form>
</div>




<%
String id_data=request.getParameter("id_data");

execute_test("guests",id_data);
while(rs.next()){
			
	 idguests=rs.getString("idguests");
	 name=rs.getString("name");
	 gender=rs.getString("gender");
}


execute_test("reservations",id_data);
while(rs.next()){
			
	 codreservations=rs.getString("codreservations");
	 date_start=rs.getString("date_start");
	 date_end=rs.getString("date_end");
	 payment=rs.getString("payment");
	 status_=rs.getString("status_");
	 occupants=rs.getString("hosted_guests_number");
	 
}

execute_test("room_types",id_data);
while(rs.next()){
			
	 room_number=rs.getString("idtype");
	 description=rs.getString("description");
	}

%>

<div id="bottom">
<table style="width:100%">
  <tr>
    <td>ID Number:<%=idguests%></td>
    <td>Name:<%=name%></td>		
    <td>Gender:<%=gender%></td>
  </tr>
  <tr>
    <td>Room Number:<%=room_number%></td>
    <td>Description:<%=description%></td>		
    <td>Number of Occupants:<%=occupants%></td>
  </tr>
  <tr>
    <td>Reservation Code:<%=codreservations%></td>
    <td>Start Date:<%=date_start%></td>		
    <td>End Date:<%=date_end%></td>
  </tr>
  <tr>
  <td> Payment Made through:<%=payment%> </td>
  <td> Status: <%=status_%></td>
  </tr>
</table>
</div>











</body>
</html>