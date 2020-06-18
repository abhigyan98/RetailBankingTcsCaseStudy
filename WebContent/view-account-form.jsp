 
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
	<title>View Account</title>
	
  	<style>
  	</style>
</head>

<body>

<div class="jumbotron bg-transparent">
			
		<h2 style="text-align:center;">View Account</h2>
		
		<c:if test="${not empty msg }">
			<h3 style="text-align:center;color:red;">${msg }</h3>
			<c:remove var="msg" scope="session" />
		</c:if>
		<br/>
		
		<form class="form-horizontal" action="AccountManagement" method="POST">
		
				<input type="hidden" name="command" value="VIEW"/>
				<div class="row">
				<div class="form-group offset-sm-4 col-sm-4">
				  <label class="control-label " for="accountId">Account ID :</label>
				  <div class="">
					<input type="number" class="form-control" id="accountId" name="accountId" required>
				  </div>
				</div>
				
				<!--<div class="form-group col-sm-6">
				  <label class="control-label " for="accountType">Account Type :</label>
				  <div class="">
					<select class="form-control" id="accountType" name="accountType">
						<option value="Savings">Savings</option>
						<option value="Current">Current</option>
						<option value="Fixed Deposit">Fixed Deposit</option>
					</select>
				  </div>
				</div>  -->
				
				
				<div class="form-group col-sm-12">
					<div class=" text-center">
					<button type="submit" class="btn btn-success btn-lg">Submit</button>
					</div>
				</div>
				</div>
			</form>
		</div>
	
	
</body>
</html>

 <jsp:include page="footer.jsp"/>