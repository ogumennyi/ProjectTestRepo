<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="cs" lang="cs">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Spring 3 MVC Series - TrainingPlan List</title>
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

<h2>TrainingPlan List</h2>

<c:if  test="${!empty trainingplanList}">
	<table class="data">
		<tr>
			<th>IDTP</th>
		    <th>IDCREATEDBY</th>
		    <th>CREATIONDATE</th>
		    <th>NAMETP</th>
		    <th>DESCRIPTION</th>
		    <th>IDSPORT</th>
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
		    <th>IMPORTEVENTS</th>
		    <th>COPYDATA</th>
		    <th>RATING</th>
		    <th>RATINGDATE</th>
		    <th>IDCHANGEBY</th>
		    <th>CHANGEDATE</th>
			<th>&nbsp;</th>
		</tr>
		<c:forEach items="${trainingplanList}" var="trainingplan">
			<tr>
				<td>${trainingplan.idtp}</td>
			    <td>${trainingplan.idcreatedby}</td>
			    <td>${trainingplan.creationdate}</td>
			    <td>${trainingplan.nametp}</td>
			    <td>${trainingplan.description}</td>
			    <td>${trainingplan.idsport}</td>
			    <td>${trainingplan.target}</td>
			    <td>${trainingplan.idlocation}</td>
			    <td>${trainingplan.dow1}</td>
			    <td>${trainingplan.dow2}</td>
			    <td>${trainingplan.dow3}</td>
			    <td>${trainingplan.dow4}</td>
			    <td>${trainingplan.dow5}</td>
			    <td>${trainingplan.dow6}</td>
			    <td>${trainingplan.dow7}</td>
			    <td>${trainingplan.ispause}</td>
			    <td>${trainingplan.importevents}</td>
			    <td>${trainingplan.copydata}</td>
			    <td>${trainingplan.rating}</td>
			    <td>${trainingplan.ratingdate}</td>
			    <td>${trainingplan.idchangeby}</td>
			    <td>${trainingplan.changedate}</td>
			    <td><form method="post" action="trainingplan/delete"><input type="hidden" name="idTP" value="${trainingplan.idtp}"/><input type="submit" value="Delete"/></form></td>
			</tr>
		</c:forEach>
	</table>
</c:if>


</body>
</html>