<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.web.banking.db.BankingDbUtil,java.util.*,com.web.banking.entity.CustomerStatus"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>Insert title here</title>
</head>
<body>
<%
	List<CustomerStatus> list = BankingDbUtil.getCustomerStatus();
	request.setAttribute("CustomerStatusList",list);
%>

<jsp:include page="header.jsp"/>


<div id="jumbotron bg-transparent">
		
	<div id="content"><br>
	
	<h2 class="text-center">Customer Status</h2><br>
		<c:if test="${CustomerStatusList.size() > 0 }">
		<table class=" table table-bordered table-striped text-center ">
		<thead class="thead-dark bg-dark text-white">
		<tr >
		<td>Date</td>
		<td>Customer Id</td>
		<td>Operation</td>
		</tr>
		</thead>
		<tbody style="color:green;">
		<c:forEach var="status" items="${CustomerStatusList}">
			<tr>
			<td><fmt:formatDate pattern = "dd-MM-yyyy" value = "${status.date }" /></td>
			<td>${status.customerId}</td>
			<td>${status.operation}</td>
			</tr>
			
		</c:forEach>
		</tbody>
		</table>
		</c:if>
	</div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>