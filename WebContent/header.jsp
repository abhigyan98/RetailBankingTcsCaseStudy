<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/dom-to-image/2.6.0/dom-to-image.min.js"
    integrity="sha256-c9vxcXyAG4paArQG3xk6DjyW/9aHxai2ef9RpMWO44A=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.5/jspdf.min.js"></script>
</head>
<style>
#nav{
border-bottom: solid 5px yellow;
}
</style>
<body>


<%if (session.getAttribute("roll")!=null && session.getAttribute("roll").equals("exe")){%>
	<div>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark" id="nav">
	<div class="row" style="padding:5px">
	  <div class="col-sm-6 h2" style="padding:5px"><h2><span style="color:yellow;">FedChoice</span> <span style="color:white;">Bank</span></h2></div>
	   <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    	<span class="navbar-toggler-icon"></span>
	  </button>
	  <div class=" col-sm-66 collapse navbar-collapse" id="navbarSupportedContent">
	  
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	        <a class="nav-link" href="<%=request.getContextPath()%>/home.jsp">Home <span class="sr-only">(current)</span></a>
	      </li>
	      
	       <li class="nav-item">
	        <a class="nav-link" href="<%=request.getContextPath()%>/CustomerManagement">Customer Management</a>
	      </li>
	      
	      <li class="Account nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          Account Management
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="<%=request.getContextPath()%>/create-account-form.jsp">Create Account</a>
	          <a class="dropdown-item" href="<%=request.getContextPath()%>/view-account-form.jsp">View Account</a>
	          <div class="dropdown-divider"></div>
	          <a class="dropdown-item" href="<%=request.getContextPath()%>/delete-account-form.jsp">Delete Account</a>
	        </div>
	      </li>
	      
	      <li class="Status nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          Status Details
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="<%=request.getContextPath()%>/CustomerStatus.jsp">View Customer Status</a>
	          <a class="dropdown-item" href="<%=request.getContextPath()%>/AccountStatus.jsp">View Account Status</a>
	          </div>
	      </li>
	      
	      
	      
	      <li class="nav-item active">
	        <a class="nav-link" href="<%=request.getContextPath()%>/LogOut">Logout <span class="sr-only">(current)</span></a>
	      </li>
	    </ul>
	  </div>
	  </div>
	</nav>
	</div>
	<%}else{%>
	<div>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="row" style="padding:5px">
	  <div class="col-sm-6 h2" style="padding:5px"><h2><span style="color:yellow;">FedChoice</span> <span style="color:white;">Bank</span></h2></div>
	  
	   <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    	<span class="navbar-toggler-icon"></span>
	  </button>
	  <div class=" col-sm-66 collapse navbar-collapse" id="navbarSupportedContent">
	  
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	        <a class="nav-link" href="<%=request.getContextPath()%>/home.jsp">Home <span class="sr-only">(current)</span></a>
	      </li>
	      
	       
	      
	      
	      
	      <li class="Status nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          Status Details
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="<%=request.getContextPath()%>/CustomerStatus.jsp">View Customer Status</a>
	          <a class="dropdown-item" href="<%=request.getContextPath()%>/AccountStatus.jsp">View Account Status</a>
	          </div>
	      </li>
	      
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          Account Operations
			</a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="<%=request.getContextPath()%>/deposit-form.jsp">Deposit Amount</a>
	          <a class="dropdown-item" href="<%=request.getContextPath()%>/withdraw-form.jsp">Withdraw Amount</a>
	          <a class="dropdown-item"  href="<%=request.getContextPath()%>/transfer-form.jsp">Transfer Amount</a>
	          <a class="dropdown-item" href="<%=request.getContextPath()%>/print-statements-form.jsp">Print Statement</a>
	        </div>
	      </li>
	      
	      <li class="nav-item active">
	        <a class="nav-link" href="<%=request.getContextPath()%>/LogOut">Logout <span class="sr-only">(current)</span></a>
	      </li>
	      
	      
	    </ul>
	  </div>
	  </div>
	</nav>
	</div>
	<%}%>
</div>
<p class="text-right" style="padding:3px"><% out.print("Today is:"+java.util.Calendar.getInstance().getTime()); %>  </p>
</body>
</html>