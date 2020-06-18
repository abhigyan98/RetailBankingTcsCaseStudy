<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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
<title>Home</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="jumbotron bg-transparent" >
<h2 class="text-center"> Welcome frands  to JALI bank</h2><br>


<img src="${pageContext.request.contextPath}/images/withdraw.jpg"/ width=100% height=100%>    
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>