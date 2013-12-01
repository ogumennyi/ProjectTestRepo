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
										<option selected>Мастер ( больше 50 игр)
										<option>Любитель ( 10 - 50 игр)
										<option>Новичок ( меньше 10игр )
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
							</div>
						</fieldset>
						<br>
					</form>

					<p>Пример вывода результатов поиска игроков</p>
					<p>
				</div>
				
				<div class="box boxText usr_tmplt usr_tmplt_bg">
					<table class="regular">
						<tr>
							<td class="usr_tmplt_ph">
								<a href="${pageContext.request.contextPath}/pages/players/viewplayer"><img src="${pageContext.request.contextPath}/img/oleg.jpg" alt="" class="usr_tmplt_ph_img" /></a>
							</td>
							<td class="usr_tmplt_txt">
								<div class="usr_tmplt_txt_h"><strong><a href="${pageContext.request.contextPath}/pages/players/viewplayer">Олег Гуменный</a></strong></div>
								<div><div class="usr_tmplt_txt_lt margin_5000">Рейтинг:</div><div class="usr_tmplt_txt_r"><img src="../../images/star8.png" alt="" class="usr_tmplt_txt_r_rg" /></div><div class="usr_tmplt_txt_clr"></div></div>
								<div><div class="usr_tmplt_txt_l">Игры:</div><div class="usr_tmplt_txt_r">23</div><div class="usr_tmplt_txt_clr"></div></div>
								<div class="margin_5000"><div class="usr_tmplt_txt_l">Позиция:</div> <div class="usr_tmplt_txt_r">Нападающий</div><div class="usr_tmplt_txt_clr"></div></div>
								<div class="margin_5000"><div class="usr_tmplt_txt_l">Локация:</div> <div class="usr_tmplt_txt_r">Киев</div><div class="usr_tmplt_txt_clr"></div></div>
								<div class="margin_5000"><div class="usr_tmplt_txt_l">Виды спорта:</div><div class="usr_tmplt_txt_r">Футбол, Баскетбол, Волейбол</div><div class="usr_tmplt_txt_clr"></div></div>
								<div class="usr_tmplt_txt_f"><a class="small" href=".">Добавить в Друзья</a></div>
							</td>
						</tr>
					</table>				
				</div>
				
				<div class="box boxText usr_tmplt usr_tmplt_bg">
					<table class="regular">
						<tr>
							<td class="usr_tmplt_ph">
								<a href="${pageContext.request.contextPath}/pages/players/viewplayer"><img src="${pageContext.request.contextPath}/img/ivan.jpg" alt="" class="usr_tmplt_ph_img" /></a>
							</td>
							<td class="usr_tmplt_txt">
								<div class="usr_tmplt_txt_h"><strong><a href="${pageContext.request.contextPath}/pages/players/viewplayer">Иван Громский</a></strong></div>
								<div><div class="usr_tmplt_txt_lt margin_5000">Рейтинг:</div><div class="usr_tmplt_txt_r"><img src="../../images/star4.png" alt="" class="usr_tmplt_txt_r_rg" /></div><div class="usr_tmplt_txt_clr"></div></div>
								<div><div class="usr_tmplt_txt_l">Игры:</div><div class="usr_tmplt_txt_r">30</div><div class="usr_tmplt_txt_clr"></div></div>
								<div class="margin_5000"><div class="usr_tmplt_txt_l">Позиция:</div> <div class="usr_tmplt_txt_r">Полузащитник</div><div class="usr_tmplt_txt_clr"></div></div>
								<div class="margin_5000"><div class="usr_tmplt_txt_l">Локация:</div> <div class="usr_tmplt_txt_r">Киев</div><div class="usr_tmplt_txt_clr"></div></div>
								<div class="margin_5000"><div class="usr_tmplt_txt_l">Виды спорта:</div><div class="usr_tmplt_txt_r">Футбол, Баскетбол, Волейбол</div><div class="usr_tmplt_txt_clr"></div></div>
								<div class="usr_tmplt_txt_f"><a class="small" href=".">Добавить в Друзья</a></div>
							</td>
						</tr>
					</table>				
				</div>
				
				<div class="box boxText usr_tmplt usr_tmplt_bg">
					<table class="regular">
						<tr>
							<td class="usr_tmplt_ph">
								<a href="${pageContext.request.contextPath}/pages/players/viewplayer"><img src="${pageContext.request.contextPath}/img/aleks.jpg" alt="" class="usr_tmplt_ph_img" /></a>
							</td>
							<td class="usr_tmplt_txt">
								<div class="usr_tmplt_txt_h"><strong><a href="${pageContext.request.contextPath}/pages/players/viewplayer">Александр Мединский</a></strong></div>
								<div><div class="usr_tmplt_txt_lt margin_5000">Рейтинг:</div><div class="usr_tmplt_txt_r"><img src="../../images/star4.png" alt="" class="usr_tmplt_txt_r_rg" /></div><div class="usr_tmplt_txt_clr"></div></div>
								<div><div class="usr_tmplt_txt_l">Игры:</div><div class="usr_tmplt_txt_r">10</div><div class="usr_tmplt_txt_clr"></div></div>
								<div class="margin_5000"><div class="usr_tmplt_txt_l">Позиция:</div> <div class="usr_tmplt_txt_r">Защитник</div><div class="usr_tmplt_txt_clr"></div></div>
								<div class="margin_5000"><div class="usr_tmplt_txt_l">Локация:</div> <div class="usr_tmplt_txt_r">Киев</div><div class="usr_tmplt_txt_clr"></div></div>
								<div class="margin_5000"><div class="usr_tmplt_txt_l">Виды спорта:</div><div class="usr_tmplt_txt_r">Футбол,Плавание,Волейбол</div><div class="usr_tmplt_txt_clr"></div></div>
								<div class="usr_tmplt_txt_f"><a class="small" href=".">Добавить в Друзья</a></div>
							</td>
						</tr>
					</table>				
				</div>
				
				<div class="box boxText usr_tmplt usr_tmplt_bg">
					<table class="regular">
						<tr>
							<td class="usr_tmplt_ph">
								<a href="${pageContext.request.contextPath}/pages/players/viewplayer"><img src="${pageContext.request.contextPath}/img/image.gif" alt="" class="usr_tmplt_ph_img" /></a>
							</td>
							<td class="usr_tmplt_txt">
								<div class="usr_tmplt_txt_h"><strong><a href="${pageContext.request.contextPath}/pages/players/viewplayer">Сергей Щербань</a></strong></div>
								<div><div class="usr_tmplt_txt_lt margin_5000">Рейтинг:</div><div class="usr_tmplt_txt_r"><img src="../../images/star5.png" alt="" class="usr_tmplt_txt_r_rg" /></div><div class="usr_tmplt_txt_clr"></div></div>
								<div><div class="usr_tmplt_txt_l">Игры:</div><div class="usr_tmplt_txt_r">10</div><div class="usr_tmplt_txt_clr"></div></div>
								<div class="margin_5000"><div class="usr_tmplt_txt_l">Позиция:</div> <div class="usr_tmplt_txt_r">Защитник</div><div class="usr_tmplt_txt_clr"></div></div>
								<div class="margin_5000"><div class="usr_tmplt_txt_l">Локация:</div> <div class="usr_tmplt_txt_r">Киев</div><div class="usr_tmplt_txt_clr"></div></div>
								<div class="margin_5000"><div class="usr_tmplt_txt_l">Виды спорта:</div><div class="usr_tmplt_txt_r">Футбол</div><div class="usr_tmplt_txt_clr"></div></div>
								<div class="usr_tmplt_txt_f"><a class="small" href=".">Добавить в Друзья</a></div>
							</td>
						</tr>
					</table>				
				</div>
				
				<div class="box boxText usr_tmplt usr_tmplt_bg">
					<table class="regular">
						<tr>
							<td class="usr_tmplt_ph">
								<a href="${pageContext.request.contextPath}/pages/players/viewplayer"><img src="${pageContext.request.contextPath}/img/image.gif" alt="" class="usr_tmplt_ph_img" /></a>
							</td>
							<td class="usr_tmplt_txt">
								<div class="usr_tmplt_txt_h"><strong><a href="${pageContext.request.contextPath}/pages/players/viewplayer">Алексей Монятовский</a></strong></div>
								<div><div class="usr_tmplt_txt_lt margin_5000">Рейтинг:</div><div class="usr_tmplt_txt_r"><img src="../../images/star8.png" alt="" class="usr_tmplt_txt_r_rg" /></div><div class="usr_tmplt_txt_clr"></div></div>
								<div><div class="usr_tmplt_txt_l">Игры:</div><div class="usr_tmplt_txt_r">10</div><div class="usr_tmplt_txt_clr"></div></div>
								<div class="margin_5000"><div class="usr_tmplt_txt_l">Позиция:</div> <div class="usr_tmplt_txt_r">Защитник</div><div class="usr_tmplt_txt_clr"></div></div>
								<div class="margin_5000"><div class="usr_tmplt_txt_l">Локация:</div> <div class="usr_tmplt_txt_r">Киев</div><div class="usr_tmplt_txt_clr"></div></div>
								<div class="margin_5000"><div class="usr_tmplt_txt_l">Виды спорта:</div><div class="usr_tmplt_txt_r">Футбол</div><div class="usr_tmplt_txt_clr"></div></div>
								<div class="usr_tmplt_txt_f"><a class="small" href=".">Добавить в Друзья</a></div>
							</td>
						</tr>
					</table>				
				</div>
				
				<div class="box boxText usr_tmplt usr_tmplt_bg">
					<table class="regular">
						<tr>
							<td class="usr_tmplt_ph">
								<a href="${pageContext.request.contextPath}/pages/players/viewplayer"><img src="${pageContext.request.contextPath}/img/image.gif" alt="" class="usr_tmplt_ph_img" /></a>
							</td>
							<td class="usr_tmplt_txt">
								<div class="usr_tmplt_txt_h"><strong><a href="${pageContext.request.contextPath}/pages/players/viewplayer">Надежда Закревская</a></strong></div>
								<div><div class="usr_tmplt_txt_lt margin_5000">Рейтинг:</div><div class="usr_tmplt_txt_r"><img src="../../images/star5.png" alt="" class="usr_tmplt_txt_r_rg" /></div><div class="usr_tmplt_txt_clr"></div></div>
								<div><div class="usr_tmplt_txt_l">Игры:</div><div class="usr_tmplt_txt_r">10</div><div class="usr_tmplt_txt_clr"></div></div>
								<div class="margin_5000"><div class="usr_tmplt_txt_l">Позиция:</div> <div class="usr_tmplt_txt_r">Защитник</div><div class="usr_tmplt_txt_clr"></div></div>
								<div class="margin_5000"><div class="usr_tmplt_txt_l">Локация:</div> <div class="usr_tmplt_txt_r">Киев</div><div class="usr_tmplt_txt_clr"></div></div>
								<div class="margin_5000"><div class="usr_tmplt_txt_l">Виды спорта:</div><div class="usr_tmplt_txt_r">Футбол,Баскетбол,Волейбол</div><div class="usr_tmplt_txt_clr"></div></div>
								<div class="usr_tmplt_txt_f"><a class="small" href=".">Добавить в Друзья</a></div>
							</td>
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