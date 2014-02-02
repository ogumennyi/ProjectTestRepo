<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Мой Спорт</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/print.css" media="print" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/button.css" media="screen" />
	</head>
	<body>
		<div id="view">
			<jsp:include page="../../templates/header.jsp">
				<jsp:param name="page" value="searchlocations" />
			</jsp:include>
			<div id="content">
				<div id="contentBlock">
					<h2>Поиск локации</h2>
					<br>
					<form action="#" method="post">
						<fieldset>
							<div>
								<div style="float: left; margin-right: 25px">
									<div>Вид Спорта</div>
									<select name="sport_type" class="inputText">
										<option selected>Все виды
										<option>Футбол
										<option>Баскетбол
										<option>Хоккей
										<option>Плавание
									</select>
								</div>
								<div style="float: left;">
									<div>Название Локация</div>
									<input type="text" value="" class="inputText">
								</div>
							</div>
	
							<br style="clear: both;">
							<br style="clear: both;">
							<div>
								<div style="float: left; margin-right: 25px">
									<div>Город</div>
									<input type="text" value="" class="inputText">
								</div>
								<div style="float: left;">
									<div>Улица</div>
									<input type="text" value="" class="inputText">
								</div>
							</div>
							<br style="clear: both;"> <br style="clear: both;">
	
							<div>
								<div style="float: left;">
									<input type="checkbox" name="" value="">Искать в моем городе
								</div>
							</div>
							<br style="clear: both;"> <br style="clear: both;">
							<div>
								<div style="float: left;">
									<input type="checkbox" name="" value="">Искать поля, где играют друзья
								</div>
							</div>
							<br style="clear: both;"> <br style="clear: both;">
							<p>
								<input type="submit" class="submit" value="Найти">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/pages/locations/createlocation"><b>Создать новую локацию</b></a>
							</p>
						</fieldset>
						<br>
					</form>
	
					<p>Пример вывода результатов поиска локаций</p>
					<table class="regular">
						<tr>
							<td><b>Локация</b></td>
							<td><b>Город</b></td>
							<td><b>Адрес</b></td>
							<td><b>Контактный телефон</b></td>
							<td><b>Интернет страница</b></td>
							<td><b>Кол-во мероприятий</b></td>
						</tr>
						<c:forEach items="${locationsList}" var="location">
							<tr class="add">
								<td><a href="${pageContext.request.contextPath}/pages/locations/viewlocation/${location.idlocation}">${location.name}</a></td>
								<td>${location.city}</td>
								<td>${location.district}, ${location.street}, ${location.building}</td>
								<td>${location.contacts}</td>
								<td><a href="${location.httplink}">${location.httplink}</a></td>
								<td>${location.checkin}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<jsp:include page="../../templates/cabinet.jsp"/>
			</div>
			<jsp:include page="../../templates/footer.jsp"/>
		</div>
	</body>
</html>