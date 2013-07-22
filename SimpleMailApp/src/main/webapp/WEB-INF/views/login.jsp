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
<title>Insert title here</title>
<style type="text/css">
 body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }

</style>
</head>
<body>
<center>
<h2>Sign in</h2>
<div class="container">
	<form:form commandName="user" action="home.htm" method="POST">
	<div class="control-group">
		Username : <form:input path="username" name="username"/><br />
		Password : <form:input path="password" name="password"/><br />
		<input type="checkbox" name="remember"/> Remember me <br /><br />
		<input type="submit" value="Sign in"  class="btn btn-large btn-primary"/>
		</div>
	</form:form>
	
	  
</div>
</center>
</body>
</html>	