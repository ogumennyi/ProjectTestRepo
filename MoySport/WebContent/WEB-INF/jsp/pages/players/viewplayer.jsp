<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
<title>Мой Спорт</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="<%=getServletContext().getContextPath()%>/css/default.css" media="screen" />
<link rel="stylesheet" type="text/css" href="<%=getServletContext().getContextPath()%>/css/print.css" media="print" />
</head>
<body>
	<div id="view">
		<jsp:include page="../../templates/header.jsp">
			<jsp:param name="page" value="searchplayers" />
		</jsp:include>
		<div id="content">
			<div id="dataBlock">
				<table class="regular">
					<tr>
						<td><img src="<%=getServletContext().getContextPath()%>/img/ivan.jpg" alt="" class="left shadow" style="border: 0; width: 200px" align="middle" /></td>
						<td width="100%" valign="top">
							<table class="regular textFont" style="padding: 10px">
								<tr>
									<th class="heading" colspan="2" align="left">Игрок: ${user.firstname} ${user.lastname}</th>
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
									<td class="fldName">Локация:</td>
									<td class="fldText">локация</td>
								</tr>
								<tr>
									<td class="fldName">Виды спорта:</td>
									<td class="fldText">Виды спорта</td>
								</tr>
								<tr>
									<td class="fldName">Телефон:</td>
									<td class="fldText">${user.mphone}</td>
								</tr>
								<tr>
									<td class="fldName">E-mail:</td>
									<td class="fldText">${user.email}</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
			<jsp:include page="../../templates/cabinet.jsp"/>
		</div>
		<jsp:include page="../../templates/footer.jsp"/>
	</div>
</body>
</html>