<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Reply</title>

    <link href="http://twitter.github.io/bootstrap/assets/css/bootstrap.css" rel="stylesheet">
    <link href="http://twitter.github.io/bootstrap/assets/css/bootstrap-responsive.css" rel="stylesheet">
	<style type="text/css">
		.table-bordered{
			width: 800px;
		}
		.replyTable{
			padding: 100px;
		}
	</style>
</head>
<body>
<form:form action="replySuccess.htm" commandName="message" method="POST">
<div class="replyTable" id="xyz">
<h4>Reply to Message</h4>
<table class="table table-bordered">
	<tr>
		<th style="width: 50px">To : </th>
		<td style="width: 500px;"><c:out value="${to}"></c:out></td>
		<form:hidden path="userName" value="${to}"/>
	</tr>
	<tr>
		<th>From :</th>
		<td><c:out value="${sessionScope.uName}"></c:out></td>
		<form:hidden path="fromUser" value="${sessionScope.uName}"/>
	</tr>
	<tr style="height: 200px;">
		<th style="width: 50px">Message :</th>
		<td style="width: 500px;"><form:textarea path="message" name="message" rows="10" cols="70"/></td>
	</tr>
</table>

<input type="submit" name="reply" value="Reply"></input>
</div>
</form:form>
</body>
</html>