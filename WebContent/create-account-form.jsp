
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

<div class="container">

	<div class="text-center">
		<br>
		<div class="" >
		
		<h2 >Create Account</h2>
		<br>
		<c:if test="${not empty msg }">
			<c:choose>
				<c:when test="${fn:containsIgnoreCase(msg, 'Success')}">
					<br/>
					<h3 style="color:green;text-align:center;">${msg }</h3>
					<h3 style="color:green;text-align:center;">Account ID : ${accountId }</h3>
				</c:when>
				<c:when test="${fn:containsIgnoreCase(msg, 'Failure') }">
					<br/><h3 style="color:red;text-align:center;">${msg }</h3>
				</c:when>
			</c:choose>
			<c:remove var="msg" scope="session" />
		</c:if>
		
		<br/>
		
		<form class="form-horizontal" action="AccountManagement" method="POST" >
		
				<input type="hidden" name="command" value="CREATE"/>
				
				<% 
					session.setAttribute("token",5);
				%>
				
				<div class="row">
				<br>
				<div class="form-group col-sm-4">
				  <label class="control-label " for="customerId">Customer ID :</label>
				  <div class="">
					<input type="number" class="form-control" id="customerId" name="customerId" required>
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
				<br>
				<div class="form-group col-sm-12 text-center"><br>
					<div class="col-sm-offset-2 ">
					<button type="submit" class="btn btn-success btn-lg">Create Account</button>
					</div>
				</div>
				
				</div>
			</form>
		</div>
		<div class="col-sm-2">
		</div>
	</div><br>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>