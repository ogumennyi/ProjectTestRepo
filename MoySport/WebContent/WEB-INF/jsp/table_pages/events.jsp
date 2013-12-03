<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Spring 3 MVC Series - Events List</title>
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

<h2>Events List</h2>

<form:form method="post" action="events/add" commandName="events">

	<table>
	<tr>
		<td><form:label path="idevent"><spring:message code="label.table_page.events.idevent"/></form:label></td>
		<td><form:input path="idevent" /></td> 
	</tr>
	<tr>
		<td><form:label path="name"><spring:message code="label.table_page.events.name"/></form:label></td>
		<td><form:input path="name" /></td> 
	</tr>
	<tr>
		<td><form:label path="idlocation"><spring:message code="label.table_page.events.idlocation"/></form:label></td>
		<td><form:input path="idlocation" /></td> 
	</tr>
	<tr>
		<td><form:label path="idcreatedby"><spring:message code="label.table_page.events.idcreatedby"/></form:label></td>
		<td><form:input path="idcreatedby" /></td> 
	</tr>
	<tr>
		<td><form:label path="idchangeby"><spring:message code="label.table_page.events.idchangeby"/></form:label></td>
		<td><form:input path="idchangeby" /></td> 
	</tr>
	<tr>
		<td><form:label path="changedate"><spring:message code="label.table_page.events.changedate"/></form:label></td>
		<td><form:input path="changedate" type="date"/></td>
	</tr>
	<tr>
		<td><form:label path="mark"><spring:message code="label.table_page.events.mark"/></form:label></td>
		<td><form:input path="mark" /></td> 
	</tr>
	<tr>
		<td><form:label path="markcnt"><spring:message code="label.table_page.events.markcnt"/></form:label></td>
		<td><form:input path="markcnt" /></td> 
	</tr>
	<tr>
		<td><form:label path="idsport"><spring:message code="label.table_page.events.idsport"/></form:label></td>
		<td><form:input path="idsport" /></td> 
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="<spring:message code="label.table_page.events.addevents"/>"/>
		</td>
	</tr>
</table>	
</form:form>

<c:if  test="${!empty eventsList}">
	<table class="data">
		<tr>
			<th>IDEVENT</th>
			<th>NAME</th>
			<th>IDLOCATION</th>
			<th>IDCREATEDBY</th>
			<th>IDCHANGEBY</th>
			<th>CHANGEDATE</th>
			<th>MARK</th>
			<th>MARKCNT</th>
			<th>IDSPORT</th>
			<th>&nbsp;</th>
		</tr>
		<c:forEach items="${eventsList}" var="events">
			<tr>
				<td>${events.idevent}</td>
				<td>${events.name}</td>
				<td>${events.idlocation}</td>
				<td>${events.idcreatedby}</td>
				<td>${events.idchangeby}</td>
				<td>${events.changedate}</td>
				<td>${events.mark}</td>
				<td>${events.markcnt}</td>
				<td>${events.idsport}</td>
				<td><form method="post" action="events/delete"><input type="hidden" name="idevent" value="${events.idevent}"/><input type="submit" value="Delete"/></form></td>
			</tr>
		</c:forEach>
	</table>
</c:if>


</body>
</html>
