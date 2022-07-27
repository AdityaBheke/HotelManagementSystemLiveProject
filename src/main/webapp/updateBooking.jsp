<%@page import="com.aditya.Hotel_Management_System.entity.Room"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Booking</title>
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
	text-shadow: 0px 0px 5px #33ccff, 0px 0px 5px #33ccff, 0px 0px 5px
		#33ccff;
	word-spacing: 10px;
}

hr {
	height: 10px;
	border-width: 0;
	color: black;
	background-color: gray;
	margin: 0;
}

input[type=text] {
	width: 90%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	resize: vertical;
}

input[type=date] {
	width: 90%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	resize: vertical;
}

label {
	padding: 12px 12px 6px 0;
	display: inline-block;
}

input[type=submit] {
	background-color: #04AA6D;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	float: left;
}

input[type=submit]:hover {
	background-color: #45a049;
}

.container {
	border-radius: 5px;
	border: 2px solid gray;
	padding: 20px;
	width: 50%;
	margin-left: auto;
	margin-right: auto;
	margin-top: 20px;
	margin-bottom: 50px;
}

.col-25 {
	float: left;
	width: 25%;
	margin-top: 6px;
}

.col-75 {
	float: left;
	width: 70%;
	margin-top: 6px;
}

.row:after {
	content: "";
	display: table;
	clear: both;
}
strong{
color:red;
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
h2 {
text-align: center;
font-size: 150%;
}
</style>
</head>
<body>
<%
ArrayList<Room> rlist = (ArrayList<Room>) request.getAttribute("var");						//Getting list of all booked rooms.
int availableRooms =20-rlist.size();														//Calculating the number of available rooms.
%>
	<div class="header">

		<a href="home.jsp"><h1>HOTEL MANAGEMENT SYSTEM</h1></a>
	</div>
	<hr>

	<div class="container">
		<form id="form" action="updateBooking" method="get">
			<h2>Update Booking</h2>
			<div class="row">
				<div class="col-25">
					<label>Booking ID</label>
				</div>
				<div class="col-75">
					<input type="text" name="bid" required><br>
					<br>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label>Customer Name</label>
				</div>
				<div class="col-75">
					<input type="text" name="cname" required><br>
					<br>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label>Customer Mobile No.</label>
				</div>
				<div class="col-75">
					<input type="text" name="cmobile" required><br>
					<br>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label>Number of Guests</label>
				</div>
				<div class="col-75">
					<input type="text" name="guests" required><br>
					<br>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label>Number of Rooms</label>
				</div>
				<div class="col-75">
					<input type="text" id="nroom" name="nroom" required><br>
					<%
					out.print("<strong>"+availableRooms + " Rooms available</strong>");
					%><br>
					<br>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label>Type of Room</label>
				</div>
				<div class="col-75">
					<input type="radio" name="troom" value="AC" required><label>AC</label><br>
					<input type="radio" name="troom" value="Non-AC" required><label>Non-AC</label>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label>Check-In Date</label>
				</div>
				<div class="col-75">
					<input type="date" name="cidate" required><br>
					<br>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label>Number of Days</label>
				</div>
				<div class="col-75">
					<input type="text" name="ndays" required><br>
					<br>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label>Advance Amount</label>
				</div>
				<div class="col-75">
					<input type="text" name="advance" required><br> 
					<input type="hidden" name="avlRooms" value="<%=availableRooms%>">
				</div>
			</div>

			<br>
			<div class="row">
				<input type="submit" onclick="confirmation()" value="Update">
			</div>
		</form>
	</div>
<script>
var f = document.getElementById('form');
function confirmation(){
	let ar = document.getElementById('nroom').value;
	if(f.checkValidity()){											//Checking if all fields of form are filled or not.
	if(ar<=<%= availableRooms%>){									//Checking if given number of rooms is less than available rooms.
	    window.alert("Booking Data Updated Successfully");
		}else{
			 window.alert("Number of rooms should be less than "+ <%= availableRooms %>);
		}
	}
}
</script>
</body>
</html>