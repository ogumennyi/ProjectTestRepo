<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
	<script type="text/javascript" src="<c:url value="/js/jquery_1_6_4.js"/>"></script>
</head>
<body>
	<script type="text/javascript">
		function onChangeNickname () {
			var chNickname = document.getElementById('nickname').value;
			$.ajaxSetup({ 
				beforeSend: function() { $("#nickname_rez").html("Begin send to service ...");},   
				complete: function(){},
				success: function() {} ,
				scriptCharset: "utf-8" 
			});
			$.post("<%= getServletContext().getContextPath()%>/user/check_nickname", {nickname: chNickname}, onRequestSuccess);
		}
		function onRequestSuccess (inObj) {
			//alert('Hello');
			//alert(inObj);
			$("#nickname_rez").html('check result:'+inObj+' img will be: ');
			var imgPath = "<%= getServletContext().getContextPath()%>/img/100pxNO.png";
			if (inObj == 'ok') var imgPath = "<%= getServletContext().getContextPath()%>/img/100pxOK.png";
			$('<img src="'+ imgPath +'">').load(function() {
												$(this).width(30).height(30).appendTo('#nickname_rez');
											}
			);
		}
	</script>

<c:if test="${'fail' eq auth}">
    <div style="color:red">
            Login Failed!!!<br />
            Reason : ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
     </div>
</c:if>
<c:if test="${empty auth or 'fail' eq auth}">
<form action="<%= getServletContext().getContextPath()%>/j_spring_security_check" method="post">
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
    <a href="<%= getServletContext().getContextPath()%>/user">Create new user</a>
</form>
</c:if>
<c:if test="${'new' eq auth}">
	<form:form method="post" action="user/new" commandName="user">
		<table>
			<tr>
				<td><form:label path="nickname"><spring:message code="label.login.nickname"/></form:label></td>
				<!-- onkeypress="onRequestSuccess(this)"-->
				<td><form:input path="nickname" onchange="onChangeNickname()"/></td>
				<td><div id="nickname_rez"> </div></td>
			</tr>
			<tr>
				<td><form:label path="pwd"><spring:message code="label.login.pwd"/></form:label></td>
				<td><form:input path="pwd" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="<spring:message code="label.login.adduser"/>"/>
				</td>
			</tr>
		</table>	
	</form:form>
	<a href="<%= getServletContext().getContextPath()%>/login/">Login page</a>
</c:if>
</body>
</html>