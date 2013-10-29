<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>MoySport - Login page</title>
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

Login page

<c:if test="${'fail' eq param.auth}">
    <div style="color:red">
            Login Failed!!!<br />
            Reason : ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
     </div>
</c:if>
<form action="j_spring_security_check" method="post">
        <table>
            <tr>
                <td>Username:</td>
                <td><input type='text' name='j_username' /></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type='password' name='j_password'></td>
            </tr>
            <tr>
                <td colspan='2'><input name="submit" type="submit" value="Submit"></td>
            </tr>
        </table>
    </form>
</body>
</html>