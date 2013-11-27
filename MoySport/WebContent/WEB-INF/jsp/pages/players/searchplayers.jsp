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
			<jsp:param name="page" value="searchplayers" />
		</jsp:include>
		<div id="content">
			<div id="contentBlock">
				<div class="box boxText">
					<h2>Поиск игроков</h2>
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
									<div>Навыки</div>
									<select name="sport_type" class="inputText">
										<option selected>Мастер ( > 50 игр)
										<option>Любитель ( 10 - 50 игр)
										<option>Новичок ( < 10игр )
										<option>Любой уровень
									</select>
								</div>
								<div style="float: left; margin-right: 25px">
									<div>Рейтинг</div>
									<select name="sport_type" class="inputText">
										<option selected>Любой
										<option>5
										<option>4
										<option>3
										<option>2
										<option>1
									</select>
								</div>
							</div>

							<br style="clear: both;"> <br style="clear: both;">
							<div>
								<div style="float: left; margin-right: 25px">
									<div>Имя</div>
									<input type="text" value="" class="inputText">
								</div>
								<div style="float: left;">
									<div>Фамилия</div>
									<input type="text" value="" class="inputText">
								</div>
							</div>

							<br style="clear: both;"> <br style="clear: both;">

							<div>
								<div style="float: left;">
									<div>Ник Нейм</div>
									<input type="text" value="" class="inputText">
								</div>
							</div>
							<br style="clear: both;"> <br style="clear: both;">
							<div>
								<div style="float: left;">
									<div>Локация</div>
									<input type="text" value="" class="inputText">
								</div>
							</div>
							<br style="clear: both;"> <br style="clear: both;">
							<div>
								<div style="float: left;">
									<div>Позиция на поле (для некоторых видов спорта)</div>
									<select name="position_type" class="inputText">
										<option selected>Форвард
										<option>Полузащитник
										<option>Защитник
										<option>Воротарь
									</select>
								</div>
								<br style="clear: both;"> <br style="clear: both;">
								<p>
									<input type="submit" class="submit" value="Найти">
								</p>
						</fieldset>
						<br>
					</form>

					<p>Пример вывода результатов поиска игроков</p>
					<p>
					<table class="regular">
						<tr>
							<td><a href="#content"><img src="img/oleg.jpg" width="150px" alt="" class="left" /></a><br /></td>
							<td width=300px valign=top><strong><a href="view_public.html">Олег Гуменной</a></strong><br /> Игры:&nbsp;23<br /> Рейтинг:&nbsp;<img
								src="img/ball.jpg" width="20" alt="" class="left" /><img src="img/ball.jpg" width="20" alt="" class="left" /><img src="img/ball.jpg" width="20" alt=""
								class="left" /><img src="img/ball.jpg" width="20" alt="" class="left" /><br /> Позиция:&nbsp; Нападающий <br /> Локация:&nbsp;Киев<br /> Виды
								спорта:&nbsp;Футбол,Баскетбол,Волейбол <br /> <br /> <br /> <a href="#content">Добавить в Друзья</a>
								</p></td>
						</tr>
					</table>
				</div>

				<div class="box boxText">
					<p>
					<table class="regular">
						<tr>
							<td><a href="#content"><img src="img/ivan.jpg" width="150px" alt="" class="left" /></a><br /></td>
							<td width=300px valign=top><strong><a href="view_public.html">Иван Громский</a></strong><br /> Игры:&nbsp;30<br /> Рейтинг:&nbsp; <img
								src="img/ball.jpg" width="20" alt="" class="left" /><img src="img/ball.jpg" width="20" alt="" class="left" /><img src="img/ball.jpg" width="20" alt=""
								class="left" /> <br /> Позиция:&nbsp; Полузащитник <br /> Локация:&nbsp;Киев<br /> Виды спорта:&nbsp;Футбол,Баскетбол,Волейбол<br /> <br /> <br />
								<br /> <a href="#content">У вас в Друзьях</a>
								</p></td>
						</tr>
					</table>
				</div>
				<div class="box boxText">
					<p>
					<table class="regular">
						<tr>
							<td><a href="#content"><img src="img/aleks.jpg" width="150px" alt="" class="left" /></a><br /></td>
							<td width=300px valign=top><strong><a href="userhome.html">Александр Мединский</a></strong><br /> Игры:&nbsp;10<br /> Рейтинг:&nbsp; <img
								src="img/ball.jpg" width="20" alt="" class="left" /><img src="img/ball.jpg" width="20" alt="" class="left" /><img src="img/ball.jpg" width="20" alt=""
								class="left" /><img src="img/ball.jpg" width="20" alt="" class="left" /> <br /> Позиция:&nbsp; Защитник <br /> Локация:&nbsp;Киев<br /> Виды
								спорта:&nbsp;Футбол,Плавание,Волейбол<br /> <br /> <br /> <br /> <a href="#content">Это Вы</a>
								</p></td>
						</tr>
					</table>
				</div>
				<div class="box boxText">
					<p>
					<table class="regular">
						<tr>
							<td><a href="#content"><img src="img/image.gif" width="150px" alt="" class="left" /></a><br /></td>
							<td width=300px valign=top><strong><a href="view_public.html">Сергей Щербань</a></strong><br /> Игры:&nbsp;10<br /> Рейтинг:&nbsp; <img
								src="img/ball.jpg" width="20" alt="" class="left" /><img src="img/ball.jpg" width="20" alt="" class="left" /><img src="img/ball.jpg" width="20" alt=""
								class="left" /><img src="img/ball.jpg" width="20" alt="" class="left" /><br /> Позиция:&nbsp; Защитник <br /> Локация:&nbsp;Киев<br /> Виды
								спорта:&nbsp;Футбол<br /> <br /> <br /> <br /> <a href="#content">Добавить в Друзья</a>
								</p></td>
						</tr>
					</table>
				</div>

				<div class="box boxText">
					<p>
					<table class="regular">
						<tr>
							<td><a href="#content"><img src="img/image.gif" width="150px" alt="" class="left" /></a><br /></td>
							<td width=300px valign=top><strong><a href="view_public.html">Алексей Монятовский</a></strong><br /> Игры:&nbsp;40<br /> Рейтинг:&nbsp; <img
								src="img/ball.jpg" width="20" alt="" class="left" /><img src="img/ball.jpg" width="20" alt="" class="left" /><img src="img/ball.jpg" width="20" alt=""
								class="left" /><img src="img/ball.jpg" width="20" alt="" class="left" /><br /> Позиция:&nbsp; Нападающий <br /> Локация:&nbsp;Киев<br /> Виды
								спорта:&nbsp;Футбол<br /> <br /> <br /> <br /> <a href="#content">У вас в Друзьях</a>
								</p></td>
						</tr>
					</table>
				</div>

				<div class="box boxText">
					<p>
					<table class="regular">
						<tr>
							<td><a href="#content"><img src="img/image.gif" width="150px" alt="" class="left" /></a><br /></td>
							<td width=300px valign=top><strong><a href="view_public.html">Надежда Закревская</a></strong><br /> Игры:&nbsp;60<br /> Рейтинг:&nbsp; <img
								src="img/ball.jpg" width="20" alt="" class="left" /><img src="img/ball.jpg" width="20" alt="" class="left" /><img src="img/ball.jpg" width="20" alt=""
								class="left" /><img src="img/ball.jpg" width="20" alt="" class="left" /><br /> Позиция:&nbsp; Защитник <br /> Локация:&nbsp;Донецк<br /> Виды
								спорта:&nbsp;Футбол,Баскетбол,Волейбол<br /> <br /> <br /> <br /> <a href="#content">У вас в Друзьях</a>
								</p></td>
						</tr>
					</table>
				</div>

				<a href="#"><b>Вернуться к поиску Игроков</b></a>
			</div>
			<jsp:include page="../../templates/cabinet.jsp"/>
		</div>
		<jsp:include page="../../templates/footer.jsp"/>
	</div>
</body>
</html>