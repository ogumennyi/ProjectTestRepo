<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						<td><b>Кол-во игр</b></td>
					</tr>
					<tr class="add">
						<td><a href="${pageContext.request.contextPath}/pages/locations/viewlocation">КПИ</a></td>
						<td>Киев</td>
						<td>ул.Шевченка 15</td>
						<td>12</td>
					</tr>
					<tr class="even">
						<td><a href="${pageContext.request.contextPath}/pages/locations/viewlocation">КИСИ</a></td>
						<td>Киев</td>
						<td>ул.Ленина 11</td>
						<td>3</td>
					</tr>
					<tr class="add">
						<td><a href="${pageContext.request.contextPath}/pages/locations/viewlocation">унив.Шевченика</a></td>
						<td>Киев</td>
						<td>ул.Манютки 5</td>
						<td>10</td>
					</tr>
					<tr class="even">
						<td><a href="${pageContext.request.contextPath}/pages/locations/viewlocation">НУХТ</a></td>
						<td>Киев</td>
						<td>ул.Малютки 7</td>
						<td>4</td>
					</tr>
					<tr class="add">
						<td><a href="${pageContext.request.contextPath}/pages/locations/viewlocation">Поплавского</a></td>
						<td>Киев</td>
						<td>ул.Победы 88</td>
						<td>20</td>
					</tr>
					<tr class="even">
						<td><a href="${pageContext.request.contextPath}/pages/locations/viewlocation">Школа №23</a></td>
						<td>Харьков</td>
						<td>ул.Заводская 115</td>
						<td>8</td>
					</tr>
					<tr class="add">
						<td><a href="${pageContext.request.contextPath}/pages/locations/viewlocation">Школа №43</a></td>
						<td>Донецк</td>
						<td>ул.Шахтерская 10</td>
						<td>8</td>
					</tr>
					<tr class="even">
						<td><a href="${pageContext.request.contextPath}/pages/locations/viewlocation">Стадион Спартак</a></td>
						<td>Одесса</td>
						<td>ул.Приморская 3</td>
						<td>12</td>
					</tr>
					<tr class="add">
						<td><a href="${pageContext.request.contextPath}/pages/locations/viewlocation">Зал НСК Олимпийский</a></td>
						<td>Киев</td>
						<td>ул.Олимпийская 21</td>
						<td>16</td>
					</tr>
					<tr class="even">
						<td><a href="${pageContext.request.contextPath}/pages/locations/viewlocation">Школа №1</a></td>
						<td>Львов</td>
						<td>ул.Бандеры 8</td>
						<td>14</td>
					</tr>

				</table>
				<a href="#"><b>Вернуться к поиску Локаций</b></a>

			</div>
			<jsp:include page="../../templates/cabinet.jsp"/>
		</div>
		<jsp:include page="../../templates/footer.jsp"/>
	</div>
</body>
</html>