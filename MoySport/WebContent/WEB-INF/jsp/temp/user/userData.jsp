<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="cs" lang="cs">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>User data page</title>
    <style type="text/css">
    	a {text-decoration: none; color:#B32233;}
    	table {font-size:13px;}
    	.heading {padding: 0px 0px 15px 25px; font-weight: bold; color: #056B76}
    	.fldName {padding: 5px 0px 5px 25px; color: #69A3AA}
    	.fldText {padding: 5px 0px 5px 5px; color: #056B76}
    	.textFont {font-family: Tahoma, Geneva, sans-serif}
    </style>
</head>
<body style="font-family: Georgia, serif; padding:0px; margin:0px;">

<div style="width:100%; height:50px; background-color:#8DC57D; text-align:center;">
	<table width="800px" align="center">
		<tr>
			<td style="font-size:30; font-weight:bold; padding-top: 2px" width="40%"><a style="color:#5D6CDA" href="${pageContext.request.contextPath}/userhome">Moy Sport</a></td>
			<td style="font-size:18; font-weight:bold; padding-top: 5px" width="20%"><a href="">Events</a></td>
			<td style="font-size:18; font-weight:bold; padding-top: 5px" width="30%"><a href="">Locations</a></td>
			<td style="font-size:14; font-weight:bold; padding-top: 5px" width="10%"><a href="j_spring_security_logout">Sign out</a></td>
		</tr>
	</table>
</div>

<div>
	<table width="800px" align="center" style="background-color:#D0D179;">
		<tr>
			<td style="font-size:14; font-weight:bold; background-color:#E3E494" align="center" width="33%"><a href="">Player</a></td>
			<td style="font-size:14; font-weight:bold; background-color:#D0D179" align="center" width="33%"><a href="">Activities</a></td>
			<td style="font-size:14; font-weight:bold; background-color:#D0D179" align="center" width="33%"><a href="">Trainings</a></td>
		</tr>
	</table>
	<table cellpadding="0" cellspacing="5" width="800px" align="center">
		<tr>
			<td style="background-color:#D0D179;"><img alt="" src="img/player.png" border="1" style="margin:2px; border-style: none;"></td>
			<td style="background-color:#F6F7C9;" width="100%" valign="top">
				<c:if  test="${!empty user}">
					<table class="textFont" cellpadding="0" cellspacing="0" width="100%" style="padding: 10px">
						<tr><th class="heading" colspan="2" align="left">Personal information</th></tr>
						<tr><td class="fldName" width="25%">First name:</td><td class="fldText">${user.firstname}</td></tr>
						<tr><td class="fldName">Last name:</td><td class="fldText">${user.lastname}</td></tr>
						<tr><td class="fldName">Nick:</td><td class="fldText">${user.nickname}</td></tr>
						<tr><td class="fldName">Phone:</td><td class="fldText">${user.mphone}</td></tr>
						<tr><td class="fldName">E-mail:</td><td class="fldText">${user.email}</td></tr>
					</table>
				</c:if>			
			</td>
		</tr>
	</table>
</div>

</body>
</html>