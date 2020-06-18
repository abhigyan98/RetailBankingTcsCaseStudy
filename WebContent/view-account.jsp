<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
<table class="table table-stripped table-bordered content">
		<c:url var="details" value="CustomerManagement">
			<c:param name="command" value="DETAILS" />
			<c:param name="customerId" value="${The_Customer.id}" />
		</c:url>
<thead class="thead-dark">
<tr>
<td>Customer ID</td>
<td>Name</td>
<td>Account ID</td>
<td>Account Type</td>
<td>Balance</td>
</tr>
</thead>
<tbody>
<tr>
<td>${The_Customer.id }</td>
<td>${The_Customer.name }</td>
<td>${The_Account.accountId }</td>
<td>${The_Account.accountType }</td>
<td>${The_Account.balance }</td>
</tr>
</tbody>
</table>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>