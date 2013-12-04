<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Spring 3 MVC Series - Trainings List</title>
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

<h2>Trainings List</h2>

<form:form method="post" action="trainings/add" commandName="trainings">

	<table>
	<tr>
		<td><form:label path="idt"><spring:message code="label.table_page.trainings.idt"/></form:label></td>
		<td><form:input path="idt" /></td> 
	</tr>
	<tr>
		<td><form:label path="description"><spring:message code="label.table_page.trainings.description"/></form:label></td>
		<td><form:input path="description" /></td> 
	</tr>
	<tr>
		<td><form:label path="idtw"><spring:message code="label.table_page.trainings.idtw"/></form:label></td>
		<td><form:input path="idtw" /></td> 
	</tr>
	<tr>
		<td><form:label path="idtp"><spring:message code="label.table_page.trainings.idtp"/></form:label></td>
		<td><form:input path="idtp" /></td> 
	</tr>
	<tr>
		<td><form:label path="idcreatedby"><spring:message code="label.table_page.trainings.idcreatedby"/></form:label></td>
		<td><form:input path="idcreatedby" /></td> 
	</tr>
	<tr>
		<td><form:label path="creationdate"><spring:message code="label.table_page.trainings.creationdate"/></form:label></td>
		<td><form:input path="creationdate" type="date"/></td>
	</tr>
	<tr>
		<td><form:label path="trainsdate"><spring:message code="label.table_page.trainings.trainsdate"/></form:label></td>
		<td><form:input path="trainsdate" type="date"/></td>
	</tr>
	<tr>
		<td><form:label path="trainsnum"><spring:message code="label.table_page.trainings.trainsnum"/></form:label></td>
		<td><form:input path="trainsnum" /></td> 
	</tr>
	<tr>
		<td><form:label path="idlocation"><spring:message code="label.table_page.trainings.idlocation"/></form:label></td>
		<td><form:input path="idlocation" /></td> 
	</tr>
	<tr>
		<td><form:label path="idparty"><spring:message code="label.table_page.trainings.idparty"/></form:label></td>
		<td><form:input path="idparty" /></td> 
	</tr>
	<tr>
		<td><form:label path="additionalinfo"><spring:message code="label.table_page.trainings.additionalinfo"/></form:label></td>
		<td><form:input path="additionalinfo" /></td> 
	</tr>
	<tr>
		<td><form:label path="idchangeby"><spring:message code="label.table_page.trainings.idchangeby"/></form:label></td>
		<td><form:input path="idchangeby" /></td> 
	</tr>
	<tr>
		<td><form:label path="changedate"><spring:message code="label.table_page.trainings.changedate"/></form:label></td>
		<td><form:input path="changedate" type="date"/></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="<spring:message code="label.table_page.trainings.addtrainings"/>"/>
		</td>
	</tr>
</table>	
</form:form>

<c:if  test="${!empty trainingsList}">
	<table class="data">
		<tr>
			<th>IDT</th>
			<th>DESCRIPTION</th>
			<th>IDTW</th>
			<th>IDTP</th>
			<th>IDCREATEDBY</th>
			<th>CREATIONDATE</th>
			<th>TRAINSDATE</th>
			<th>TRAINSNUM</th>
			<th>IDLOCATION</th>
			<th>IDPARTY</th>
			<th>ADDITIONALINFO</th>
			<th>IDCHANGEBY</th>
			<th>CHANGEDATE</th>
			<th>&nbsp;</th>
		</tr>
		<c:forEach items="${trainingsList}" var="trainings">
			<tr>
				<td>${trainings.idt}</td>
				<td>${trainings.description}</td>
				<td>${trainings.idtw}</td>
				<td>${trainings.idtp}</td>
				<td>${trainings.idcreatedby}</td>
				<td>${trainings.creationdate}</td>
				<td>${trainings.trainsdate}</td>
				<td>${trainings.trainsnum}</td>
				<td>${trainings.idlocation}</td>
				<td>${trainings.idparty}</td>
				<td>${trainings.additionalinfo}</td>
				<td>${trainings.idchangeby}</td>
				<td>${trainings.changedate}</td>
				<td><form method="post" action="trainings/delete"><input type="hidden" name="idt" value="${trainings.idt}"/><input type="submit" value="Delete"/></form></td>
			</tr>
		</c:forEach>
	</table>
</c:if>


</body>
</html>
