<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Main Page</title>
 <link href="http://twitter.github.io/bootstrap/assets/css/bootstrap.css" rel="stylesheet">
    <link href="http://twitter.github.io/bootstrap/assets/css/bootstrap-responsive.css" rel="stylesheet">
<style type="text/css">
	#leftside{
		float: left;
		width: 400px;
		padding-top: 100px;
	}
	#rightside{
		float: left;
	}
	ul
{
    list-style-type: none;
}
</style>
</head>
<body>
<div id="leftside">
	<ul>

		<a href="${pageContext.servletContext.contextPath}/search.htm"><li>Search</li></a><br/>
		<a href="${pageContext.servletContext.contextPath}/showMessages.htm"><li>ShowMessages</li></a><br/>		
		<a href="${pageContext.servletContext.contextPath}/viewContacts.htm"><li>View Contacts</li></a><br/>
		<a href="${pageContext.servletContext.contextPath}/changePassword.htm"><li>Change Password</li></a><br/>
	</ul>
</div>
	
<div id="rightside">

	<h2>Welcome <c:out value="${ sessionScope.uName}"></c:out></h2>
	<br />
	<form:form action="/reply.htm">
	<table id="contactTable"  class="table table-bordered">
	
	<tr>
		<th>Contact ID</th>
		<th>Contact Name</th>
		<th>Comments</th>
		<th>Date Added</th>
	</tr>
	<c:forEach items="${result}" var="contact" step="1">
	<tr>
		<td><c:out value="${contact.contactID }"></c:out></td>
		<td><c:out value="${contact.contactName }"></c:out></td>
		<td><c:out value="${contact.comments }"></c:out></td>
		<td><c:out value="${contact.dateAdded }"></c:out></td>
	</tr>
	</c:forEach>
	</table>
	
	</form:form>
</div>
	
</body>
</html>