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
			<jsp:param name="page" value="searchevents" />
		</jsp:include>
		<div id="content">
			<div id="contentBlock">
				<h2>Поиск игры</h2>
				<br/>
				<form method="post" action="${pageContext.request.contextPath}/events/search">
					<div>
						<div>
							<div style="float: left; margin-right: 25px">
								<div>Вид Спорта</div>
								<select name="sport" class="inputText">
									<option selected="selected" value="">Все виды</option>
									<option value="1">Футбол</option>
									<option value="2">Баскетбол</option>
									<option value="3">Хоккей</option>
									<option value="4">Плавание</option>
								</select>
							</div>
							<div style="float: left; margin-right: 25px">
								<div>Локация</div>
								<input type="text" value="" class="inputText"/>
							</div>
							<div style="float: left; margin-right: 25px">
								<div>Ключевое слово (Напр. Название игры )</div>
								<input type="text" value="" class="inputText"/>
							</div>
						</div>
	
						<br style="clear: both;"/>
						<br style="clear: both;"/>
						<div>
							<div style="float: left; margin-right: 25px">
								<div>Город</div>
								<input type="text" value="" class="inputText"/>
							</div>
							<div style="float: left;">
								<div>Улица</div>
								<input type="text" value="" class="inputText"/>
							</div>
						</div>
	
						<br style="clear: both;"/> 
						<br style="clear: both;"/>
	
						<div>
							<div style="float: left;">
								<div>Дата (день/месяц/год)</div>
								<input type="text" value="" class="inputText"/>
							</div>
						</div>
	
						<br style="clear: both;"/> 
						<br style="clear: both;"/>
						<p>
							<input type="submit" class="submit" value="Найти" style="cursor: pointer;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/pages/events/createevent"><b>Создать новую игру</b></a>
						</p>
					</div>
				</form>

				<table class="regular">
					<c:if  test="${!empty eventsList}">
						<table class="data">
							<tr>
								<th>Название</th>
								<th>Локация</th>
								<th>Вид игры</th>
							</tr>
							<c:forEach items="${eventsList}" var="event">
								<tr>
									<td>${event[0]}</td>
									<td>${event[1]}</td>
									<td>${event[2]}</td>
								</tr>
							</c:forEach>
						</table>
					</c:if>				
				</table>
				<a href="#"><b>Вернуться к поиску Игр</b></a>
			</div>
			<jsp:include page="../../templates/cabinet.jsp"/>
		</div>
		<jsp:include page="../../templates/footer.jsp"/>
	</div>
</body>
</html>
