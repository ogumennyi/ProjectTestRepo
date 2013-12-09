<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
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
				<div style="background-image: linear-gradient(rgb(212, 108, 108) 0%, rgb(227, 202, 202) 100%); text-align: center; border-radius: 15px;">
					<div style="padding-top: 10px"><h2>Поиск событий</h2></div>
					<br/>
					<form method="post" action="${pageContext.request.contextPath}/events/search">
						<div>
							<div style="text-align: center; width: 100%">
								<div style="float: left; margin: 0px 25px 0px 40px">
									<div>
										<select name="idsport" class="inputText searchselect" style="margin: 0px;">
											<option <c:if test="${idsport == ''}">selected="selected"</c:if> value="">Все виды спорта</option>
											<c:forEach items="${sportList}" var="sport">
												<option <c:if test="${sport.idsport == idsport}">selected="selected"</c:if> value="${sport.idsport}">${sport.name}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div style="float: left;">
									<input name="keyword" type="text" value="${keyword}" class="inputText searchinput" style="width: 200px;" placeholder="Ключевая фраза"/>
								</div>
							</div>
							<br style="clear: both;"/>
							<div style="padding-top:5px">
								<div style="float: left; margin: 0px 25px 0px 40px">
									<input name="ev_date" type="text" value="" class="inputText searchinput" placeholder="Дата"/>
								</div>
								<div style="float: left;">
									<input name="location" type="text" value="${location}" class="inputText searchinput" placeholder="Локация"/>
								</div>
							</div>	
							<br style="clear: both;"/>
							<div style="padding-top:5px">
								<div style="float: left; margin: 0px 25px 0px 40px">
									<input type="text" value="" class="inputText searchinput" placeholder="Город"/>
								</div>
								<div style="float: left;">
									<input type="text" value="" class="inputText searchinput" placeholder="Улица"/>
								</div>
							</div>
							<br style="clear: both;"/>
						</div>
						<div style="padding: 15px 0px 15px 0px">
							<input type="submit" class="submit" value="Найти" style="cursor: pointer;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/pages/events/createevent"><b>Создать новое событие</b></a>
						</div>
					</form>
				</div>
				
				<div style="padding-top: 20px"><h6>Результаты поиска:</h6></div>
				
				<div>
					<c:forEach items="${eventsList}" var="event">
						<c:if test="${ idevent != event[3] }">
							<hr style="margin-top:10px"/>
							<div style="padding-bottom:10px">
								<div style="float: left; width: 100px;">${event[2]}</div>					
								<div style="float: left; width: 130px;">${event[1]}</div>
								<div style="float: left; width: 200px;">${event[0]}</div>
								<div style="float: left; width: 80px;">1/10</div>
								<div style="float: left;"><h2><a style="text-decoration: none" href="${pageContext.request.contextPath}/pages/events/viewevent/${event[3]}">&#10162;</a></h2></div>
								<br style="clear: both;"/>
							</div>
						</c:if>
						<div>
							<div style="float: left; width: 70px;">&nbsp;</div>
							<div style="float: left; width: 180px;">${event[4]}</div>
							<div style="float: left; width: 180px;">${event[5]}</div>
							<div style="float: left; width: 80px;">${event[6]}</div>
							<div style="float: left;"><h4><a style="text-decoration: none" href="${pageContext.request.contextPath}/pages/events/viewgame/${event[6]}">&#10140;</a></h4></div>
							<br style="clear: both;"/>
						</div>
						<c:set var="idevent" scope="request" value="${event[3]}"/>
					</c:forEach>
				</div>
			</div>
			<jsp:include page="../../templates/cabinet.jsp"/>
		</div>
		<jsp:include page="../../templates/footer.jsp"/>
	</div>
</body>
</html>
