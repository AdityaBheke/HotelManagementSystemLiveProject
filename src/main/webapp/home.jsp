<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HM System</title>
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
button {
  background-color: #04AA6D;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  resize: vertical;
  width: 100%;
  margin-left:auto;
  margin-right:auto;
  margin-top: 16px;

}

.container {
  border-radius: 5px;
  border: 2px solid gray;
  padding: 20px;
  width:40%;
  margin-left:auto;
  margin-right:auto;
  margin-top:20px;
  margin-bottom: 50px;
}
.col-75 {
  
  margin-left:auto;
  margin-right:auto;
  margin-top: 6px;
}
.row:after {
  content: "";
  display: table;
  clear: both;
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
<h1><a href="home.jsp">HOTEL MANAGEMENT SYSTEM</a></h1>
</div>
<hr>
<div class="container">
<form action="Home" method="get">
<input type="hidden" id="option" name="opt" value="0">
<button type="submit" onclick="funct1()">Check In</button>
<button type="submit" onclick="funct2()">Update Booking</button>
<button type="submit" onclick="funct3()">View Records</button>
<button type="submit" onclick="funct4()">Check Out</button>

</form>
</div>
<script>
function funct1(){
	document.getElementById("option").value=1;
}
function funct2(){
	document.getElementById("option").value=2;
}
function funct3(){
	document.getElementById("option").value=3;
}
function funct4(){
	document.getElementById("option").value=4;
}
</script>
</body>
</html>