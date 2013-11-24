<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Spring 3 MVC Series - Gameparties List</title>
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

<h2>Gameparties List</h2>

<form:form method="post" action="gameparties/add" commandName="gameparties">

	<table>
	<%-- 
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
	--%>
</table>	
</form:form>

<c:if  test="${!empty gamepartiesList}">
	<table class="data">
		<tr>
			<th>IDGP</th>
		    <th>IDGAME</th>
		    <th>IDUSER</th>
		    <th>VISITED</th>
		    <th>MARK</th>
		    <th>IDTEAM</th>
			<th>&nbsp;</th>
		</tr>
		<c:forEach items="${gamepartiesList}" var="gameparties">
			<tr>
				<td>${gameparties.idgp}</td>
				<td>${gameparties.idgame}</td>
				<td>${gameparties.iduser}</td>
				<td>${gameparties.visited}</td>
				<td>${gameparties.mark}</td>
				<td>${gameparties.idteam}</td>
				<td><form method="post" action="eventgames/delete"><input type="hidden" name="idGame" value="${gameparties.idgp}"/><input type="submit" value="Delete"/></form></td>
			</tr>
		</c:forEach>
	</table>
</c:if>


</body>
</html>
