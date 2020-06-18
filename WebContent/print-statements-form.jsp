
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

	
		
		
		<h2 style="text-align:center;">Print Statement</h2>
		
		<c:if test="${not empty msg }">
			<h3 style="text-align:center;color:red;">${msg }</h3>
			<c:remove var="msg" scope="session" />
		</c:if>
		<br/>
		
		<form class="form-horizontal" action="AccountManagement" method="POST" >
		<div class="row">
				<input type="hidden" name="command" value="PRINTSTATEMENT"/>
				
				<div class="form-group  offset-sm-3 col-sm-6">
				  <label class="control-label" for="accountId">Account ID :</label>
				  <div class="">
					<input type="text" class="form-control" id="accountId" name="accountId" required>
				  </div>
				</div>
				
				<div class="form-group col-sm-6">
				  <label class="control-label " for="startDate">Start Date :</label>
				  <div class="">
					<input type="date" class="form-control" id="startDate" name="startDate" required>
				  </div>
				</div>
				
				<div class="form-group col-sm-6">
				  <label class="control-label " for="endDate">End Date :</label>
				  <div class="">
					<input type="date" class="form-control" id="endDate" name="endDate" required>
				  </div>
				</div>
				
				
				
				<div class="form-group col-sm-12">
					<div class="  text-center">
					<button type="submit" class="btn btn-success btn-lg">Submit</button>
					</div>
				</div>
			</form>
		</div>
		
	</div>

</body>
</html>
<jsp:include page="footer.jsp"/>