<%@page import="com.aditya.Hotel_Management_System.entity.Booking"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Check Out</title>
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
label {
  
  font-size: large;
  padding: 12px 12px 6px 0;
  display: inline-block;
  margin-right: 6px;
}
input[type=text]{
   width: 60%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
  margin-right: 10px;
}
.container {
  border-radius: 5px;
  border: 2px solid gray;
  padding: 0px 20px 20px 20px;
  width:70%;
  margin-left:auto;
  margin-right:auto;
  margin-top:20px;
  margin-bottom: 50px;
}
h2 {
text-align: center;
font-size: 150%;
}
.col-25 {
text-align: right;
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
strong{
color:red;
margin-left:16px;
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

<div class="container">
<form id="form2" action="checkout" method="get">
<h2>Check Out</h2>
<div class="row">
    <div class="col-25">
<label>Booking Id </label>
</div>
    <div class="col-75">
<input type="text" name="bid" required><input type="submit" value="Proceed To Check-Out">
</div>
  
</div>
</form>
<br><br>
<%
int biid = 0;
double pamount = 0.0; 
%>

<%
Booking b = (Booking) request.getAttribute("cout");							//Getting object of Booking on which check out operation is going to be performed.
if(b!=null){
out.println("<table border=1px class= 'table2'><tr><th>Booking Id</th><th>Coustomer Name</th><th>Mobile No.</th><th>Room Type</th><th>No. of Guests</th><th>No. of Rooms</th><th>No. of Days</th><th>Total Booking Cost</th><th>Advance Paid</th><th>Pending Amount</th></tr><tr><td>"+b.getBid()+"</td><td>"+b.getCname()+"</td><td>"+b.getCmobile()+"</td><td>"+b.getTroom()+"</td><td>"+b.getGuests()+"</td><td>"+b.getNroom()+"</td><td>"+b.getNdays()+"</td><td>"+b.getTotalAmount()+"</td><td>"+b.getAdvance()+"</td><td>"+(b.getTotalAmount()-b.getAdvance())+"</td></tr></table>");
pamount = b.getTotalAmount()-b.getAdvance();								//Calculating Pending amount.
out.print("<br><strong> Amount to be paid is "+pamount+"</strong>");
biid=b.getBid();
}
%>

<br><br>

<form id="form" action="deletebooking" method="get" id="form" style="display:none">

<input type="hidden" name="bid"  value="<%= biid %>">
<input type="hidden" name="pamount"  value="<%= pamount %>">
<div class="row">
    <div class="col-25">
<label>Pay Remaining Amount</label>
 </div>
    <div class="col-75">
 <input type="text" id="ramount" name="ramount" required><input type="submit" onclick="confirmation()" value="Check-Out">
 </div>
</div>
</form>
</div>

<script>
if(<%= biid %> != 0){												//Showing only one form at a time on same page.
		document.getElementById('form').style.display='block';
		document.getElementById('form2').style.display='none';
	}
var f = document.getElementById('form');
function confirmation(){
	var temp = document.getElementById('ramount').value;			//Getting value of amount paid while check out.
	if(f.checkValidity()){
	if(<%= pamount%>==temp){										//Checking if amount paid is equal to pending amount or not.
		window.alert("Check-out Successful");
	}else{
		window.alert("Check-out Unsuccessful");
	}}
}	
</script>

</body>
</html>