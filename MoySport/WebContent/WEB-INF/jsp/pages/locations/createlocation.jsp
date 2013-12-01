<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<form action="${pageContext.request.contextPath}/pages/locations/addlocation" method="post">
					<table>
						<tr>
							<td width="100%" valign="top">
								<table class="textFont" style="padding: 10px">
									<tr>
										<th class="heading" colspan="2" align="left">Создание локации</th>
									</tr>
									<tr>
										<td class="fldName">Название локации:</td>
										<td class="fldText"><input type="text" value="" class="inputText">${locations.name}</td>
									</tr>
									<tr>
										<td class="fldName">Страна:</td>
										<td class="fldText"><input type="text" value="Украина" class="inputText">${locations.country}</td>
									</tr>
									<tr>
										<td class="fldName">Регион:</td>
										<td class="fldText"><input type="text" value="Киев" class="inputText">${locations.region}</td>
									</tr>
									<tr>
										<td class="fldName">Город:</td>
										<td class="fldText"><input type="text" value="Киев" class="inputText">${locations.city}</td>
									</tr>
									<tr>
										<td class="fldName">Район:</td>
										<td class="fldText"><input type="text" value="" class="inputText">${locations.district}</td>
									</tr>
									<tr>
										<td class="fldName">Улица:</td>
										<td class="fldText"><input type="text" value="" class="inputText">${locations.street}</td>
									</tr>
									<tr>
										<td class="fldName">Дом:</td>
										<td class="fldText"><input type="text" value="" class="inputText">${locations.building}</td>
									</tr>
									<tr>
										<td class="fldName">Почтовый Индекс:</td>
										<td class="fldText"><input type="text" value="" class="inputText">${locations.zip}</td>
									</tr>
									<tr>
										<td class="fldName">Описание объекта:</td>
										<td class="fldText"><input type="text" value="" class="inputText">${locations.description}</td>
									</tr>
									<tr>
										<td class="fldName">Контакты:</td>
										<td class="fldText"><input type="text" value="" class="inputText">${locations.contacts}</td>
									</tr>
									<tr>
										<td class="fldName">web-site:</td>
										<td class="fldText"><input type="text" value="http://google.com" class="inputText">${locations.httplink}</td>
									</tr>
									<tr>
										<td class="fldName" colspan="2" align="left"><input type="submit" class="submit" value="Создать" style="cursor: pointer;"></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<jsp:include page="../../templates/cabinet.jsp"/>
		</div>
		<jsp:include page="../../templates/footer.jsp"/>
	</div>
</body>
</html>