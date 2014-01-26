<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="cs" lang="cs">
<head>
<title>Мой Спорт</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default.css" media="screen" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/print.css" media="print" />
</head>
<body>
	<div id="view">
		<jsp:include page="../../templates/header.jsp">
			<jsp:param name="page" value="searchlocations" />
		</jsp:include>
		<div id="content">
			<div id="dataBlock">
				<table class="regular">
					<tr>
						<td width="100%" valign="top">
							<table class="regular textFont" style="padding: 10px">
								<tr>
									<th class="heading" colspan="2" align="left">Локация: ${location.name}</th>
								</tr>
								<tr>
									<td class="fldName">ID Локации:</td>
									<td class="fldText">${location.idlocation}</td>
								</tr>
								<tr>
									<td class="fldName">Количество проведенных игр:</td>
									<td class="fldText">${location.checkin}</td>
								</tr>
								<tr>
									<td class="fldName">Виды спорта на локации:</td>
									<td class="fldText">${location.tag}</td>
								</tr>
								<tr>
									<td class="fldName">Страна:</td>
									<td class="fldText">${location.country}</td>
								</tr>
								<tr>
									<td class="fldName">Регион:</td>
									<td class="fldText">${location.region}</td>
								</tr>
								<tr>
									<td class="fldName">Город:</td>
									<td class="fldText">${location.city}</td>
								</tr>
								<tr>
									<td class="fldName">Район:</td>
									<td class="fldText">${location.district}</td>
								</tr>
								<tr>
									<td class="fldName">Улица:</td>
									<td class="fldText">${location.street}</td>
								</tr>
								<tr>
									<td class="fldName">Дом:</td>
									<td class="fldText">${location.building}</td>
								</tr>
								<tr>
									<td class="fldName">Почтовый Индекс:</td>
									<td class="fldText">${location.zip}</td>
								</tr>
								<tr>
									<td class="fldName">Описание объекта:</td>
									<td class="fldText">${location.description}</td>
								</tr>
								<tr>
									<td class="fldName">Контакты:</td>
									<td class="fldText">${location.contacts}</td>
								</tr>
								<tr>
									<td class="fldName">web-site:</td>
									<td class="fldText">${location.httplink}</td>
								</tr>
								<tr>
									<td class="fldName">Created By:</td>
									<td class="fldText">${location.idcreatedby}</td>
								</tr>
								<tr>
									<td class="fldName">Creation Date:</td>
									<td class="fldText">${location.creationdate}</td>
								</tr>
								<tr>
									<td class="fldName">Change By:</td>
									<td class="fldText">${location.idchangeby}</td>
								</tr>
								<tr>
									<td class="fldName">Change Date:</td>
									<td class="fldText">${location.changedate}</td>
								</tr>
								<tr>
									<td class="fldName">Статус Локации:</td>
									<td class="fldText">${location.status}</td>
								</tr>
								<tr>
									<td class="fldName"><a href="${pageContext.request.contextPath}/pages/locations/editlocation/${location.idlocation}"><b>Редактировать локацию</b></a></td>
								</tr>
								<tr>
									<td class="fldName" colspan="2" align="center">Блок Переписки пользователей</td>
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