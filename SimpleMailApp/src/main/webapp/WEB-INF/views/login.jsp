<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Insert title here</title>
</head>
<body>
	<form:form commandName="user" action="home.htm" method="POST">
		Username :<form:input path="username" name="username"/>
		Password : <form:input path="password" name="password"/>
		<input type="checkbox" name="remember"/>Remember me for 1 week
		<input type="submit" value="login" />
	</form:form>
</body>
</html>	