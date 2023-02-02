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
.deleteBtn {
	background-color: red;
	color: #fff;
	border: none;
	padding: 5px;
	margin-top: 2rem;
	cursor: pointer;
}
.backBtn {
	background-color: #00a8ff;
	color: #fff;
	border: none;
	padding: 5px;
	margin-top: 2rem;
	margin-right: 1rem;
	cursor: pointer;
}
</style>
<title>Course Details</title>
</head>
<body>

<h1>Course Details</h1>
<h2><c:out value="${yoga.title}"></c:out> with <c:out value="${yoga.lead.name}"></c:out></h2>
<table>
    <tbody>
    	<tr>
            <td>Course: <c:out value="${yoga.title}"></c:out></td>
        </tr>
        
        <tr>
            <td>Day: <c:out value="${yoga.day}"></c:out></td>
        </tr>
        
        <tr>
            <td>Cost: <c:out value="${yoga.price}"></c:out></td>
        </tr>
        
        <tr>
            <td>Description: <c:out value="${yoga.description}"></c:out></td>
        </tr>
        
        <tr>
        	<td>Teacher: <c:out value="${yoga.lead.name}"></c:out></td>
        </tr>
    </tbody>
</table>

<a href="/dashboard"><button class="backBtn">Back to Dashboard</button></a>
<c:if test = "${yoga.lead.id==userId}">
   <a href="/projects/delete/${yoga.id}"><button class="deleteBtn">Delete Course</button></a>
</c:if>
</body>
</html>