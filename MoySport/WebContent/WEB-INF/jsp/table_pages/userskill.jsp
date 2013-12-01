<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="cs" lang="cs">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Spring 3 MVC Series - UserSkill List</title>
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

<h2>UserSkill List</h2>

<c:if  test="${!empty userskillList}">
	<table class="data">
		<tr>
			<th>ID</th>
		    <th>IDUSER</th>
		    <th>IDSPORT</th>
		    <th>ACTCNT</th>
		    <th>LASTACTDATE</th>
		    <th>ACTRATING</th>
		    <th>ACTRATINGCNT</th>
		    <th>PERFMARK</th>
		    <th>SELFRATING</th>
		    <th>CHANGEDATE</th>
		    <th>IDCHANGEBY</th>
			<th>&nbsp;</th>
		</tr>
		<c:forEach items="${userskillList}" var="userskill">
			<tr>
				<td>${userskill.id}</td>
			    <td>${userskill.iduser}</td>
			    <td>${userskill.idsport}</td>
			    <td>${userskill.actcnt}</td>
			    <td>${userskill.lastactdate}</td>
			    <td>${userskill.actrating}</td>
			    <td>${userskill.actratingcnt}</td>
			    <td>${userskill.perfmark}</td>
			    <td>${userskill.selfrating}</td>
			    <td>${userskill.changedate}</td>
			    <td>${userskill.idchangeby}</td>
			    <td><form method="post" action="userskill/delete"><input type="hidden" name="iD" value="${userskill.id}"/><input type="submit" value="Delete"/></form></td>
			</tr>
		</c:forEach>
	</table>
</c:if>


</body>
</html>