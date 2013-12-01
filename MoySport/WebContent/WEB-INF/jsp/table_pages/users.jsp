<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="cs" lang="cs">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Spring 3 MVC Series - User List</title>
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

<h2>User List</h2>

<c:if  test="${!empty userList}">
	<table class="data">
		<tr>
			<th>IDUSER</th>
		    <th>ISBOT</th>
		    <th>IDCREATEDBY</th>
		    <th>NICKNAME</th>
		    <th>FIRSTNAME</th>
		    <th>LASTNAME</th>
		    <th>MIDDLENAME</th>
		    <th>MPHONE</th>
		    <th>EMAIL</th>
		    <th>ISEMAILVERIFIED</th>
		    <th>SOCIALNETWORKLOGIN</th>
		    <th>SOCIALNETWORKTYPE</th>
		    <th>BIRTHDATE</th>
		    <th>PERFMARK</th>
		    <th>REPMARK</th>
		    <th>POSITIVEREP</th>
		    <th>NEGATIVEREP</th>
		    <th>STATUS</th>
		    <th>LOCALE</th>
		    <th>GMT</th>
		    <th>PWD</th>
		    <th>CREATIONDATE</th>
		    <th>CHANGEDATE</th>
		    <th>IDCHANGEBY</th>
			<th>&nbsp;</th>
		</tr>
		<c:forEach items="${userList}" var="user">
			<tr>
				<td>${user.iduser}</td>
			    <td>${user.isbot}</td>
			    <td>${user.idcreatedby}</td>
			    <td>${user.nickname}</td>
			    <td>${user.firstname}</td>
			    <td>${user.lastname}</td>
			    <td>${user.middlename}</td>
			    <td>${user.mphone}</td>
			    <td>${user.email}</td>
			    <td>${user.isemailverified}</td>
			    <td>${user.socialnetworklogin}</td>
			    <td>${user.socialnetworktype}</td>
			    <td>${user.birthdate}</td>
			    <td>${user.perfmark}</td>
			    <td>${user.repmark}</td>
			    <td>${user.positiverep}</td>
			    <td>${user.negativerep}</td>
			    <td>${user.status}</td>
			    <td>${user.locale}</td>
			    <td>${user.gmt}</td>
			    <td>${user.pwd}</td>
			    <td>${user.creationdate}</td>
			    <td>${user.changedate}</td>
			    <td>${user.idchangeby}</td>
			    <td><form method="post" action="users/delete"><input type="hidden" name="idUser" value="${userskill.iduser}"/><input type="submit" value="Delete"/></form></td>
			</tr>
		</c:forEach>
	</table>
</c:if>


</body>
</html>