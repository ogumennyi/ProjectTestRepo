<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Мой Спорт</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="<%=getServletContext().getContextPath()%>/css/default.css" media="screen" />
<link rel="stylesheet" type="text/css" href="<%=getServletContext().getContextPath()%>/css/print.css" media="print" />
</head>
<body>
	<div id="view">
		<jsp:include page="../../templates/header.jsp"/>
		<div id="content">
			<div id="dataBlock">
				<table class="regular">
					<tr>
						<td valign=top><img src="<%=getServletContext().getContextPath()%>/img/aleks.jpg" alt="" class="left shadow" style="border: 0; width: 200px" align="middle" /></td>
						<td width="100%" valign="top">
							<table class="textFont regular" style="padding: 10px">
								<tr>
									<th class="heading" colspan="2" align="left">Личная информация</th>
								</tr>
								<tr>
									<td class="fldName">Имя:</td>
									<td class="fldText">${user.firstname}</td>
								</tr>
								<tr>
									<td class="fldName">Фамилия:</td>
									<td class="fldText">${user.lastname}</td>
								</tr>
								<tr>
									<td class="fldName">Никнейм:</td>
									<td class="fldText">${user.nickname}</td>
								</tr>
								<tr>
									<td class="fldName">Рейтинг:</td>
									<td class="fldText">рейтинг</td>
								</tr>
								<tr>
									<td class="fldName">Кол-во игр:</td>
									<td class="fldText">кол-во игр</td>
								</tr>
								<tr>
									<td class="fldName">Телефон:</td>
									<td class="fldText">${user.mphone}</td>
								</tr>
								<tr>
									<td class="fldName">E-mail:</td>
									<td class="fldText">${user.email}</td>
								</tr>
								<tr>
									<td class="fldName" colspan="2"><a href="<%=getServletContext().getContextPath()%>/pages/user/editprofile"><br>Редактировать данные</a></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
			<jsp:include page="../../templates/cabinet.jsp">
				<jsp:param name="page" value="home" />
			</jsp:include>
		</div>
		<jsp:include page="../../templates/footer.jsp"/>
	</div>
</body>
</html>