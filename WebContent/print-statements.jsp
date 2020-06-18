<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

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
<link type="text/css" rel="stylesheet" href="css/style.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dom-to-image/2.6.0/dom-to-image.min.js"
    integrity="sha256-c9vxcXyAG4paArQG3xk6DjyW/9aHxai2ef9RpMWO44A=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.5/jspdf.min.js"></script>
</head>
<body>

<jsp:include page="header.jsp"/>


<div id="jumbotron bg-transparent">
		
	<div id="content"><br>
	
	<h2 class="text-center">Transaction Statement</h2><br>
	<div class="row bg-dark text-white text-center" style="font-size:30px;text-align:left;">
		
		<h3 class="col-md-4">Account ID : ${accountId }</h3>
		<h3 class="col-md-4">Name : ${name }</h3>
		<h3 class="col-md-4">Current Balance : ${curBal}</h3>
	</div>
		<table class=" table table-bordered table-striped text-center ">
		<thead class="thead-dark bg-dark text-white">
		<tr >
		<td>Date</td>
		<td>Amount</td>
		<td>Remark</td>
		<td>Balance</td>
		</tr>
		
		</thead>
		<tbody style="color:green;">
		<c:if test="${Statement_List.size() > 0 }">
		<c:forEach var="statement" items="${Statement_List}">
			<tr >
			<td><fmt:formatDate pattern = "dd-MM-yyyy" value = "${statement.date }" /></td>
			<td>
			<c:choose>
				<c:when test = "${fn:containsIgnoreCase(statement.remark, 'Credit')}">
					<span style="color:green"> &#2352; ${statement.amount } (Cr)</span>
				</c:when>
				<c:otherwise>
					 <span style="color:red"> &#2352; ${statement.amount } (Dr)</span>
				</c:otherwise>
			</c:choose>
			</td>
			<td><span style="margin-left:0;"><i>${statement.remark }</i></span></td>
			<c:set var="printBal" value="${statement.balance }"/>
			<td>${printBal}</td>
			</tr>
		</c:forEach>
		</c:if>
		</tbody>
		</table>
	</div>
	<br/><br/><br/>
</div>
<div  align="center" class="container">

	<button class="btn btn-info btn-block" id="downloadPDF" >Download as PDF</button>
</div>
<script>

$('#downloadPDF').click(function () {
    domtoimage.toPng(document.getElementById('content'))
        .then(function (blob) {
            var pdf = new jsPDF('l', 'pt', [$('#content').width(), $('#content').height()]);

            pdf.addImage(blob, 'PNG', 0, 0, $('#content').width(), $('#content').height());
            pdf.save("BankStatement.pdf");

            that.options.api.optionsChanged();
        });
});
</script>
    </body>


<jsp:include page="footer.jsp"/>
</body>
</html>
