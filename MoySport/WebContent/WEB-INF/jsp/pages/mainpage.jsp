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
		<jsp:include page="../templates/header.jsp">
			<jsp:param name="page" value="mainpage" />
		</jsp:include>
		<div id="content">
			<div id="contentBlock">
				<div class="item last">
					<h2>Мои Игры</h2>
					<br/>
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
					<br/>

					<h2>Игры друзей</h2>
					<br/>
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
					<br/>
				</div>
				<div class="col1">
					<div class="item">
						<h3>Статья 1</h3>
						<p class="info">
							02.02.2008 - <a href=".">article tag</a> - <a href=".">14 comments</a>
						</p>
						<p>A spatial point is a concept used to define an exact location in space. It has no volume, area or length, making it a zero dimensional object.</p>
					</div>
					<div class="item last">
						<h3>Статья 2</h3>
						<p class="info">
							02.02.2008 - <a href=".">article tag</a> - <a href=".">14 comments</a>
						</p>
						<p>A spatial point is a concept used to define an exact location in space. It has no volume, area or length, making it a zero dimensional object.</p>
					</div>
				</div>
				<div class="col2 right">
					<a href="#content"><img src="${pageContext.request.contextPath}/img/basket.jpg" width="123" height="81" alt="" class="left" /></a> 
					<a href="#content"><img src="${pageContext.request.contextPath}/img/soccer.jpg" width="123" height="81" alt="" class="right" /></a> 
					<a href="#content"><img src="${pageContext.request.contextPath}/img/velo.jpg" width="123" height="81" alt="" class="left" /></a> 
					<a href="#content"><img src="${pageContext.request.contextPath}/img/volleyball.jpg" width="123" height="81" alt="" class="right" /></a>
				</div>
			</div>
			<jsp:include page="../templates/cabinet.jsp"/>
		</div>
		<jsp:include page="../templates/footer.jsp"/>
	</div>
</body>
</html>