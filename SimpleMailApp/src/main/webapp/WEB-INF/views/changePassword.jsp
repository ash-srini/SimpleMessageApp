<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Change Password</title>
 <link href="http://twitter.github.io/bootstrap/assets/css/bootstrap.css" rel="stylesheet">
    <link href="http://twitter.github.io/bootstrap/assets/css/bootstrap-responsive.css" rel="stylesheet">
    <style type="text/css">
	#leftside{
		padding-top: 100px;
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
#textip{
	 float: right;
}
</style>
</head>
<body>
	<div id="leftside">
	<ul>

	<li><a href="${pageContext.servletContext.contextPath}/search.htm">Search</a></li><br/>
		<a href="${pageContext.servletContext.contextPath}/showMessages.htm"><li>ShowMessages</li></a><br />		
		<a href="${pageContext.servletContext.contextPath}/viewContacts.htm"><li>View Contacts</li></a><br />
		<a href="${pageContext.servletContext.contextPath}/changePassword.htm"><li>Change Password</li></a><br />
	</ul>
</div>
	
<div id="rightside">
	<h2>Welcome <c:out value="${ sessionScope.uName}"></c:out></h2>
	<br />
	<h3>Change Password</h3>
	<br/>
	<form:form commandName="user" action="pwordChangeConfirmation.htm" method="POST" >
	
		Old Password : <form:password path="password" name="password" id="textip"/> <br /><br />
		New Password: <input type="password" name="newpword" id="textip"/><br /><br />
		Confirm Password: <input type="password" name="confirmpword" id="textip"/><br /><br />
		<center>
		<input type="submit" class="btn btn-primary"/>
		</center>
	</form:form>
</div>
</body>
</html>