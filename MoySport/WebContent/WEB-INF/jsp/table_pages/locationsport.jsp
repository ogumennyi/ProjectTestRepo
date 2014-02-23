<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Spring 3 MVC Series - LocationSpotr List</title>
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

<h2>LocationSpotr List</h2>

<form:form method="post" action="locationsport/add" commandName="locationsport">

	<table>
	<tr>
		<td><form:label path="idsport"><spring:message code="label.table_page.locationsport.idsport"/></form:label></td>
		<td><form:input path="idsport" /></td> 
	</tr>
	<tr>
		<td><form:label path="idlocation"><spring:message code="label.table_page.locationsport.idlocation"/></form:label></td>
		<td><form:input path="idlocation" /></td> 
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="<spring:message code="label.table_page.trainingweek.addtrainingweek"/>"/>
		</td>
	</tr>
</table>	
</form:form>

<c:if  test="${!empty locationsportList}">
	<table class="data">
		<tr>
			<th>IDTW</th>
			<th>IDTP</th>
			<th>IDCREATEDBY</th>
			<th>&nbsp;</th>
		</tr>
		<c:forEach items="${locationsportList}" var="locationsport">
			<tr>
				<td>${locationsport.idls}</td>
				<td>${locationsport.idsport}</td>
				<td>${locationsport.idlocation}</td>
				<td><form method="post" action="locationsport/delete"><input type="hidden" name="idls" value="${locationsport.idls}"/><input type="submit" value="Delete"/></form></td>
			</tr>
		</c:forEach>
	</table>
</c:if>


</body>
</html>
