<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%
 	if((String)session.getAttribute("username")==null){
 		String contextPath = request.getContextPath();
 		response.sendRedirect(response.encodeRedirectURL(contextPath + "/login.jsp")); 
 	}
 %>
 <jsp:include page="header.jsp"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Create Customer</title>
	
  	<style>
  	</style>
</head>
<body>

<div class="jumbotron bg-transparent">
	
		<h2 style="text-align:center;">Update Customer</h2>
		<form class="form-horizontal" action="CustomerManagement" method="POST">
			<div class="row" style="background-color:#F0F8FF;">
				<input type="hidden" name="command" value="UPDATE"/>
				<div class="form-group col-sm-6">
				  <label class="control-label" for="customerId">Customer Id :</label>
				  <div class="">
					<input type="number" class="form-control" id="customerId" name="customerId" value="${The_Customer.id }" readonly>
				  </div>
				</div>
				
				<div class="form-group col-sm-6">
				  <label class="control-label" for="customerSSNId">Customer SSN Id :</label>
				  <div class="">
					<input type="number" class="form-control" id="customerSSNId" name="customerSSNId" value="${The_Customer.SSNId }" readonly>
				  </div>
				</div>
				
				<div class="form-group col-sm-6">
				  <label class="control-label" for="name">Customer Name :</label>
				  <div class="">
					<input type="text" class="form-control" id="name" name="name" value="${The_Customer.name}">
				  </div>
				</div>
				<div class="form-group col-sm-6">
				  <label class="control-label" for="age"><span style="text-align:left;">Age :</span></label>
				  <div class="">
					<input type="text" class="form-control" id="age" name="age" value="${The_Customer.age }" required>
				  </div>
				</div>
				<div class="form-group col-sm-6">
				  <label class="control-label" for="address">Address :</label>
				  <div class="">
					<input type="text" class="form-control" id="address" name="address" value="${The_Customer.address }" required>
				  </div>
				</div>
				<div class="form-group col-sm-6">
				  <label class="control-label" for="state">State :</label>
				  <div class="">
					<input type="text" class="form-control" id="state" name="state" value="${The_Customer.state }" required>
				  </div>
				</div>
				<div class="form-group col-sm-6">
				  <label class="control-label" for="city">City :</label>
				  <div class="">
					<input type="text" class="form-control" id="city" name="city" value="${The_Customer.city }" required>
				  </div>
				</div>
				<div class="form-group col-sm-12 text-center">
					<div class="text-center">
					<button type="submit" class="btn btn-primary btn-lg">Update</button>
					</div>
				</div>	</div>
			</form>
		</div>

 <jsp:include page="footer.jsp"/>
</body>
</html>