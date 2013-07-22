<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://velocity.apache.org/velocity-view" prefix="velocity" %>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<link href="http://twitter.github.io/bootstrap/assets/css/bootstrap.css" rel="stylesheet">
    <link href="http://twitter.github.io/bootstrap/assets/css/bootstrap-responsive.css" rel="stylesheet">
<title>Password Change Confirmation</title>
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

		
	<a href="${pageContext.servletContext.contextPath}/search.htm"><li>Search</li></a><br />
		<a href="${pageContext.servletContext.contextPath}/showMessages.htm"><li><strong>ShowMessages</strong></li></a><br />		
		<a href="${pageContext.servletContext.contextPath}/viewContacts.htm"><li>View Contacts</li></a><br />
		<a href="${pageContext.servletContext.contextPath}/changePassword.htm"><li>Change Password</li></a><br />
	</ul>
</div>
	
<div id="rightside">
	<h3>Your password has been reset successfully!</h3>
	
	<velocity:view>
		
	#if($noerror == 'pass')
	<strong>pass</strong>
	#end
	</velocity:view>
	</div>
</body>
</html>