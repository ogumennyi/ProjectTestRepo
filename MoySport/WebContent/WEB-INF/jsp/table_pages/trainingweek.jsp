<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Spring 3 MVC Series - Trainingweek List</title>
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

<h2>Trainingweek List</h2>

<form:form method="post" action="trainingweek/add" commandName="trainingweek">

	<table>
	<tr>
		<td><form:label path="idtw"><spring:message code="label.table_page.trainingweek.idtw"/></form:label></td>
		<td><form:input path="idtw" /></td> 
	</tr>
	<tr>
		<td><form:label path="idtp"><spring:message code="label.table_page.trainingweek.idtp"/></form:label></td>
		<td><form:input path="idtp" /></td> 
	</tr>
	<tr>
		<td><form:label path="idcreatedby"><spring:message code="label.table_page.trainingweek.idcreatedby"/></form:label></td>
		<td><form:input path="idcreatedby" /></td> 
	</tr>
	<tr>
		<td><form:label path="creationdate"><spring:message code="label.table_page.trainingweek.creationdate"/></form:label></td>
		<td><form:input path="creationdate" type="date"/></td> 
	</tr>
	<tr>
		<td><form:label path="weeknum"><spring:message code="label.table_page.trainingweek.weeknum"/></form:label></td>
		<td><form:input path="weeknum" /></td> 
	</tr>
	<tr>
		<td><form:label path="weekdbegin"><spring:message code="label.table_page.trainingweek.weekdbegin"/></form:label></td>
		<td><form:input path="weekdbegin" type="date"/></td> 
	</tr>
	<tr>
		<td><form:label path="weekdend"><spring:message code="label.table_page.trainingweek.weekdend"/></form:label></td>
		<td><form:input path="weekdend" type="date"/></td> 
	</tr>
	<tr>
		<td><form:label path="target"><spring:message code="label.table_page.trainingweek.target"/></form:label></td>
		<td><form:input path="target" /></td> 
	</tr>
	<tr>
		<td><form:label path="idtp"><spring:message code="label.table_page.trainingweek.idtp"/></form:label></td>
		<td><form:input path="idtp" /></td> 
	</tr>
	<tr>
		<td><form:label path="idlocation"><spring:message code="label.table_page.trainingweek.idlocation"/></form:label></td>
		<td><form:input path="idlocation" /></td> 
	</tr>
	<tr>
		<td><form:label path="dow1"><spring:message code="label.table_page.trainingweek.dow1"/></form:label></td>
		<td><form:input path="dow1" /></td> 
	</tr>
	<tr>
		<td><form:label path="dow2"><spring:message code="label.table_page.trainingweek.dow2"/></form:label></td>
		<td><form:input path="dow2" /></td> 
	</tr>
	<tr>
		<td><form:label path="dow3"><spring:message code="label.table_page.trainingweek.dow3"/></form:label></td>
		<td><form:input path="dow3" /></td> 
	</tr>
	<tr>
		<td><form:label path="dow4"><spring:message code="label.table_page.trainingweek.dow4"/></form:label></td>
		<td><form:input path="dow4" /></td> 
	</tr>
	<tr>
		<td><form:label path="dow5"><spring:message code="label.table_page.trainingweek.dow5"/></form:label></td>
		<td><form:input path="dow5" /></td> 
	</tr>
	<tr>
		<td><form:label path="dow6"><spring:message code="label.table_page.trainingweek.dow6"/></form:label></td>
		<td><form:input path="dow6" /></td> 
	</tr>
	<tr>
		<td><form:label path="dow7"><spring:message code="label.table_page.trainingweek.dow7"/></form:label></td>
		<td><form:input path="dow7" /></td> 
	</tr>
	<tr>
		<td><form:label path="ispause"><spring:message code="label.table_page.trainingweek.ispause"/></form:label></td>
		<td><form:input path="ispause" /></td> 
	</tr>
	<tr>
		<td><form:label path="idchangeby"><spring:message code="label.table_page.trainingweek.idchangeby"/></form:label></td>
		<td><form:input path="idchangeby" /></td> 
	</tr>
	<tr>
		<td><form:label path="changedate"><spring:message code="label.table_page.trainingweek.changedate"/></form:label></td>
		<td><form:input path="changedate" type="date"/></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="<spring:message code="label.table_page.trainingweek.addtrainingweek"/>"/>
		</td>
	</tr>
</table>	
</form:form>

<c:if  test="${!empty trainingweekList}">
	<table class="data">
		<tr>
			<th>IDTW</th>
			<th>IDTP</th>
			<th>IDCREATEDBY</th>
			<th>CREATIONDATE</th>
			<th>WEEKNUM</th>
			<th>WEEKDBEGIN</th>
			<th>WEEKDEND</th>
			<th>TARGET</th>
			<th>IDLOCATION</th>
			<th>DOW1</th>
			<th>DOW2</th>
			<th>DOW3</th>
			<th>DOW4</th>
			<th>DOW5</th>
			<th>DOW6</th>
			<th>DOW7</th>
			<th>ISPAUSE</th>
			<th>IDCHANGEBY</th>
			<th>CHANGEDATE</th>
			<th>&nbsp;</th>
		</tr>
		<c:forEach items="${trainingweekList}" var="trainingweek">
			<tr>
				<td>${trainingweek.idtw}</td>
				<td>${trainingweek.idtp}</td>
				<td>${trainingweek.idcreatedby}</td>
				<td>${trainingweek.creationdate}</td>
				<td>${trainingweek.weeknum}</td>
				<td>${trainingweek.weekdbegin}</td>
				<td>${trainingweek.weekdend}</td>
				<td>${trainingweek.target}</td>
				<td>${trainingweek.idlocation}</td>
				<td>${trainingweek.dow1}</td>
				<td>${trainingweek.dow2}</td>
				<td>${trainingweek.dow3}</td>
				<td>${trainingweek.dow4}</td>
				<td>${trainingweek.dow5}</td>
				<td>${trainingweek.dow6}</td>
				<td>${trainingweek.dow7}</td>
				<td>${trainingweek.ispause}</td>
				<td>${trainingweek.idchangeby}</td>
				<td>${trainingweek.changedate}</td>
				<td><form method="post" action="trainingweek/delete"><input type="hidden" name="idtw" value="${trainingweek.idtw}"/><input type="submit" value="Delete"/></form></td>
			</tr>
		</c:forEach>
	</table>
</c:if>


</body>
</html>
