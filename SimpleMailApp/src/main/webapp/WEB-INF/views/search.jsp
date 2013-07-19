<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
  <link href="http://twitter.github.io/bootstrap/assets/css/bootstrap.css" rel="stylesheet">
    <link href="http://twitter.github.io/bootstrap/assets/css/bootstrap-responsive.css" rel="stylesheet">
<title>Search Page</title>
<style type="text/css">
	#leftside{
		float: left;
		width: 400px;
	}
	#rightside{
		float: left;
	}
	ul
{
    list-style-type: none;
}
	td{
		padding: 10px;
	}
</style>
</head>
<body>
<div id="leftside">
<ul>

		<a href="${pageContext.servletContext.contextPath}/search.htm"><li>Search</li></a>
		<a href="${pageContext.servletContext.contextPath}/showMessages.htm"><li>ShowMessages</li></a>		
		<a href="#"><li>View Contacts</li></a>
		<a href="#"><li>Change Password</li></a>
	</ul>
</div>
	
<div id="rightside">
	
	
	<h2>Welcome <c:out value="${ sessionScope.uName}"></c:out></h2><br />
		<h4>Search by Member ID</h4>
		<form:form commandName="user" action="searchResult.htm" method="POST">
			Enter Member ID : <form:input path="userID" name="userID"/><br />
			<center>
			<input type="submit" name="byID" value="See Profile " class="btn btn-primary"/>
			<input type="hidden" name="searchtype" value="byid"/>
			</center>
		</form:form >
		<br />
		
		<h4>Search by Username</h4>
		<form:form commandName="user" action="searchResult.htm" method="POST">
			Enter Username : <form:input path="username" name="username"/><br />
			<center>
			<input type="submit" name="byUsername" class="btn btn-primary" value="See Profile "/>
			<input type="hidden" name="searchtype" value="byusername"/>
			</center>
		</form:form>
		
		<h4>Quick Search</h4>
		<form:form commandName="user" action="searchResult.htm" method="POST">
		<table >
			<tr>
				<td align="left">Show Me :</td>
				<td><form:select path="gender" name="gender">
				<form:option value="Male" label="Male" ></form:option>
				<form:option value="Female" label="Female"></form:option>
			</form:select>
			</td>
			</tr>
			<tr>
				<td align="left">Age : </td>
				<td><form:input path="age" class="input-mini" type="text"  size="2" name="age" /></td>
			</tr>
			<tr>
				<td align="left">Search Location : </td>
				<td align="right">
					Country : <form:input path="country" type="text" class="input-medium" name="country"/><br />
					City : <form:input path="city" type="text" class="input-medium" name="city"/><br />
					
				</td>
			</tr>
		</table>
		<center>
			 <input type="submit" name="quicksearch" class="btn btn-primary" value="See Profile "/>
			<input type="hidden" name="searchtype" value="quick"/>
			</center>
		</form:form>
	
	
</div>
	
</body>
</html>