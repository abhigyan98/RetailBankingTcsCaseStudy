
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
	
</head>


<body>

<div class="jumbotron bg-transparent">

	
		
		
		
		<h2 style="text-align:center;">Deposit Money</h2>
		
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
				<input type="hidden" name="command" value="DEPOSIT"/>
				
				<div class="form-group col-sm-4">
				  <label class="control-label " for="accountId">Account ID :</label>
				  <div class="">
					<input type="number" class="form-control" id="accountId" name="accountId" required>
				  </div>
				</div>
				
				
				<div class="form-group col-sm-4">
				  <label class="control-label " for="accountType">Account Type :</label>
				  <div class="">
					<select class="form-control" id="accountType" name="accountType">
						<option value="Savings">Savings</option>
						<option value="Current">Current</option>
						<option value="Fixed Deposit">Fixed Deposit</option>
					</select>
				  </div>
				</div>
				
				<div class="form-group col-sm-4">
				  <label class="control-label " for="depositAmount">Deposit Amount :</label>
				  <div class="">
					<input type="number" step=".01" class="form-control" id="depositAmount" name="depositAmount" required>
				  </div>
				</div>
				
				<div class="form-group col-sm-12">
					<div class="  text-center">
					<button type="submit" class="btn btn-success btn-lg">Submit</button>
					</div>
				</div>
				</div>
			</form>
		</div>
		


</body>
</html>