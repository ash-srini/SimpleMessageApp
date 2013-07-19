<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Main Page</title>
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
	<h2>Welcome <c:out value="${ sessionScope.uName}"></c:out></h2>
</div>
	

</body>
</html>