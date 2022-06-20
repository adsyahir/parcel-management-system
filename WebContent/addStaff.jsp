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
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
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
</head>
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
    <a href="insertParcelController?sid=${s.staffID}" class="w3-bar-item w3-button w3-padding"> <i class="fa fa-plus fa-fw"></i>  Parcel Registration</a>
    <a href="ListParcelControllerAdmin?sid=${s.staffID}"class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i>  Parcel List</a>
	<a href="ViewCourierController?sid=${s.staffID}" class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i> Courier Information</a>
   <c:choose >
 <c:when test="${s.staffPosition.equals('staff')}">
    <div hidden="hidden">
	 <a href="StaffController?sid=${s.staffID}" class="w3-bar-item w3-button w3-padding w3-blue" ><i class="fa fa-eye fa-fw" ></i> Staff Registration</a>
	 </div>
	 </c:when> 
	  <c:otherwise>
        <a href="StaffController?sid=${s.staffID}" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-plus fa-fw"></i> Staff Registration</a>
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
  <h2 style="margin-bottom:50px; margin-left:200px;">Staff Registration</h2>
  <form class="form-horizontal" action="AddStaffController"  method="post">
    <div class="form-group">
      <label class="control-label col-sm-2" for="staff">Staff Name</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="email" placeholder="Enter Name" name="sname" required>
        <input type="text"  value="${s.staffID}" name="sid" hidden="hidden">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Staff Password</label>
      <div class="col-sm-4">          
        <input type="text" class="form-control" id="pwd" placeholder="Enter Password" name="spassword" required>
      </div>
    </div>
   <div class="form-group">
      <label class="control-label col-sm-2" for="staff">Staff Position</label>
      <div class="col-sm-2">
    <select class="form-control" name="sposition" id="position" readonly>
      
      <option value="staff" selected>Staff</option>
   
    </select>        
     </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2" for="staff">Staff Email</label>
      <div class="col-sm-4">
        <input type="email" class="form-control" id="email" placeholder="Enter Email" name="semail" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="staff">Staff Address</label>
      <div class="col-sm-5">
         <textarea class="form-control" placeholder="Enter Address"id="address" rows="3" name="saddress" required></textarea>
      </div>
    </div> 
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
       <button type="reset" class="btn btn-default">Reset</button>
        <button type="submit" id="submit" class="btn btn-default">Submit</button>
 
      <br> <span style="color:red;" id="success">${success} </span>
      </div>
      
    </div>

  </form>
</div>
</div>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script>

$("#success").show().delay(5000).fadeOut();
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

var msg="${s.staffID}";
if(msg !=" "){
	$("#message").show();
	setTimeout(function() { $("#message").hide(); }, 3000);	};
}else if(msg==" "){
	 Alert('Add failed');

$("#submit").click(function()
{
	
	var name=$("#name").val();
	var email=$("#email").val();
	var  password=$("#pwd").val();
	var position=$("#position").val();
	var address=$("#address").val();
	
	if(name !=" " && email !=" " && password !=" " && position !=" " && address !=" ")
	{
		$("#message").show();
		setTimeout(function() { $("#message").hide(); }, 3000);	}
	
    })
</script>
</body>
</html>