<%@page import="com.aditya.Hotel_Management_System.entity.Room"%>
<%@page import="java.util.List"%>
<%@page import="com.aditya.Hotel_Management_System.entity.Booking"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Bookings</title>
<style> 
html { 
  background: url(img/lightBlue.jpg) no-repeat center fixed; 
  background-size: cover;
}
body {
  margin: 0;
}
.header {
  color: #000000;
  padding: 20px;
  text-align: center;
background: linear-gradient(to bottom right, #33ccff 23%, #99ff99 111%);
background-blend-mode: overlay;
text-shadow: 0px 0px 5px #33ccff, 0px 0px 5px #33ccff, 0px 0px 5px #33ccff;
 word-spacing: 10px;
}

hr{
height:10px;
border-width:0;
color:black;
background-color:gray;
margin:0;
}
input[type=text]{
  
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}
input[type=submit] {
  background-color: #04AA6D;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
input[type=submit]:hover {
  background-color: #45a049;
}
span{
display:inline-block;
margin-left:6px;
margin-top:20px;
}
label {
  font-size: large;
  padding: 12px 12px 6px 0;
  display: inline-block;
  margin-right: 6px;
}

h2 {
text-align: center;
}
h3 {
margin-left:16px;
margin-bottom:none;
padding:none;
}
.table2{
border-collapse: collapse;
border: 2px solid #808080;
margin-bottom:10px;
text-align:center;
margin-left:14px;
}
#table2{
border-collapse: collapse;
border: 2px solid #808080;
margin-bottom:none !important;
text-align:center;
margin-left:14px;
}
.table2 th{
background-color: black;
border: 2px solid #808080;
color: white;
padding: 8px;

}
.table2 td{
background-color:#e6e6e6;
border: 2px solid #808080;
  color: black;
  padding: 8px;
}
#table1 td {
  text-align: center;
  padding: 18px;
}
#table1 th {
  padding: 18px 0 0 0;
  font-size: 150%;
}
#table1{
border: 2px solid gray;
border-radius: 5px;
width: 80%;
margin-left: auto;
margin-right: auto;
margin-bottom: 18px;
}
a{
text-decoration: none;
}
a:active {
  color: #000000;
}
a:link {
  color: #000000;
}
a:visited {
  color: #000000;
}
</style>
</head>
<body>
<div class="header">
  <a href="home.jsp"><h1>HOTEL MANAGEMENT SYSTEM</h1></a>
</div>
<hr>
<h2>View Records</h2>
<table id="table1">
<tr>
<th>View Bookings</th><th>View Rooms</th></tr>
<tr>
<td>

<form action="viewBooking" method="get">
<label>Booking Id</label> <Input type="text" name="bid" required> <br><br>
<input type="submit" value="View Booking">
</form>

</td>
<td>

<form action="viewRoom" method="get">
<label>Booking Id</label> <Input type="text" name="bid" required><br><br>
<input type="submit" value="View Booked Room">
</form>

</td>
</tr>
<tr>
<td colspan="2">
<span>
<form action="viewAllBookings" method="get">
	<input type="submit" value="View All Bookings">
</form>
</span><span>
<form action="viewAllRooms" method="get">
	<input type="submit" value="View All Rooms">
</form>
</span><span>
<form action="allRecords" method="get">
	<input type="submit" value="View All Records">
</form>
</span>
</td></tr>
</table>
<%
String str = (String)request.getAttribute("var");
List<Room> rlist = (List<Room>)request.getAttribute("viewRoom");				//Getting list of particular Booking Id.
if(rlist!=null){
	out.println("<h3>Room Details</h3>");
	out.println("<table class= 'table2' border=1px><tr><th>Room No.</th><th>Booking Id</th><th>Coustomer Name</th><th>Room Type</th><th>Check-in Date</th><th>Check-out Date</th></tr>");
	for(Room r:rlist)
	{
		out.println("<tr><td>"+r.getRno()+"</td><td>"+r.getBid()+"</td><td>"+r.getCname()+"</td><td>"+r.getTroom()+"</td><td>"+r.getCidate()+"</td><td>"+r.getCodate()+"</td></tr>");
	}
	out.println("</table>");
}

ArrayList<Room> arlist = (ArrayList<Room>)request.getAttribute("allRooms");		//Getting list of all booked rooms.
if(arlist!=null){
	out.println("<h3>Room Details</h3>");
	out.println("<table border=1px class= 'table2'><tr><th>Room No.</th><th>Booking Id</th><th>Coustomer Name</th><th>Room Type</th><th>Check-in Date</th><th>Check-out Date</th></tr>");
	for(Room r:arlist)
	{
		out.println("<tr><td>"+r.getRno()+"</td><td>"+r.getBid()+"</td><td>"+r.getCname()+"</td><td>"+r.getTroom()+"</td><td>"+r.getCidate()+"</td><td>"+r.getCodate()+"</td></tr>");
	}
	out.println("</table>");
}

Booking b1 = (Booking) request.getAttribute("viewBooking");						//Getting object of Booking which we want to display.
if(b1!=null){
	out.println("<h3>Booking Details</h3>");
	out.println("<table border=1px class= 'table2'><tr><th>Booking Id</th><th>Coustomer Name</th><th>Mobile No.</th><th>Room Type</th><th>No. of Guests</th><th>No. of Rooms</th><th>No. of Days</th><th>Total Booking Cost</th><th>Advance Paid</th><th>Pending Amount</th></tr><tr><td>"+b1.getBid()+"</td><td>"+b1.getCname()+"</td><td>"+b1.getCmobile()+"</td><td>"+b1.getTroom()+"</td><td>"+b1.getGuests()+"</td><td>"+b1.getNroom()+"</td><td>"+b1.getNdays()+"</td><td>"+b1.getTotalAmount()+"</td><td>"+b1.getAdvance()+"</td><td>"+(b1.getTotalAmount()-b1.getAdvance())+"</td></tr></table>");
}
ArrayList<Booking> blist = (ArrayList<Booking>) request.getAttribute("allBookings");	//Getting list of all Bookings.
if(blist!=null){
	out.println("<h3>Booking Details</h3>");
out.println("<table border=1px id='table2' class= 'table2'><tr><th>Booking Id</th><th>Coustomer Name</th><th>Mobile No.</th><th>Room Type</th><th>No. of Guests</th><th>No. of Rooms</th><th>No. of Days</th><th>Total Booking Cost</th><th>Advance Paid</th><th>Pending Amount</th></tr>");
for(Booking b:blist)
{
	out.println("<tr><td>"+b.getBid()+"</td><td>"+b.getCname()+"</td><td>"+b.getCmobile()+"</td><td>"+b.getTroom()+"</td><td>"+b.getGuests()+"</td><td>"+b.getNroom()+"</td><td>"+b.getNdays()+"</td><td>"+b.getTotalAmount()+"</td><td>"+b.getAdvance()+"</td><td>"+(b.getTotalAmount()-b.getAdvance())+"</td></tr>");
}
out.println("</table>");
}

ArrayList<Room> allRoomsRec = (ArrayList<Room>)request.getAttribute("allRecofRooms");					//Getting list of all booked rooms.
ArrayList<Booking> allBookingsRec = (ArrayList<Booking>) request.getAttribute("allRecofBookings");		//Getting list of all Bookings.

if(allBookingsRec!=null){
	out.println("<h3>Booking Details</h3>");
out.println("<table border=1px class= 'table2'><tr><th>Booking Id</th><th>Coustomer Name</th><th>Mobile No.</th><th>Room Type</th><th>No. of Guests</th><th>No. of Rooms</th><th>No. of Days</th><th>Total Booking Cost</th><th>Advance Paid</th><th>Pending Amount</th></tr>");
for(Booking b:allBookingsRec)
{
	out.println("<tr><td>"+b.getBid()+"</td><td>"+b.getCname()+"</td><td>"+b.getCmobile()+"</td><td>"+b.getTroom()+"</td><td>"+b.getGuests()+"</td><td>"+b.getNroom()+"</td><td>"+b.getNdays()+"</td><td>"+b.getTotalAmount()+"</td><td>"+b.getAdvance()+"</td><td>"+(b.getTotalAmount()-b.getAdvance())+"</td></tr>");
}
out.println("</table>");
}
out.println("<br><br>");
if(allRoomsRec!=null){
	out.println("<h3>Room Details</h3>");
	out.println("<table border=1px class= 'table2'><tr><th>Room No.</th><th>Booking Id</th><th>Coustomer Name</th><th>Room Type</th><th>Check-in Date</th><th>Check-out Date</th></tr>");
	for(Room r:allRoomsRec)
	{
		out.println("<tr><td>"+r.getRno()+"</td><td>"+r.getBid()+"</td><td>"+r.getCname()+"</td><td>"+r.getTroom()+"</td><td>"+r.getCidate()+"</td><td>"+r.getCodate()+"</td></tr>");
	}
	out.println("</table>");
}

%>
</body>
</html>