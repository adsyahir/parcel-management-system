<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <% 
  //prevent Caching of JSP pages
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  //get the session and check if session is null, redirect to login page
  if(session.getAttribute("currentSessionUser")==null){
	  System.out.println("No session");
      response.sendRedirect("login.jsp");
  }
  
  
  %> 

<!DOCTYPE html>
<html>
<title>Add Parcel Information</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}

.row
{ 
  display:flex;
  justify-content:center;
  flex-direction:row;
}

.w3-bar-block a
{
 text-decoration:none;
}
h5
{
 font-size:18px;
}
.form-horizontal .control-label {
    padding-top: 7px;
    margin-bottom: 0;
    text-align: left;
}


</style>
<body class="w3-light-grey">

<!-- Top container -->
<div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
  <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i>  Menu</button>
  <span class="w3-bar-item w3-right">SPEED POST</span>
</div>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
  <div class="w3-container w3-row">
    <div class="w3-col s8 w3-bar">
      <span>Welcome, <strong><c:out value="${s.staffName}" /></strong></span><br>
      <a href="#" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i></a>
      <a href="#" class="w3-bar-item w3-button"><i class="fa fa-user"></i></a>
      <a href="#" class="w3-bar-item w3-button"><i class="fa fa-cog"></i></a>
    </div>
  </div>
  <hr>
  <div class="w3-container">
    <h5>Dashboard</h5>
  </div>
  
    <div class="w3-bar-block">
    <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close Menu</a>
    <a href="insertParcelController?sid=${s.staffID}" class="w3-bar-item w3-button w3-padding w3-blue"> <i class="fa fa-plus fa-fw"></i>  Parcel Registration</a>
    <a href="ListParcelControllerAdmin?sid=${s.staffID}"class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i>  Parcel List</a>
	<a href="ViewCourierController?sid=${s.staffID}" class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i> Courier Information</a>
   <c:choose >
 <c:when test="${s.staffPosition.equals('staff')}">
    <div hidden="hidden">
	 <a href="StaffController?sid=${s.staffID}" class="w3-bar-item w3-button w3-padding" ><i class="fa fa-eye fa-fw" ></i> Staff Registration</a>
	 </div>
	 </c:when> 
	  <c:otherwise>
        <a href="StaffController?sid=${s.staffID}" class="w3-bar-item w3-button w3-padding"><i class="fa fa-plus fa-fw"></i> Staff Registration</a>
    </c:otherwise>
	 </c:choose>
	 <c:choose >
	 <c:when test="${s.staffPosition.equals('staff')}">
	     <div hidden="hidden">
	     <a href="ListStaffController?sid=${s.staffID}" class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i> Staff List</a>
	 	 </div>
	 	</c:when>
	 	<c:otherwise>
	 	<a href="ListStaffController?sid=${s.staffID}" class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i> Staff List</a>
    </c:otherwise>
	 </c:choose>
	<a href="UpdateStaffController?sid=${s.staffID}" class="w3-bar-item w3-button w3-padding"><i class="fa fa-plus fa-fw"></i> Update Information</a>
	<a href="LogoutController" class="w3-bar-item w3-button w3-padding"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
  </div>
  
</nav>


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:700px;margin-top:43px;">
<div class="container background">
  <h2 style="margin-bottom:50px; margin-left:200px;">Register Parcel Details</h2>
  <form class="form-horizontal" action="addParcelControllerAdmin"  method="post">
  <input type="text" placeholder="Parcel Sender Name" name="sid" value="${s.staffID}" hidden="hidden">
    <div class="form-group">
      <label class="control-label col-sm-2 " for="staff">Sender Name</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="email" placeholder="Enter Sender Name" name="psendname" required>
      </div>
    </div>
   <div class="form-group">
      <label class="control-label col-sm-2" for="staff">Sender Address</label>
      <div class="col-sm-5">
         <textarea class="form-control" placeholder="Enter Sender Address"id="exampleFormControlTextarea1" rows="3" name="psendadd" required></textarea>
      </div>
    </div>
   <div class="form-group">
      <label class="control-label col-sm-2" for="staff">Sender Phone Number</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="position" placeholder="Enter Sender Phone Number" name="psendphone" required>
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2" for="staff">Sender Email</label>
      <div class="col-sm-4">
        <input type="email" class="form-control" id="email" placeholder="Enter Sender Email" name="psendemail" required>
      </div>
    </div>
   <div class="form-group">
      <label class="control-label col-sm-2" for="staff">Receiver Name</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="email" placeholder="Enter Receiver Name" name="preceivername" required>
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2" for="staff">Receiver Address</label>
      <div class="col-sm-5">
         <textarea class="form-control" placeholder="Enter Receiver Address"id="exampleFormControlTextarea1" rows="3" name="preceiveradd" required></textarea>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="staff">Receiver Phone Number</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="position" placeholder="Enter Receiver Phone Number" name="preceiverphone" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="staff">Receiver Email</label>
      <div class="col-sm-4">
        <input type="email" class="form-control" id="position" placeholder="Enter Receiver Phone Email" name="preceiveremail" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="staff">Parcel Postcode</label>
      <div class="col-sm-2">
        <input type="number" class="form-control" id="position" placeholder="Enter Postcode" name="ppostcode" required>
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2" for="staff">Parcel Details</label>
      <div class="col-sm-5">
         <textarea class="form-control" placeholder="Enter Parcel Details"id="exampleFormControlTextarea1" rows="3" name="pdetail" required></textarea>
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2" for="staff">Parcel Time</label>
      <div class="col-sm-2">
       <input type="time" class="form-control" id="formtime" name="ptime" readonly>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="staff">Parcel Date</label>
      <div class="col-sm-2">
       <input type="date" class="form-control" id="formdate" placeholder="Enter Date" name="pdate" readonly>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="staff">Parcel Weight</label>
      <div class="col-sm-2">
        <input type="text" class="form-control" id="position" placeholder="Enter Parcel Weight" name="pweight" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="staff">Choose a courier</label>
      <div class="col-sm-2">
      <select class="form-control" name="pcouriername" id="pcouriername" required>
      <option value="" selected disabled>Select Courier</option>
      <option value="jnt">JnT</option>
    <option value="poslaju">PosLaju</option>
    <option value="gdex">GDex</option>
    <option value="fedex">FedEx</option>
    </select>     
</div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
       <button type="reset" class="btn btn-default">Reset</button>
        <button type="submit" class="btn btn-default">Submit</button>
        <br> <span style="color:red;" id="success">${success} </span>
         
      </div>
    </div>
  </form>
</div>
 
<script>
// Get the Sidebar
var mySidebar = document.getElementById("mySidebar");

// Get the DIV with overlay effect
var overlayBg = document.getElementById("myOverlay");

// Toggle between showing and hiding the sidebar, and add overlay effect
function w3_open() {
  if (mySidebar.style.display === 'block') {
    mySidebar.style.display = 'none';
    overlayBg.style.display = "none";
  } else {
    mySidebar.style.display = 'block';
    overlayBg.style.display = "block";
  }
}

// Close the sidebar with the close button
function w3_close() {
  mySidebar.style.display = "none";
  overlayBg.style.display = "none";
}
var date = new Date();

var day = date.getDate(),
    month = date.getMonth() + 1,
    year = date.getFullYear(),
    hour = date.getHours(),
    min  = date.getMinutes();

month = (month < 10 ? "0" : "") + month;
day = (day < 10 ? "0" : "") + day;
hour = (hour < 10 ? "0" : "") + hour;
min = (min < 10 ? "0" : "") + min;

var today = year + "-" + month + "-" + day,
    displayTime = hour + ":" + min; 

document.getElementById('formdate').value = today;      
document.getElementById("formtime").value = displayTime;
</script>

</body>
</html>