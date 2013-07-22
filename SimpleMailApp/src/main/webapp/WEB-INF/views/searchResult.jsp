<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
  <link href="http://twitter.github.io/bootstrap/assets/css/bootstrap.css" rel="stylesheet">
    <link href="http://twitter.github.io/bootstrap/assets/css/bootstrap-responsive.css" rel="stylesheet">
<title>Search Result</title>
<style type="text/css">
td{
	width: 100px;

}
</style>
</head>
<body>
<center>
	<h3>User Profile</h3>
	<form:form commandName="user" action="addContact.htm" method="POST">
	<!-- <input type="hidden"  value="${ rsUser.username}" name="userName"/> -->
	<table id="displayUser" class="table table-bordered" style="width: 700px;">
		<tr>
			<th>User ID</th>
			<th>Username</th>
			<th>Age</th>
			<th>Country</th>
			<th>City</th>
			<th>Add Contact</th>
		</tr>
		<tr>
		
			<td align="center"><c:out value="${rsUser.userID}"></c:out></td>
			<td align="center"><c:out value="${rsUser.username }"></c:out></td>
			<td align="center"> <c:out value="${rsUser.age }"></c:out></td>
			<td align="center"><c:out value="${ rsUser.country}"></c:out></td>
			<td align="center"><c:out value="${ rsUser.city}"></c:out></td>
			<td align="center"><input type="submit" class="btn btn-primary" value="Add >>" /></td>
			
		</tr>
	</table>
	</form:form>
</center>
</body>
</html>