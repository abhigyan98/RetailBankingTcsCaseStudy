<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
 	if((String)session.getAttribute("username")==null){
 		String contextPath = request.getContextPath();
 		response.sendRedirect(response.encodeRedirectURL(contextPath + "/login.jsp")); 
 	}
 %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<body>


<jsp:include page="header.jsp"/>

<c:if test="${not empty msg }">
	<script type="text/javascript">
		alert("Sorry ! Customer with multiple accounts can't be deleted !!")
	</script>
	<c:remove var="msg" scope="session"/>
</c:if>

<div class="container">
	<div id="content">
		<input class="btn btn-success" type="submit" value="Create Customer" onclick="window.location.href='create-customer-form.jsp'; return false;" class="customer-button" />
		<br/><br/>
		<form action="CustomerManagement" method="POST">
		   
		    <div class="form-group col-md-12">
				  <div class="text-center">
				  <div class="row">
				  <div class="col-md-4 " style="font-size:22px"> <input type="hidden" name="command" value="SEARCH" />Search Customer : </div>
				  <div class="col-md-4"><input type="text" class="form-control " id="accountId" name="searchkwd" ></div>
				  <div class="col-md-4"><input type="submit" value="Search" class="btn btn-primary btn-xl" /></div>
				  </div>
				</div>
				<!-- 
		    <input   class="btn success"  style="border:1px"/> -->
			</div>
		</form>
		<br/><br/>
		<table class="table table-striped table-bordered text-center">
		<thead class="thead-dark">
			<tr>
				<th>Customer Id</th><th>Customer Name</th><th colspan="3">Actions</th>
			</tr>
		</thead>	
			<tbody>
			<c:forEach var="customer" items="${Customer_List}">
			<!-- Set up update link for each customer -->
			
			<c:url var="details" value="CustomerManagement">
				<c:param name="command" value="DETAILS" />
				<c:param name="customerId" value="${customer.id}" />
			</c:url>
			
			<c:url var="updateLink" value="CustomerManagement">
				<c:param name="command" value="LOAD"/>
				<c:param name="customerId" value="${customer.id}"/>
			</c:url>
			<c:url var="deleteLink" value="CustomerManagement">
				<c:param name="command" value="DELETE" />
				<c:param name="customerId" value="${customer.id}" />
			</c:url>
			
			<tr class="text-center">
				<!-- As we use jstl tag customer.firstName will call customer.getFirstName() automatically -->
				<td><h5>${customer.id}</h5></td>
				<td><h5>${customer.name}</h5></td>
				<td><a class="btn btn-primary btn-lg"  href="${details}">View</a></td>
				<td><a class="btn btn-success btn-lg" href="${updateLink}">Update</a></td>
				<td><a class="btn btn-danger btn-lg" href="${deleteLink}"onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>	</td>
			</tr>
			</c:forEach>
			</tbody>
			
		</table>
	</div>
	<br/><br/><br/>
</div>

</body>
</html>

<jsp:include page="footer.jsp"/>