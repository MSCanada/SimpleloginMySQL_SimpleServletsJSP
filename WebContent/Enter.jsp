<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#top {
    text-align:center;
    padding:50px;
}
#bottom {
	background-color:#eeeeee;
    text-align:center;   
    padding:5px;	      
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enter.Jsp</title>
</head>
<body>
<% 
String operation=request.getParameter("operation");

if(operation.equals("access"))
{
	response.sendRedirect("Access.jsp");
}

%>
<%!
Connection con;
Statement st;


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

<%! public void getData(String Data_enter)
{
		try{
		
		st.addBatch(Data_enter);
        
        int[] a=st.executeBatch();			
		}
	catch(Exception ex){
		System.out.println(ex);
	}
		
			}
%>
<div id="top"><h1>Enter Your details and click submit when finish</h1></div>
<div id="bottom">
<form action="Enter.jsp">
<table>
<tr>
<td>ID</td>
<td>Full Name</td>
<td>Gender</td>
</tr>

<tr>
<td><input type="text" name="idguests"></td>
<td><input type="text" name="name"></td>
<td><input type="radio" name="gender" value="male" checked>Male
<br>
<input type="radio" name="gender" value="female">Female
</td>
</tr>
<tr>
<td>Room Number</td>
<td>Description</td>
<td>Number of occupants</td>
</tr>
<tr>
<td><input type="text" name="room_number"></td>
<td><input type="text" name="description"></td>
<td><input type="text" name="occupants"></td>
</tr>
<tr>
<td>Enter reservation code</td>
<td>Start Date</td>
<td>End Date</td>
<td>Payment through</td>
<td>Status</td>
</tr>
<tr>
<td><input type="text" name="codreservations"></td>
<td><input type="date" name="date_start"></td>
<td><input type="date" name="date_end"></td>
<td><input type="radio" name="payment" value="Master Card" checked>Master Card
<br>
<input type="radio" name="payment" value="Visa">Visa
</td>
<td><input type="radio" name="status" value="Open" checked>Open
<br>
<input type="radio" name="status" value="Close">Close
</td>
</tr>
</table>
<input type="hidden" name="operation" value="enter">
<br><input type="submit" value="Submit">
</form>
</div>

<% 

String idguests=request.getParameter("idguests");
String name=request.getParameter("name");
String gender=request.getParameter("gender");
String room_number=request.getParameter("room_number");
String description=request.getParameter("description");
String occupants=request.getParameter("occupants");
String codreservations=request.getParameter("codreservations");
String date_start=request.getParameter("date_start");
String date_end=request.getParameter("date_end");
String payment=request.getParameter("payment");
String status=request.getParameter("status");
String data_enter="insert into guests(idguests,name,gender) values('"+idguests+"','"+name+"','"+gender+"')";
String data_enter1="insert into room_types(idtype,description,idguests) values('"+room_number+"','"+description+"','"+idguests+"')";
String data_enter2="insert into rooms(idroom,capacity,idguests) values('"+room_number+"','"+occupants+"','"+idguests+"')";
String data_enter3="insert into reservations(codreservations,date_start,date_end,payment,hosted_guests_number,status_,idroom,idguests) values('"+codreservations+"','"+date_start+"','"+date_end+"','"+payment+"','"+occupants+"','"+status+"','"+room_number+"','"+idguests+"')";
//System.out.println(data_enter);
//System.out.println(data_enter1);
//System.out.println(data_enter2);
//System.out.println(data_enter3);



if(idguests!=(null))
{
	DBConnect();
	getData(data_enter);
	getData(data_enter1);
	getData(data_enter2);
	getData(data_enter3);
	
}

%>

</body>
</html>