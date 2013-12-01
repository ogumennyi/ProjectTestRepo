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
			<jsp:param name="page" value="search" />
		</jsp:include>
		<div id="content">
			<div id="contentBlock">
				<div class="item last">
					<h2>Поиск (UNDER CONSTRUCTION)</h2>
					<br>
					<div class="box boxText">
						<p>
						<form action="#" method="post">
							<fieldset>
								<legend>
									<b>Поиск Игрока:</b>
								</legend>
								<br> <input type="text" value="" class="inputText">&nbsp;&nbsp;Имя Игрока<br>
								<br> <input type="text" value="" class="inputText">&nbsp;&nbsp;Количество проведенных игр (>=)<br>
								<br>
								<p>
									<input type="submit" class="submit" value="Найти">
								</p>
							</fieldset>
							<br />
						</form>
					</div>

					<div class="box boxText">
						</p>
						<form action="#" method="post">
							<fieldset>
								<legend>
									<b>Поиск События:</b>
								</legend>
								<br> <input type="text" value="" class="inputText">&nbsp;&nbsp;Дата события<br>
								<br> <input type="text" value="" class="inputText">&nbsp;&nbsp;Количество проведенных игр (>=)<br>
								<br>
								<p>
									<input type="submit" class="submit" value="Найти">
								</p>
							</fieldset>
							<br />
						</form>
					</div>

					<div class="box boxText">
						<p>
						<form action="#" method="post">
							<fieldset>
								<legend>
									<b>Поиск Локации:</b>
								</legend>
								<br> <input type="text" value="" class="inputText">&nbsp;&nbsp;Имя Локации<br>
								<br> <input type="text" value="" class="inputText">&nbsp;&nbsp;Город<br>
								<br>

								<p>
									<input type="submit" class="submit" value="Найти">
								</p>
							</fieldset>
							<br />
						</form>
					</div>
				</div>
			</div>
			<jsp:include page="../templates/cabinet.jsp"/>
		</div>
		<jsp:include page="../templates/footer.jsp"/>
	</div>
</body>
</html>