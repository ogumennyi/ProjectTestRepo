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
								<div>
									<select name="idsport" class="inputText" style="margin: 0px;">
										<option <c:if test="${idsport == ''}">selected="selected"</c:if> value="">Все виды</option>
										<c:forEach items="${sportList}" var="sport">
											<option <c:if test="${sport.idsport == idsport}">selected="selected"</c:if> value="${sport.idsport}">${sport.name}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div style="float: left; margin-right: 25px">
								<div>Ключевое слово</div>
								<input name="keyword" type="text" value="${keyword}" class="inputText searchfield" style="width: 200px;"/>
							</div>
						</div>
						<br style="clear: both;"/>
						<div style="padding-top:5px">
							<div style="float: left; margin-right: 25px">
								<div>Локация</div>
								<input name="location" type="text" value="${location}" class="inputText searchfield"/>
							</div>
							<div style="float: left;">
								<div>Дата</div>
								<input name="ev_date" type="text" value="" class="inputText searchfield"/>
							</div>
						</div>	
						<br style="clear: both;"/>
						<div style="padding-top:5px">
							<div style="float: left; margin-right: 25px">
								<div>Город</div>
								<input type="text" value="" class="inputText searchfield"/>
							</div>
							<div style="float: left;">
								<div>Улица</div>
								<input type="text" value="" class="inputText searchfield"/>
							</div>
						</div>
						<br style="clear: both;"/>
						<p style="padding-top:20px">
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
								<th>Ссылка</th>
							</tr>
							<c:forEach items="${eventsList}" var="event">
								<tr>
									<td>${event[0]}</td>
									<td>${event[1]}</td>
									<td>${event[2]}</td>
									<td><a href="${pageContext.request.contextPath}/pages/events/viewevent/${event[3]}">Перейти</a></td>
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
