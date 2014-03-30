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
				<jsp:param name="page" value="searchlocations" />
			</jsp:include>
			<div id="content">
				<div id="contentBlock">
					<h2>Поиск локации</h2>
					<div style="background-image: -webkit-linear-gradient(top, #E8C6BA 0%, #BD8E73 50%, #E8C6BA 100%); text-align: center; border-radius: 5px;">
						<br/>
						<form method="post" action="${pageContext.request.contextPath}/locations/search">
							<div>
								<div style="text-align: center; width: 100%">
									<%-- <div style="float: left; margin: 0px 25px 0px 40px">
										<div>
											<select name="idsport" class="inputText searchselect" style="margin: 0px;">
												<option <c:if test="${idsport == ''}">selected="selected"</c:if> value="">Все виды спорта</option>
												<c:forEach items="${sportList}" var="sport">
													<option <c:if test="${sport.idsport == idsport}">selected="selected"</c:if> value="${sport.idsport}">${sport.name}</option>
												</c:forEach>
											</select>
										</div>
									</div> --%>
									<div style="float: left; margin: 0px 25px 0px 40px">
										<input name="keyword" type="text" value="${keyword}" class="inputText searchinput" style="width: 200px;" placeholder="Ключевая фраза"/>
									</div>
									<div style="float: left;">
										<input name="sp_city" type="text" value="${sp_city}" class="inputText searchinput" placeholder="Город"/>
									</div>
								</div>
								<br style="clear: both;"/>
								<div style="padding-top:5px">
									<div style="float: left; margin: 0px 25px 0px 40px">
										<input name="sp_district" type="text" value="${sp_district}" class="inputText searchinput" placeholder="Район"/>
									</div>
									<div style="float: left;">
										<input name="sp_street" type="text" value="${sp_street}" class="inputText searchinput" placeholder="Улица"/>
									</div>
								</div>	
								<br style="clear: both;"/>
								<div style="padding-top:5px">
									<div style="float: left; margin: 0px 25px 0px 40px">
										<input name="sp_building" type="text" value="${sp_building}" class="inputText searchinput" placeholder="Дом"/>
									</div>
									<div style="float: left;">
										<input name="sp_contacts" type="text" value="${sp_contacts}" class="inputText searchinput" placeholder="Контакты"/>
									</div>
								</div>
								<br style="clear: both;"/>
								<div style="padding-top:5px">
									<div style="float: left; margin: 0px 25px 0px 40px">
										<input name="sp_httplink" type="text" value="${sp_httplink}" class="inputText searchinput" placeholder="Web-Site"/>
									</div>
									<div style="float: left;">
										<input name="sp_description" type="text" value="${sp_description}" class="inputText searchinput" placeholder="Описание объекта"/>
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
							<a href="${pageContext.request.contextPath}/pages/locations/createlocation"><b>Создать новую локацию</b></a>
						</div>
						<br style="clear: both;"/>
					</div>
				
					<div><h6>Результаты поиска:</h6></div>
					<fmt:setLocale value="de_DE"/>
					<div>
						<c:forEach items="${locationsList}" var="location">
							<hr/>
							<div style="margin-top: 5px; background-color: #F9FAF3; border-top-right-radius: 5px; border-bottom-right-radius: 5px;">
								<div style="background-color: #EEEFE3; width: 30%; float: left; border-top-left-radius: 5px; border-bottom-left-radius: 5px;">
									<%-- <div style="padding: 5px 10px 0px 10px; height: 16px;">
										<a href="${pageContext.request.contextPath}/pages/locations/viewlocation/1"><b>КПИ</b></a>
									</div> --%>
									<div style="padding: 5px 10px 5px 10px; height: 15px;"></div>
									<div style="padding: 5px 10px 0px 10px; height: 110px; ">
										<a href="${pageContext.request.contextPath}/pages/locations/viewlocation/${location.idlocation}">
											<img src="${pageContext.request.contextPath}/img/football.png" class="usr_tmplt_ph_img" />
										</a>
									</div>	
									<div style="padding: 5px 10px 5px 10px; height: 15px;"></div>				
									<!-- <div style="padding: 5px 10px 5px 10px; height: 16px;">yyyy</div> -->
								</div>
								<div style="padding: 0px 0px; background-color: #F9FAF3; width: 70%; height: 100%; position: relative; float: left; border-top-right-radius: 5px; border-bottom-right-radius: 5px;">
									<div style="float: left; margin: 5px 15px 5px 30px">
										<div style="float: left; width: 100px;"><a href="${pageContext.request.contextPath}/pages/locations/viewlocation/${location.idlocation}"><B>${location.name}</B></a></div>
									</div>
									<div style="float: left; margin: 5px 15px 5px 30px">
										<div style="float: left; width: 100px;"><B>Адрес</B></div>
										<div style="float: left; width: 200px;">${location.country}, г.${location.city}, ${location.street}, ${location.building}.</div>
									</div>
									<div style="float: left; margin: 5px 15px 5px 30px">
										<div style="float: left; width: 100px;"><B>Контакты</B></div>
										<div style="float: left; width: 200px;">${location.contacts}</div>
									</div>
									<div style="float: left; margin: 5px 15px 5px 30px">
										<div style="float: left; width: 100px;"><B>Web-Site</B></div>
										<div style="float: left; width: 200px;"><a href="${location.httplink}">${location.httplink}</a></div>
									</div>
									<div style="float: left; margin: 5px 15px 5px 30px">
										<div style="float: left; width: 100px;"><B>Виды спорта</B></div>
										<div style="float: left; width: 200px;">
											<c:forEach items="${location.sports}" var="sport" varStatus="elementStatus">
												<a >${sport.name}<c:if test="${elementStatus.last ne true}">, </c:if></a>
											</c:forEach>
										</div>
									</div>
									<div style="float: left; margin: 5px 15px 5px 30px">
										<div style="float: left; width: 100px;"><B>Мероприятия</B></div>
										<div style="float: left; width: 200px;">${location.checkin}</div>
									</div>
									<%-- <div style="padding: 5px 10px; cursor: pointer;" class="withHover" onclick="location.href='${pageContext.request.contextPath}/pages/events/viewgame/3'">
										<div style="float: left; width: 150px;">12.12.2014</div>
										<div style="float: left; width: 170px;">12.12.2014</div>
										<div style="float: left; width: 30px; height: 16px;">12</div>
										<br style="clear: both;"/>
									</div> --%>
								</div>
								<br style="clear: both;"/>
							</div>
						</c:forEach>
						<c:if test="${empty locationsList}">
							<hr/>
							<div style="width: 100%; text-align: center; margin-top:20px;">Локации не найдены</div>
						</c:if>
					</div>
				</div>
				<jsp:include page="../../templates/cabinet.jsp"/>
			</div>
			<jsp:include page="../../templates/footer.jsp"/>
		</div>
	</body>
</html>