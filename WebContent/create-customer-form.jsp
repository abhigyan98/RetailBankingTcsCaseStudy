<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
 	if((String)session.getAttribute("username")==null){
 		String contextPath = request.getContextPath();
 		response.sendRedirect(response.encodeRedirectURL(contextPath + "/login.jsp")); 
 	}
 %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
 	if((String)session.getAttribute("username")==null){
 		String contextPath = request.getContextPath();
 		response.sendRedirect(response.encodeRedirectURL(contextPath + "/login.jsp")); 
 	}
 %>

 
 
<jsp:include page="header.jsp"/>

<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Create Customer</title>
	
</head>
<body>
<div class="container">
	<p><p>
	<div class="jumbotron bg-transparent">
		
		<div class="text-center" >
		<h2 >Create Customer</h2>
		
		<c:if test="${not empty msg }">
			<h3 style="text-align:center;color:red;">${msg }</h3>
		</c:if>
		
		<br/>
		<c:if test="${not empty customerId }">
			<c:choose>
				<c:when test="${customerId == -1 }">
					<h3 style="text-align:center;color:red">Failure : Customer Creation failed !!</h3>
					<br/>
				</c:when>
				<c:when test="${customerId > 0 }">
					<h3 style="text-align:center;color:green">Successful : Customer is Created !!</h3>
					<h3 style="text-align:center;color:green">Customer Id : ${customerId } </h3>
					<br/>
				</c:when>
			</c:choose>
			<c:remove var="customerId" scope="session" />
		</c:if>
		<form class="form-horizontal" action="CustomerManagement" method="POST">
		<div class="row">
				<input type="hidden" name="command" value="CREATE"/>
				<div class="form-group col-sm-6">
				  <label class="control-label " for="SSNId">Customer SSN ID :</label>
				  <div class="">
					<input type="number" class="form-control" id="SSNId" name="SSNId" required>
				  </div>
				</div>
				<div class="form-group col-sm-6">
				  <label class="control-label " for="name">Customer Name :</label>
				  <div class="">
					<input type="text" class="form-control" id="name" name="name" required>
				  </div>
				</div>
				<div class="form-group col-sm-6">
				  <label class="control-label " for="age">Age :</label>
				  <div class="">
					<input type="number" class="form-control" id="age" name="age" required>
				  </div>
				</div>
				<div class="form-group col-sm-6">
				  <label class="control-label " for="address">Address :</label>
				  <div class="">
					<input type="text" class="form-control" id="address" name="address" required>
				  </div>
				</div>
				<div class="form-group col-sm-6">
				  <label class="control-label " for="state">State :</label>
				  <div class="">
					<select id="state" class="form-control" name="state" required>
		       			<option selected>Choose...</option>
		         		<option value=”AndhraPradesh”>Andhra Pradesh</option>
						<option value=”AndamanandNicobarIslands”>Andaman and Nicobar Islands</option>
						<option value=”ArunachalPradesh”>Arunachal Pradesh</option>
						<option value=”Assam”>Assam</option>
						<option value=”Bihar”>Bihar</option>
						<option value=”Chandigarh”>Chandigarh</option>
						<option value=”Chhattisgarh”>Chhattisgarh</option>
						<option value=”DadarandNagarHaveli”>Dadar and Nagar Haveli</option>
						<option value=”DamanandDiu”>Daman and Diu</option>
						<option value=”Delhi”>Delhi</option>
						<option value=”Lakshadweep”>Lakshadweep</option>
						<option value=”Puducherry”>Puducherry</option>
						<option value=”Goa”>Goa</option>
						<option value=”Gujarat”>Gujarat</option>
						<option value=”Haryana”>Haryana</option>
						<option value=”HimachalPradesh”>Himachal Pradesh</option>
						<option value=”JammuandKashmir”>Jammu and Kashmir</option>
						<option value=”Jharkhand”>Jharkhand</option>
						<option value=”Karnataka”>Karnataka</option>
						<option value=”Kerala”>Kerala</option>
						<option value=”MadhyaPradesh”>Madhya Pradesh</option>
						<option value=”Maharashtra”>Maharashtra</option>
						<option value=”Manipur”>Manipur</option>
						<option value=”Meghalaya”>Meghalaya</option>
						<option value=”Mizoram”>Mizoram</option>
						<option value=”Nagaland”>Nagaland</option>
						<option value=”Odisha”>Odisha</option>
						<option value=”Punjab”>Punjab</option>
						<option value=”Rajasthan”>Rajasthan</option>
						<option value=”Sikkim”>Sikkim</option>
						<option value=”TamilNadu”>Tamil Nadu</option>
						<option value=”Telangana”>Telangana</option>
						<option value=”Tripura”>Tripura</option>
						<option value=”UttarPradesh”>Uttar Pradesh</option>
						<option value=”Uttarakhand”>Uttarakhand</option>
						<option value=”WestBengal”>West Bengal</option>
		      	</select>
				  </div>
				</div>
				
				<div class="form-group col-sm-6">
				  <label class="control-label " for="city">City :</label>
				  <div class="">
					<input type="text" class="form-control" id="city" name="city" required>
				  </div>
				</div>
				
				<div class="col-sm-12">
				<br>
					<div class="text-center" >
					<button type="submit" class="btn btn-success btn-lg">Create Customer</button>
					</div>
				</div>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>
<jsp:include page="footer.jsp"/>