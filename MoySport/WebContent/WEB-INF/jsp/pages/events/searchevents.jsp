<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Мой Спорт</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default.css" media="screen" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/print.css" media="print" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/button.css" media="screen" />
</head>
<body>
	<div id="view">
		<jsp:include page="../../templates/header.jsp">
			<jsp:param name="page" value="searchevents" />
		</jsp:include>
		<div id="content">
			<div id="contentBlock">
				<div style="background-image: -webkit-linear-gradient(top, #E8C6BA 0%, #BD8E73 50%, #E8C6BA 100%); text-align: center; border-radius: 5px;">
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
						<div style="padding: 15px 0px">
							<input type="submit" class="srchBtn" value="Найти" style="cursor: pointer;"/>
						</div>
					</form>
				</div>
				<div>
					<div style="float: right; margin: 5px 0px 0px 20px;">
						<a href="${pageContext.request.contextPath}/pages/events/createevent"><b>Новое событие</b></a>
					</div>
					<div style="float: right; margin: 5px 0px 0px 20px;">
						<a href="${pageContext.request.contextPath}/pages/events/creategame"><b>Новая игра</b></a>
					</div>
					<br style="clear: both;"/>
				</div>
				
				<div><h6>Результаты поиска:</h6></div>
				<fmt:setLocale value="de_DE"/>
				<div>
					<c:forEach items="${eventsList}" var="event">
					<hr/>
					<div style="margin-top: 5px; background-color: #F9FAF3; border-top-right-radius: 5px; border-bottom-right-radius: 5px;">
						<div style="background-color: #EEEFE3; width: 30%; float: left; border-top-left-radius: 5px; border-bottom-left-radius: 5px;">
							<div style="padding: 5px 10px 0px 10px; height: 16px;">
								<a href="${pageContext.request.contextPath}/pages/events/viewevent/${event.idevent}"><b>${event.name}</b></a>
							</div>
							<div style="padding: 5px 10px 0px 10px; height: 16px; ">${event.sport.name}</div>					
							<div style="padding: 5px 10px 5px 10px; height: 16px;">${event.locations.name}</div>
						</div>
						<div style="padding: 0px 0px; background-color: #F9FAF3; width: 70%; height: 100%; position: relative; float: left; border-top-right-radius: 5px; border-bottom-right-radius: 5px;">
							<c:forEach items="${event.eventgames}" var="eventgame">
							<div style="padding: 5px 10px; cursor: pointer;" class="withHover" onclick="location.href='${pageContext.request.contextPath}/pages/events/viewgame/${eventgame.idgame}'">
								<div style="float: left; width: 150px;"><fmt:formatDate type="date" value="${eventgame.starttime}"/> <small><b><fmt:formatDate pattern="hh:mm" value="${eventgame.starttime}"/></b></small></div>
								<div style="float: left; width: 170px;"><fmt:formatDate type="date" value="${eventgame.endtime}"/> <small><b><fmt:formatDate pattern="hh:mm" value="${eventgame.endtime}"/></b></small></div>
								<div style="float: left; width: 30px; height: 16px;">${eventgame.gamePartiesCount}</div>
								<br style="clear: both;"/>
							</div>
							</c:forEach>
						</div>
						<br style="clear: both;"/>
					</div>
					</c:forEach>
					<!-- <c:forEach items="${eventsList}" var="event">
						<div style="padding: 5px 0px; margin: 10px 0px 0px 0px; background-color: #EEEFE3; border-top:1px solid grey;">
							<div style="float: left; width: 120px; padding-left: 10px; height: 16px; ">${event.sport.name}</div>					
							<div style="float: left; width: 120px; height: 16px;">${event.locations.name}</div>
							<div style="float: left; width: 260px; height: 16px;">${event.name}</div>
							<div style="float: left;">
								<a style="text-decoration: none;" href="${pageContext.request.contextPath}/pages/events/viewevent/${event.idevent}">
								<img src="${pageContext.request.contextPath}/images/arrow_right_16.png" alt="" class="left" style="border: 0; padding: 0px; margin: 0px;" align="top" /></a>
							</div>
							<br style="clear: both;"/>
						</div>
						<div style="padding: 15px 0px; background-color: #F9FAF3;">
						<c:forEach items="${event.eventgames}" var="eventgame">
							<div>
								<div style="float: left; width: 70px;">&nbsp;</div>
								<div style="float: left; width: 140px;"><fmt:formatDate pattern="dd-mm-yyyy hh:mm" value="${eventgame.starttime}"/></div>
								<div style="float: left; width: 160px;"><fmt:formatDate pattern="dd-mm-yyyy hh:mm" value="${eventgame.endtime}"/></div>
								<div style="float: left; width: 60px; height: 16px;">${eventgame.gamePartiesCount}</div>
								<div style="float: left;">
									<a style="text-decoration: none" href="${pageContext.request.contextPath}/pages/events/viewgame/${eventgame.idgame}">
									<img src="${pageContext.request.contextPath}/images/arrow_right_16.png" alt="" class="left" style="border: 0; padding: 0px; margin: 0px; width: 12px" align="top" /></a>
								</div>
								<br style="clear: both;"/>
							</div>
						</c:forEach>
						</div>
					</c:forEach>-->
					<c:if test="${empty eventsList}">
						<div style="width: 100%; text-align: center; margin-top:20px;">События не найдены</div>
					</c:if>
				</div>
			</div>
			<jsp:include page="../../templates/cabinet.jsp"/>
		</div>
		<jsp:include page="../../templates/footer.jsp"/>
	</div>
</body>
</html>
