<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Spring 3 MVC Series - Gameratings List</title>
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

<h2>Gameratings List</h2>

<form:form method="post" action="gameratings/add" commandName="gameratings">

	<table>
	<tr>
		<td><form:label path="idgr"><spring:message code="label.table_page.gameratings.idgr"/></form:label></td>
		<td><form:input path="idgr" /></td> 
	</tr>
	<tr>
		<td><form:label path="idgame"><spring:message code="label.table_page.gameratings.idgame"/></form:label></td>
		<td><form:input path="idgame" /></td> 
	</tr>
	<tr>
		<td><form:label path="idrankedplayer"><spring:message code="label.table_page.gameratings.idrankedplayer"/></form:label></td>
		<td><form:input path="idrankedplayer" /></td> 
	</tr>
	<tr>
		<td><form:label path="idestimateplayer"><spring:message code="label.table_page.gameratings.idestimateplayer"/></form:label></td>
		<td><form:input path="idestimateplayer" /></td> 
	</tr>
	<tr>
		<td><form:label path="estimatedate"><spring:message code="label.table_page.gameratings.estimatedate"/></form:label></td>
		<td><form:input path="estimatedate" type="date"/></td>
	</tr>
	<tr>
		<td><form:label path="estimatecomment"><spring:message code="label.table_page.gameratings.estimatecomment"/></form:label></td>
		<td><form:input path="estimatecomment" /></td> 
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="<spring:message code="label.table_page.gameratings.addgameratings"/>"/>
		</td>
	</tr>
</table>	
</form:form>

<c:if  test="${!empty gameratingsList}">
	<table class="data">
		<tr>
			<th>IDGR</th>
			<th>IDGAME</th>
			<th>IDRANKEDPLAYER</th>
			<th>IDESTIMATEPLAYER</th>
			<th>ESTIMATEDATE</th>
			<th>ESTIMATECOMMENT</th>
			<th>&nbsp;</th>
		</tr>
		<c:forEach items="${gameratingsList}" var="gameratings">
			<tr>
				<td>${gameratings.idgr}</td>
				<td>${gameratings.idgame}</td>
				<td>${gameratings.idrankedplayer}</td>
				<td>${gameratings.idestimateplayer}</td>
				<td>${gameratings.estimatedate}</td>
				<td>${gameratings.estimatecomment}</td>
				<td><form method="post" action="gameratings/delete"><input type="hidden" name="idgr" value="${gameratings.idgr}"/><input type="submit" value="Delete"/></form></td>
			</tr>
		</c:forEach>
	</table>
</c:if>


</body>
</html>
