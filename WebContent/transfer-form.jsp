
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
	<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
	<script src="https://kit.fontawesome.com/136b4fde49.js" crossorigin="anonymous"></script>
</head>

<body>

<div class="jumbotron bg-transparent">

	
		
		<h2 style="text-align:center;">Transfer Money</h2>
		
		<c:if test="${not empty msg }">
			<c:choose>
				<c:when test="${fn:containsIgnoreCase(msg, 'Success')}">
					<br/>
					<h3 style="color:green;text-align:center;">${msg }</h3>
				</c:when>
				<c:when test="${fn:containsIgnoreCase(msg, 'Failure') }">
					<br/><h3 style="color:red;text-align:center;">${msg }</h3>
				</c:when>
			</c:choose>
			<c:remove var="msg" scope="session" />
		</c:if>
		<br/>
		
		<form class="form-horizontal" action="AccountManagement" method="POST">
		<div class="row">
		
				<input type="hidden" name="command" value="TRANSFER"/>
				
				<div class="form-group col-sm-5">
				  <label class="control-label " for="sourceAcId">Source Account ID :</label>
				  <div class="">
					<input type="number" class="form-control" id="sourceAcId" name="sourceAcId" required>
				  </div>
				</div>
				
				<div class="form-group col-sm-2 text-center display-4 " style="color:green"><i class="fa fa-arrow-right" aria-hidden="true"></i></div>
				
				<div class="form-group col-sm-5">
				  <label class="control-label " for="targetAcId">Target Account ID :</label>
				  <div class="">
					<input type="number" class="form-control" id="targetAcId" name="targetAcId" required>
				  </div>
				</div>
				
				<div class="form-group offset-md-4 col-sm-4">
				  <label class="control-label " for="transferAmount">Transfer Amount :</label>
				  <div class="">
					<input type="number" step=".01" class="form-control" id="transferAmount" name="transferAmount" required>
				  </div>
				</div>
				
				<div class="form-group col-sm-12">
					<div class=" text-center">
					<button type="submit" class="btn btn-success btn-lg">Submit</button>
					</div>
				</div>
			</form>
		</div>
		<div class="col-sm-2">
		</div>
	</div>
</div>
</body>
</html>