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
<title>New Course</title>
</head>
<body>

<a href="/dashboard"><button class="backBtn">Back to Dashboard</button></a>

<h1>Create a new course</h1>

<form:form action="/projects/new" method="post" modelAttribute="yoga">

	<table>
	    <thead>
	    	<tr>
	            <td class="float-left">Course Name:</td>
	            <td class="float-left">
	            	<form:errors path="title" class="text-danger"/>
					<form:input class="input" path="title"/>
	            </td>
	        </tr>
	        
	        <tr>
	            <td class="float-left">Day of the week:</td>
	            <td class="float-left">
	            	<form:errors path="day" class="text-danger"/>
					<form:input path="day" placeholder="ex: Monday"/>
	            </td>
	        </tr>
	           
	        <tr>
	            <td class="float-left">Price:</td>
	            <td class="float-left">
	            	<form:errors path="price" class="text-danger"/>
					<form:input path="price" value="$"/>
	            </td>
	        </tr>
	        
	        <tr>
	            <td class="float-left">Course Description:</td>
	            <td class="float-left">
	            	<form:errors path="description" class="text-danger"/>
					<form:textarea rows="4" class="input" path="description"/>
	            </td>
	        </tr>
	        <form:errors path="lead" class="error"/>
			<form:input type="hidden" path="lead" value="${userId}" class="form-control"/>
			
	        <tr>
	        	<td><input class="input submitBtn" type="submit" value="Submit"/></td>
	        </tr>
	    </thead>
	</table>
</form:form>
<a class="linkBtn" href="/dashboard"><button class="cancelBtn">Cancel</button></a>
</body>
</html>