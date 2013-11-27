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
		<jsp:include page="../../templates/header.jsp">
			<jsp:param name="page" value="searchevents" />
		</jsp:include>
		<div id="content">
			<div id="contentBlock">
				<h2>Поиск игры</h2>
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
							<div style="float: left; margin-right: 25px">
								<div>Локация</div>
								<input type="text" value="" class="inputText">
							</div>
							<div style="float: left; margin-right: 25px">
								<div>Ключевое слово (Напр. Название игры )</div>
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
								<div>Дата (день/месяц/год)</div>
								<input type="text" value="" class="inputText">
							</div>
						</div>

						<br style="clear: both;"> <br style="clear: both;">
						<p>
							<input type="submit" class="submit" value="Найти">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="create_event.html"><b>Создать новую игру</b></a>
						</p>
					</fieldset>
					<br>
				</form>

				<p>Пример вывода результатов поиска игры</p>
				<table class="regular">
					<tr>
						<td><b>Название</b></td>
						<td><b>Локация</b></td>
						<td><b>До начала игры</b></td>
						<td><b>Вид игры</b></td>
						<td><b>Участники</b></td>
					</tr>
					<tr class="add">
						<td><a href="view_event.html">Лайф vs Киевстар</a></td>
						<td>КПИ</td>
						<td>3 часа</td>
						<td>футбол</td>
						<td>12/14</td>
					</tr>
					<tr class="even">
						<td><a href="view_event.html">Встреча 2</a></td>
						<td>КИСИ</td>
						<td>8 часа</td>
						<td>футбол</td>
						<td>3/8</td>
					</tr>
					<tr class="add">
						<td><a href="view_event.html">Встреча побегать</a></td>
						<td>унив.Шевченика</td>
						<td>1 день</td>
						<td>футбол</td>
						<td>10/20</td>
					</tr>
					<tr class="even">
						<td><a href="view_event.html">Встреча нубов</a></td>
						<td>НУХТ</td>
						<td>3 дня</td>
						<td>футбол</td>
						<td>4/14</td>
					</tr>
					<tr class="add">
						<td><a href="view_event.html">Игра века</a></td>
						<td>Поплавского</td>
						<td>8 дней</td>
						<td>футбол</td>
						<td>5/20</td>
					</tr>
					<tr class="even">
						<td><a href="view_event.html">Игра в школе 23</a></td>
						<td>Школа №23</td>
						<td>2 недели</td>
						<td>футбол</td>
						<td>4/8</td>
					</tr>
					<tr class="add">
						<td><a href="view_event.html">Игра в школе 43</a></td>
						<td>Школа №43</td>
						<td>16 дней</td>
						<td>баскетбол</td>
						<td>2/8</td>
					</tr>
					<tr class="even">
						<td><a href="view_event.html">Игра на Спартаке</a></td>
						<td>Стадион Спартак</td>
						<td>месяц</td>
						<td>футбол</td>
						<td>6/12</td>
					</tr>
					<tr class="add">
						<td><a href="view_event.html">Игра на Олимпийском</a></td>
						<td>Зал НСК Олимпийский</td>
						<td>пол-года</td>
						<td>футбол</td>
						<td>8/16</td>
					</tr>
					<tr class="even">
						<td><a href="view_event.html">Игра в школе №1</a></td>
						<td>Школа №1</td>
						<td>Заморожено</td>
						<td>велопробег</td>
						<td>14/14</td>
					</tr>
				</table>
				<a href="#"><b>Вернуться к поиску Игр</b></a>
			</div>
			<jsp:include page="../../templates/cabinet.jsp"/>
		</div>
		<jsp:include page="../../templates/footer.jsp"/>
	</div>
</body>
</html>