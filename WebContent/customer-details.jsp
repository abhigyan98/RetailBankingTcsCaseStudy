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
<title>Insert title here</title>
</head>
<body>

<div class="jumbotron bg-transparent">
<br>
<h2 class="text-center">Customer Details</h2>
<br>
<table class="table table-stripped table-bordered content text-center">
<thead class="bg-dark text-white " >
<tr>
<td>Customer ID</td>
<td>Customer SSN ID</td>
<td>Name</td>
<td>Age</td>
<td>Address</td>
<td>State</td>
<td>City</td>
</tr>
</thead>
<tbody>
<tr>
<td>${The_Customer.id }</td>
<td>${The_Customer.SSNId }</td>
<td>${The_Customer.name }</td>
<td>${The_Customer.age }</td>
<td>${The_Customer.address }</td>
<td>${The_Customer.state }</td>
<td>${The_Customer.city }</td>
</tr>
</tbody>
</table>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>