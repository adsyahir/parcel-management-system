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
<title>List of Parcels</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
a
{
  text-decoration:none;
  color:black;
}
a:hover
{
  color:white;
}
.modal-confirm {		
	color: #636363;
	width: 400px;
}
.modal-confirm .modal-content {
	padding: 20px;
	border-radius: 5px;
	border: none;
	text-align: center;
	font-size: 14px;
}
.modal-confirm .modal-header {
	border-bottom: none;   
	position: relative;
}
.modal-confirm h4 {
	text-align: center;
	font-size: 26px;
	margin: 30px 0 -10px;
}
.modal-confirm .close {
	position: absolute;
	top: -5px;
	right: -2px;
}
.modal-confirm .modal-body {
	color: #999;
}
.modal-confirm .modal-footer {
	border: none;
	text-align: center;		
	border-radius: 5px;
	font-size: 13px;
	padding: 10px 15px 25px;
}
.modal-confirm .modal-footer a {
	color: #999;
}		
.modal-confirm .icon-box {
	width: 80px;
	height: 80px;
	margin: 0 auto;
	border-radius: 50%;
	z-index: 9;
	text-align: center;
	border: 3px solid #f15e5e;
}
.modal-confirm .icon-box i {
	color: #f15e5e;
	font-size: 46px;
	display: inline-block;
	margin-top: 13px;
}
.modal-confirm .btn, .modal-confirm .btn:active {
	color: #fff;
	border-radius: 4px;
	background: #60c7c1;
	text-decoration: none;
	transition: all 0.4s;
	line-height: normal;
	min-width: 120px;
	border: none;
	min-height: 40px;
	border-radius: 3px;
	margin: 0 5px;
}
.modal-confirm .btn-secondary {
	background: #c1c1c1;
}
.modal-confirm .btn-secondary:hover, .modal-confirm .btn-secondary:focus {
	background: #a8a8a8;
}
.modal-confirm .btn-danger {
	background: #f15e5e;
}
.modal-confirm .btn-danger:hover, .modal-confirm .btn-danger:focus {
	background: #ee3535;
}
.trigger-btn {
	display: inline-block;
	margin: 100px auto;
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
    <h5 style="margin-top:20px;">Dashboard</h5>
  </div>
 <div class="w3-bar-block">
    <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close Menu</a>
    <a href="insertParcelController?sid=${s.staffID}" class="w3-bar-item w3-button w3-padding"> <i class="fa fa-plus fa-fw"></i>  Parcel Registration</a>
    <a href="ListParcelControllerAdmin?sid=${s.staffID}"class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-eye fa-fw"></i>  Parcel List</a>
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
<div class="w3-main" style="margin-left:300px;margin-top:43px;">
  <div class="w3-container">
    <h1>LIST OF PARCEL</h1>

    <table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
	 <tr>
        <td>Parcel ID</td>
        <td>Sender Name</td>
		<td>Receiver Name</td>
		<td>Parcel Postcode</td>
		<td>Parcel Date</td>
		<td>Courier Name</td>
		<td colspan="4" style="text-align:center;">Action</td>
      </tr>
      
  <c:forEach items="${parcel}" var="p">
  <tr>
    <td><a style="color:blue;" href="ViewParcelController?pid=<c:out value="${p.pid}" />&sid=${s.staffID}"><c:out value="${p.pid}" /></a></td>
    <td ><c:out value="${p.psendname}" /></td>
    <td ><c:out value="${p.preceivername}" /></td>
    <td ><c:out value="${p.ppostcode}" /></td>
    <td ><c:out value="${p.pdate}" /></td>
    <td ><c:out value="${p.pcouriername}" /></td>
    <td> <a href="viewTrackingAdmin?pid=<c:out value="${p.pid}" />&sid=${s.staffID}"><button type="button" class="btn btn-outline-primary" >View Tracking</button></a></td>
    <td><a href="updateTrackingController?pid=<c:out value="${p.pid}" />&sid=${s.staffID}"><button type="button" class="btn btn-outline-success">Update Tracking</button></a></td>
     <td><div class="text-center"><a  href="#myModal" data-toggle="modal"><button type="button" class="btn btn-outline-danger">Delete</button></a> </div>
     <div id="myModal" class="modal fade">
	<div class="modal-dialog modal-confirm">
		<div class="modal-content">
			<div class="modal-header flex-column">
									
				<h4 class="modal-title w-100">Are you sure?</h4>	
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body">
				<p>Do you really want to delete these records? This process cannot be undone.</p>
			</div>
			<div class="modal-footer justify-content-center">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
				 <a href="DeleteParcelControllerAdmin?pid=${p.pid}&sid=${s.staffID}"><button type="button" class="btn btn-danger">Delete</button></a>
			</div>
		</div>
	</div>
</div>  </td>
    </tr>
    </c:forEach>
    
    </table><br>
  </div>
  

<!-- Modal HTML -->
   