<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<style>
.main_container {
	width: 100%;
	height: 25rem;
	display: flex;
	align-items: center;
	justify-content: space-evenly;
}
.container {
	height: 25rem;
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
}
.form-row {
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 1rem;
}

.text-danger {
	color: red;
}

table {
	border: 2px solid #000;
	padding: 3rem;
}
.submitBtn, .loginBtn {
	background-color: #4cd137;
	color: #fff;
	border: none;
	padding: 10px;
	font-size: 15px;
	cursor: pointer;
}
</style>
<title>Yoga Course Platform</title>
</head>
<body>

<h1>Yoga Course</h1>

<div class="main_container">

<div class="container">
<form:form action="/register" method="post" modelAttribute="newUser">

	<h2>Register:</h2>
	<table>		    		       
	    <thead>
	    	<tr class="form-row">
	            <td class="float-left">Name:</td>
	            <td class="float-left">
					<form:input class="input" path="name"/>
	            	<form:errors path="name" class="text-danger"/>
	            </td>
	        </tr>
	        <tr class="form-row">
	            <td class="float-left">Email:</td>
	            <td class="float-left">
					<form:input class="input" path="email"/>
	            	<form:errors path="email" class="text-danger"/>
	            </td>
	        </tr>
	        <tr class="form-row">
	            <td class="float-left">Password:</td>
	            <td class="float-left">
					<form:input class="input" path="password" type="password"/>
	            	<form:errors path="password" class="text-danger"/>
	            </td>
	        </tr>
	        <tr class="form-row">
	            <td class="float-left">Confirm PW:</td>
	            <td class="float-left">
					<form:input class="input" path="confirm" type="password"/>
	            	<form:errors path="confirm" class="text-danger"/>
	            </td>
	        </tr>
	        <tr>
	        	<td colspan=2><input class="input submitBtn" type="submit" value="Submit"/></td>
	        </tr>
	    </thead>
	</table>
</form:form>
</div>

<div class="container">
<form:form action="/login" method="post" modelAttribute="newLogin">

	<h2>Log In:</h2>
	<table>	
	    <thead>
	        <tr class="form-row">
	            <td class="float-left">Email:</td>
	            <td class="float-left">
					<form:input class="input" path="email"/>
	            	<form:errors path="email" class="text-danger"/>
	            </td>
	        </tr>
	        <tr class="form-row">
	            <td class="float-left">Password:</td>
	            <td class="float-left">
					<form:input class="input" path="password" type="password"/>
	            	<form:errors path="password" class="text-danger"/>
	            </td>
	        </tr>
	        <tr>
	        	<td colspan=2><input class="input loginBtn" type="submit" value="Login"/></td>
	        </tr>
	    </thead>
	</table>
</form:form>
</div>
</div>
</body>
</html>