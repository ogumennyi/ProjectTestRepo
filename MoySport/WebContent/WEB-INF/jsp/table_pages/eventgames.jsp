<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="cs" lang="cs">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Spring 3 MVC Series - Eventgames List</title>
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

<h2>Eventgames List</h2>

<form:form method="post" action="eventgames/add" commandName="eventgames">

	<table>
	<tr>
		<td><form:label path="idevent"><spring:message code="label.table_page.eventgames.idevent"/></form:label></td>
		<td><form:input path="idevent" /></td> 
	</tr>
	<tr>
		<td><form:label path="starttime"><spring:message code="label.table_page.eventgames.starttime"/></form:label></td>
		<td><form:input path="starttime" type="date"/></td>
	</tr>
	<tr>
		<td><form:label path="endtime"><spring:message code="label.table_page.eventgames.endtime"/></form:label></td>
		<td><form:input path="endtime" type="date"/></td>
	</tr>
	<tr>
		<td><form:label path="comments"><spring:message code="label.table_page.eventgames.comments"/></form:label></td>
		<td><form:input path="comments" /></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="<spring:message code="label.table_page.eventgames.addeventgames"/>"/>
		</td>
	</tr>
</table>	
</form:form>

<c:if  test="${!empty eventgamesList}">
	<table class="data">
		<tr>
			<th>IDGAME</th>
			<th>IDEVENT</th>
			<th>STARTTIME</th>
			<th>ENDTIME</th>
			<th>COMMENTS</th>
			<th>&nbsp;</th>
		</tr>
		<c:forEach items="${eventgamesList}" var="eventgames">
			<tr>
				<td>${eventgames.idgame}</td>
				<td>${eventgames.idevent}</td>
				<td>${eventgames.starttime}</td>
				<td>${eventgames.endtime}</td>
				<td>${eventgames.comments}</td>
				<td><form method="post" action="eventgames/delete"><input type="hidden" name="idGame" value="${eventgames.idgame}"/><input type="submit" value="Delete"/></form></td>
			</tr>
		</c:forEach>
	</table>
</c:if>


</body>
</html>
