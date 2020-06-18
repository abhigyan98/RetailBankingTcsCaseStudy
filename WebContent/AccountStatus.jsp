<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.web.banking.db.BankingDbUtil,java.util.*,com.web.banking.entity.AccountStatus"%>

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
	List<AccountStatus> list = BankingDbUtil.getAccountStatus();
	request.setAttribute("AccountStatusList",list);
%>

<jsp:include page="header.jsp"/>


<div id="jumbotron bg-transparent">
		
	<div id="content"><br>
	
	<h2 class="text-center">Account Status</h2><br>
		<c:if test="${AccountStatusList.size() > 0 }">
		<table class=" table table-bordered table-striped text-center ">
		<thead class="thead-dark bg-dark text-white">
		<tr >
		<td>Date</td>
		<td>Account Id</td>
		<td>Operation</td>
		</tr>
		</thead>
		<tbody style="color:green;">
		<c:forEach var="status" items="${AccountStatusList}">
			<tr>
			<td><fmt:formatDate pattern = "dd-MM-yyyy" value = "${status.date }" /></td>
			<td>${status.accountId}</td>
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