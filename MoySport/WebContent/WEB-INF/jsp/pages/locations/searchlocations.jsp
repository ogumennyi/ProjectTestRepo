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
					<table class="regular">
						<tr>
							<td><b>Локация</b></td>
							<td><b>Город</b></td>
							<td><b>Адрес</b></td>
							<td><b>Контактный телефон</b></td>
							<td><b>Интернет страница</b></td>
							<td><b>Кол-во мероприятий</b></td>
						</tr>
						<c:forEach items="${locationsList}" var="location">
							<tr class="add">
								<td><a href="${pageContext.request.contextPath}/pages/locations/viewlocation/${location.idlocation}">${location.name}</a></td>
								<td>${location.city}</td>
								<td>${location.district}, ${location.street}, ${location.building}</td>
								<td>${location.contacts}</td>
								<td><a href="${location.httplink}">${location.httplink}</a></td>
								<td>${location.checkin}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<jsp:include page="../../templates/cabinet.jsp"/>
			</div>
			<jsp:include page="../../templates/footer.jsp"/>
		</div>
	</body>
</html>