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
		<jsp:include page="../../templates/header.jsp"/>
		<div id="content">
			<div id="contentBlock">
				<div class="item last">
					<h2>Мои cобытия</h2>
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
				</div>
			</div>
			<jsp:include page="../../templates/cabinet.jsp">
				<jsp:param name="page" value="events" />
			</jsp:include>
		</div>
		<jsp:include page="../../templates/footer.jsp"/>
	</div>
</body>
</html>