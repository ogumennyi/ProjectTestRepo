<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="cs" lang="cs">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Spring 3 MVC Series - Sport List</title>
	<style type="text/css">
		body {
			font-family: sans-serif;
		}
		.data, .data td {
			border-collapse: collapse;
			border: 1px solid #aaa;
			margin: 2px;
			padding: 5px;
		}
		.data th {
			font-weight: bold;
			background-color: #5C82FF;
			color: white;
		}
	</style>
</head>
<body>

<span>
    <a href="?lang=en">en</a> 
    | 
    <a href="?lang=ua">ua</a>
</span>
<br>

<p><a href="../">Home</a></p>

<h2>Sport List</h2>

<form:form method="post" action="sport/add" commandName="sport">

	<table>
	<tr>
		<td><form:label path="name"><spring:message code="label.name"/></form:label></td>
		<td><form:input path="name" /></td> 
	</tr>
	<tr>
		<td><form:label path="rules"><spring:message code="label.rules"/></form:label></td>
		<td><form:input path="rules" /></td>
	</tr>
	<tr>
		<td><form:label path="httplink"><spring:message code="label.httplink"/></form:label></td>
		<td><form:input path="httplink" /></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="<spring:message code="label.addsport"/>"/>
		</td>
	</tr>
</table>	
</form:form>

<c:if  test="${!empty sportList}">
<table class="data">
<tr>
	<th>#</th>
	<th>Name</th>
	<th>Rules</th>
	<th>Http link</th>
	<th>&nbsp;</th>
</tr>
<c:forEach items="${sportList}" var="sport">
	<tr>
		<td>${sport.id}</td>
		<td>${sport.name}</td>
		<td width="800px">${sport.rules}</td>
		<td><a target="_blank" href="${sport.httplink}">${sport.httplink}</a></td>
		<!-- <td><a href="sport/delete/${sport.id}">delete</a></td> -->
		<td><form method="post" action="sport/delete"><input type="hidden" name="sportId" value="${sport.id}"/><input type="submit" value="Delete"/></form></td>
	</tr>
</c:forEach>
</table>
</c:if>


</body>
</html>
