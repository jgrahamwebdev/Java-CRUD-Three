<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<style>
.submitBtn {
	background-color: #4cd137;
	color: #fff;
	border: none;
	padding: 5px;
	font-size: 15px;
	cursor: pointer;
	margin-top: 2rem;
}
.cancelBtn {
	background-color: #f1c40f;
	border: none;
	padding: 5px;
	font-size: 15px;
	cursor: pointer;
	margin-top: 2rem;
}
.backBtn {
	background-color: #00a8ff;
	color: #fff;
	border: none;
	padding: 5px;
	margin-top: 2rem;
	cursor: pointer;
}
</style>
<title>Edit Course</title>
</head>
<body>

<a href="/dashboard"><button class="backBtn">Back to Dashboard</button></a>

<h1>Edit Your Course:</h1>

<form:form action="/projects/edit/${yoga.id}" method="post" modelAttribute="yoga">

	<table>
	    <thead>
	    	<tr>
	            <td class="float-left">Course:</td>
	            <td class="float-left">
	            	<form:errors path="title" class="text-danger"/>
					<form:input class="input" path="title" value="${yoga.title}"/>
	            </td>
	        </tr>
	        <tr>
	            <td class="float-left">Day:</td>
	            <td class="float-left">
	            	<form:errors path="day" class="text-danger"/>
					<form:input class="input" path="day" value="${yoga.day}"/>
	            </td>
	        </tr>
	        <tr>
	            <td class="float-left">Cost:</td>
	            <td class="float-left">
	            	<form:errors path="price" class="text-danger"/>
					<form:input class="input" path="price" value="${yoga.price}"/>
	            </td>
	        </tr>
	        <tr>
	            <td class="float-left">Description:</td>
	            <td class="float-left">
	            	<form:errors path="description" class="text-danger"/>
					<form:textarea rows="4" class="input" path="description" value="${yoga.description}"/>
	            </td>
	        </tr>
	        <tr>
	        	<td><a class="linkBtn" href="/dashboard"><button class="cancelBtn">Cancel</button></a></td>
	        	<td><input class="input submitBtn" type="submit" value="Submit"/></td>
	        </tr>
	    </thead>
	</table>
</form:form>
</body>
</html>