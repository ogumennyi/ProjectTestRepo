<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Мой Спорт</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="<%=getServletContext().getContextPath()%>/css/default.css" media="screen" />
<link rel="stylesheet" type="text/css" href="<%=getServletContext().getContextPath()%>/css/print.css" media="print" />
</head>
<body>
	<div id="view">
		<div id="head">
			<div id="logo">
				<a href="<%= getServletContext().getContextPath()%>/pages/mainpage" class="block">&nbsp;</a>
				<h1>
					<a href="http://web-mastery.info/">Moy<span>Sport</span></a>
				</h1>
				<h2>
					<a href="http://web-mastery.info/">my Hobby, my Passion, my Life</a>
				</h2>
			</div>
			<hr class="hidden" />
			<div id="mainMenu">
				<ul>
					<li class="active"><a href="index.html">Главная<span></span></a></li>
					<li><a href="events.html">Cобытия<span></span></a></li>
					<li><a href="players.html">Игроки<span></span></a></li>
					<li><a href="locations.html">Локации<span></span></a></li>
					<li><a href="search.html">Поиск<span></span></a></li>
				</ul>
				<form action="search.html" method="post" id="search">
					<fieldset>
						<input type="text" name="" value="" class="button" /> <input type="submit" value="" class="submit" />
					</fieldset>
				</form>
			</div>
			<hr class="hidden" />
		</div>
		<div id="content">
			<div id="contentBlock">
				<div class="item last">
					<h2>Мои Игры</h2>
					<br>
					<table class="regular">
						<tr>
							<td><b>Название</b></td>
							<td><b>Локация</b></td>
							<td><b>Время начала игры</b></td>
							<td><b>Вид игры</b></td>
							<td><b>Участники</b></td>
						</tr>
						<tr class="add">
							<td><a href="view_event.html">Лайф vs Киевстар</a></td>
							<td>КПИ</td>
							<td>22.11.2014 18:00</td>
							<td>футбол</td>
							<td>12/14</td>
						</tr>
						<tr class="even">
							<td><a href="view_event.html">АртБизнесШкола vs Сузуки</a></td>
							<td>КИСИ</td>
							<td>30.11.2014 20:00</td>
							<td>футбол</td>
							<td>3/8</td>
						</tr>
					</table>
					<br>

					<h2>Игры друзей</h2>
					<br>
					<table class="regular">
						<tr>
							<td><b>Название</b></td>
							<td><b>Игрок</b></td>
							<td><b>Локация</b></td>
							<td><b>Время начала игры</b></td>
							<td><b>Вид игры</b></td>
							<td><b>Участники</b></td>
						</tr>
						<tr class="add">
							<td><a href="view_event.html">Футбол в Зале КПИ</a></td>
							<td><a href="view_public.html">Иван Громский</a></td>
							<td>КПИ</td>
							<td>22.11.2014 18:00</td>
							<td>футбол</td>
							<td>4/10</td>
						</tr>
						<tr class="even">
							<td><a href="view_event.html">Футбол в Зале КИСИ</a></td>
							<td><a href="view_public.html">Олег Гуменной</a></td>
							<td>КИСИ</td>
							<td>30.11.2014 20:00</td>
							<td>футбол</td>
							<td>1/10</td>
						</tr>
					</table>
					<br>
				</div>
				<div class="col1">
					<div class="item">
						<h3>Статья 1</h3>
						<p class="info">
							02.02.2008 - <a href="http://web-mastery.info/">article tag</a> - <a href="http://web-mastery.info/">14 comments</a>
						</p>
						<p>A spatial point is a concept used to define an exact location in space. It has no volume, area or length, making it a zero dimensional object.</p>
					</div>
					<div class="item last">
						<h3>Статья 2</h3>
						<p class="info">
							02.02.2008 - <a href="http://web-mastery.info/">article tag</a> - <a href="http://web-mastery.info/">14 comments</a>
						</p>
						<p>A spatial point is a concept used to define an exact location in space. It has no volume, area or length, making it a zero dimensional object.</p>
					</div>
				</div>
				<div class="col2 right">
					<a href="#content"><img src="<%= getServletContext().getContextPath()%>/img/basket.jpg" width="123" height="81" alt="" class="left" /></a> 
					<a href="#content"><img src="<%= getServletContext().getContextPath()%>/img/soccer.jpg" width="123" height="81" alt="" class="right" /></a> 
					<a href="#content"><img src="<%= getServletContext().getContextPath()%>/img/velo.jpg" width="123" height="81" alt="" class="left" /></a> 
					<a href="#content"><img src="<%= getServletContext().getContextPath()%>/img/volleyball.jpg" width="123" height="81" alt="" class="right" /></a>
				</div>
			</div>
			<hr class="hidden" />
			<div id="menuBlock">
				<div class="box firstBox subMenu">
					<h3>Мой кабинет:</h3>
					<ul>
						<li><a href="userhome.html">Мой профайл</a></li>
						<li><a href="userevents.html">Мои события</a></li>
						<li><a href="userfriends.html">Мои друзья</a></li>
						<li><a href="usertrainings.html">Мои тренировки</a></li>
						<li><a href="usersettings.html">Мои настройки</a></li>
						<li><a href="help.html">Помощь</a></li>
						<li><a href="<%=getServletContext().getContextPath()%>/j_spring_security_logout">Выйти</a></li>
					</ul>
				</div>
				<div class="box boxText">
					<h3>Профайл:</h3>
					<p>
						<strong>Александр Мединский</strong>
					<div>Игры:&nbsp;15</div>
					<div style="display: table-cell; vertical-align: bottom">
						Рейтинг: <img src="<%=getServletContext().getContextPath()%>/images/star7.png" alt="" class="left" style="border: 0" align="middle" />
					</div>
					<div style="margin-top: 5px">Локация:&nbsp;Гостомель</div>
				</div>
				<div class="box subMenu">
					<h3>Archive:</h3>
					<ul>
						<li><a href="http://web-mastery.info/">January 2008</a></li>
						<li><a href="http://web-mastery.info/">February 2008</a></li>
						<li><a href="http://web-mastery.info/">March 2008</a></li>
						<li><a href="http://web-mastery.info/">April 2008</a></li>
						<li><a href="http://web-mastery.info/">May 2008</a></li>
					</ul>
				</div>
			</div>
		</div>
		<hr class="hidden" />
		<ul class="hidden">
			<li><a href="#view">Nahoru</a></li>
			<li><a href="#content">Zpět na obsah</a></li>
		</ul>
		<hr class="hidden" />
		<div id="foot">
			<p class="fl">&copy; all rights reserved</p>
			<p class="fr">
				<a target="_blank" rel="nofollow" href="http://www.breezy.cz/reference/webove-sablony-zdarma">Free template</a> created by <a target="_blank" rel="nofollow"
					href="http://www.breezy.cz" class="ico ico-breezy">Breezy New Media</a>
			</p>
		</div>
	</div>
</body>
</html>