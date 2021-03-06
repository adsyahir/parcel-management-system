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
<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
</style>
<body class="w3-light-grey">

<!-- Top container -->
<div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
  <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i>  Menu</button>
  <span class="w3-bar-item w3-right">Logo</span>
</div>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
  <div class="w3-container w3-row">
    <div class="w3-col s4">
      <img src="/w3images/avatar2.png" class="w3-circle w3-margin-right" style="width:46px">
    </div>
    <div class="w3-col s8 w3-bar">
      <span>Welcome, <strong>Mike</strong></span><br>
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
    <a href="InsertParcelControllerStaff?sid=${s.staffID}" class="w3-bar-item w3-button w3-padding "> <i class="fa fa-eye fa-fw"></i>  Add Parcel</a>
    <a href="ListParcelController?sid=${s.staffID}"class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-plus fa-fw"></i>  List Parcel</a>
	<a href="viewCourier.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-plus fa-fw"></i> View Courier</a>
	<a href="UpdateStaffController?sid=${s.staffID}" class="w3-bar-item w3-button w3-padding"><i class="fa fa-plus fa-fw"></i> Update Information</a>
	<a href="LogoutController" class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i>  Logout</a>
  </div>
</nav>
<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">
  <div class="w3-container">
    <h1>Parcel Information</h1>

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
    <td><a href="ViewParcelController?pid=<c:out value="${p.pid}" />"><c:out value="${p.pid}" /></a></td>
    <td ><c:out value="${p.psendname}" /></td>
    <td ><c:out value="${p.preceivername}" /></td>
    <td ><c:out value="${p.ppostcode}" /></td>
    <td ><c:out value="${p.pdate}" /></td>
    <td ><c:out value="${p.pcouriername}" /></td>
    <td><a href="addTracking?pid=<c:out value="${p.pid}" />&sid=${s.staffID}">Add Tracking</a></td>
    <td><a href="updateTracking?pid=<c:out value="${p.pid}" />&sid=${s.staffID}">Update Tracking</a></td>
    <td><a href="DeleteParcelController?pid=<c:out value="${p.pid}" />&sid=${s.staffID}">Delete</a></td>
    </tr>
    </c:forEach>
    
    </table><br>
  </div>