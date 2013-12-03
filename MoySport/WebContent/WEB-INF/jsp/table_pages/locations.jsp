<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Spring 3 MVC Series - Locations List</title>
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

<h2>Locations List</h2>

<form:form method="post" action="locations/add" commandName="locations">

	<table>
	<tr>
		<td><form:label path="idlocation"><spring:message code="label.table_page.locations.idlocation"/></form:label></td>
		<td><form:input path="idlocation" /></td> 
	</tr>
	<tr>
		<td><form:label path="name"><spring:message code="label.table_page.locations.name"/></form:label></td>
		<td><form:input path="name" /></td> 
	</tr>
	<tr>
		<td><form:label path="country"><spring:message code="label.table_page.locations.country"/></form:label></td>
		<td><form:input path="country" /></td> 
	</tr>
	<tr>
		<td><form:label path="region"><spring:message code="label.table_page.locations.region"/></form:label></td>
		<td><form:input path="region" /></td> 
	</tr>
	<tr>
		<td><form:label path="city"><spring:message code="label.table_page.locations.city"/></form:label></td>
		<td><form:input path="city" /></td> 
	</tr>
	<tr>
		<td><form:label path="district"><spring:message code="label.table_page.locations.district"/></form:label></td>
		<td><form:input path="district" /></td> 
	</tr>
	<tr>
		<td><form:label path="street"><spring:message code="label.table_page.locations.street"/></form:label></td>
		<td><form:input path="street" /></td> 
	</tr>
	<tr>
		<td><form:label path="building"><spring:message code="label.table_page.locations.building"/></form:label></td>
		<td><form:input path="building" /></td> 
	</tr>
	<tr>
		<td><form:label path="zip"><spring:message code="label.table_page.locations.zip"/></form:label></td>
		<td><form:input path="zip" /></td> 
	</tr>
	<tr>
		<td><form:label path="description"><spring:message code="label.table_page.locations.description"/></form:label></td>
		<td><form:input path="description" /></td> 
	</tr>
	<tr>
		<td><form:label path="contacts"><spring:message code="label.table_page.locations.contacts"/></form:label></td>
		<td><form:input path="contacts" /></td> 
	</tr>
	<tr>
		<td><form:label path="httplink"><spring:message code="label.table_page.locations.httplink"/></form:label></td>
		<td><form:input path="httplink" /></td> 
	</tr>
	<tr>
		<td><form:label path="status"><spring:message code="label.table_page.locations.status"/></form:label></td>
		<td><form:input path="status" /></td> 
	</tr>
	<tr>
		<td><form:label path="checkin"><spring:message code="label.table_page.locations.checkin"/></form:label></td>
		<td><form:input path="checkin" /></td> 
	</tr>
	<tr>
		<td><form:label path="idcreatedby"><spring:message code="label.table_page.locations.idcreatedby"/></form:label></td>
		<td><form:input path="idcreatedby" /></td> 
	</tr>
	<tr>
		<td><form:label path="creationdate"><spring:message code="label.table_page.locations.creationdate"/></form:label></td>
		<td><form:input path="creationdate" type="date"/></td>
	</tr>
	<tr>
		<td><form:label path="changedate"><spring:message code="label.table_page.locations.changedate"/></form:label></td>
		<td><form:input path="changedate" type="date"/></td>
	</tr>
	<tr>
		<td><form:label path="idchangeby"><spring:message code="label.table_page.locations.idchangeby"/></form:label></td>
		<td><form:input path="idchangeby" /></td> 
	</tr>
	<tr>
		<td><form:label path="tag"><spring:message code="label.table_page.locations.tag"/></form:label></td>
		<td><form:input path="tag" /></td> 
	</tr>
	<tr>
		<td><form:label path="latitude"><spring:message code="label.table_page.locations.latitude"/></form:label></td>
		<td><form:input path="latitude" /></td> 
	</tr>
	<tr>
		<td><form:label path="longtitude"><spring:message code="label.table_page.locations.longtitude"/></form:label></td>
		<td><form:input path="longtitude" /></td> 
	</tr>
	<tr>
		<td><form:label path="pic"><spring:message code="label.table_page.locations.pic"/></form:label></td>
		<td><form:input path="pic" /></td> 
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="<spring:message code="label.table_page.locations.addlocations"/>"/>
		</td>
	</tr>
</table>	
</form:form>

<c:if  test="${!empty locationsList}">
	<table class="data">
		<tr>
			<th>IDLOCATION</th>
			<th>NAME</th>
			<th>COUNTRY</th>
			<th>REGION</th>
			<th>CITY</th>
			<th>DISTRICT</th>
			<th>STREET</th>
			<th>BUILDING</th>
			<th>ZIP</th>
			<th>DESCRIPTION</th>
			<th>CONTACTS</th>
			<th>HTTPLINK</th>
			<th>STATUS</th>
			<th>CHECKIN</th>
			<th>IDCREATEDBY</th>
			<th>CREATIONDATE</th>
			<th>CHANGEDATE</th>
			<th>IDCHANGEBY</th>
			<th>TAG</th>
			<th>LATITUDE</th>
			<th>LONGTITUDE</th>
			<th>PIC</th>
			<th>&nbsp;</th>
		</tr>
		<c:forEach items="${locationsList}" var="locations">
			<tr>
				<td>${locations.idlocation}</td>
				<td>${locations.name}</td>
				<td>${locations.country}</td>
				<td>${locations.region}</td>
				<td>${locations.city}</td>
				<td>${locations.district}</td>
				<td>${locations.street}</td>
				<td>${locations.building}</td>
				<td>${locations.zip}</td>
				<td>${locations.description}</td>
				<td>${locations.contacts}</td>
				<td>${locations.httplink}</td>
				<td>${locations.status}</td>
				<td>${locations.checkin}</td>
				<td>${locations.idcreatedby}</td>
				<td>${locations.creationdate}</td>
				<td>${locations.changedate}</td>
				<td>${locations.idchangeby}</td>
				<td>${locations.tag}</td>
				<td>${locations.latitude}</td>
				<td>${locations.longtitude}</td>
				<td>${locations.pic}</td>
				<td><form method="post" action="locations/delete"><input type="hidden" name="idlocation" value="${locations.idlocation}"/><input type="submit" value="Delete"/></form></td>
			</tr>
		</c:forEach>
	</table>
</c:if>


</body>
</html>
