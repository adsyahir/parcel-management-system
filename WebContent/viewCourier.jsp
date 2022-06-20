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
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
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
    <a href="insertParcelController?sid=${s.staffID}" class="w3-bar-item w3-button w3-padding "> <i class="fa fa-plus fa-fw"></i>  Parcel Registration</a>
    <a href="ListParcelControllerAdmin?sid=${s.staffID}"class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i>  Parcel List</a>
	<a href="ViewCourierController?sid=${s.staffID}" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-eye fa-fw"></i> Courier Information</a>
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

    <h1>Courier Information</h1>

    <table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
	 <tr>
        <td>Parcel id</td>
        <td>Staff id</td>
        <td>Staff Name</td>
         <td>Courier Name</td>
        
      </tr>
      	<c:forEach items="${c}" var="c">
      <tr>
		<td><c:out value="${c.pid}" /></td>
		<td><c:out value="${c.staffid}" /></td>
		<td><c:out value="${c.staff.staffName}" /></td>
		<td><c:out value="${c.parcel.pcouriername}" /></td>
      </tr>
      </c:forEach>

    </table><br>
  </div>
 
 