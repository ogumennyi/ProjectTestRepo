<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<div id="dataBlock">
				<form:form action="${pageContext.request.contextPath}/pages/events/editevent" method="post" modelAttribute="event">
					<div class="usr_tmplt_txt" style="width:100%; background-color: #EEEFE3; border:1px solid grey; border-radius: 5px;">
						<form:input path="idevent" type="hidden" value="${event.idevent}" />
						<div class="usr_tmplt_txt_h" style="padding: 15px 20px 0px 20px;">
							<div class="usr_tmplt_txt_l"><b>Событие:</b></div>
							<div class="usr_tmplt_txt_r"><form:input type="text" path="name" class="inputText" style="border-color: #A4A4A4; height: 13px; padding:3px 5px 4px 5px;" /></div>
							<div class="usr_tmplt_txt_clr"></div>
						</div>
						<div style="padding: 10px 20px 0px 20px;"><div class="usr_tmplt_txt_l">Организатор:</div><div class="usr_tmplt_txt_r">${event.createdby.firstname} ${event.createdby.lastname}</div><div class="usr_tmplt_txt_clr"></div></div>
						<div style="padding: 10px 20px 0px 20px;">
							<div class="usr_tmplt_txt_l">Локация:</div>
							<div class="usr_tmplt_txt_r">
								<select  name="idlocation" class="inputText" style="margin: 0px;">
									<c:forEach items="${locationList}" var="location">
										<option	<c:if test="${location.idlocation == idlocation}">selected="selected"</c:if> value="${location.idlocation}">${location.name}</option>
									</c:forEach>
								</select>
							</div><div class="usr_tmplt_txt_clr"></div>
						</div>		
						<div style="padding: 10px 20px 15px 20px;">
							<div class="usr_tmplt_txt_l">Спорт:</div>
							<div class="usr_tmplt_txt_r">
								<select  name=idsport class="inputText" style="margin: 0px;">
									<c:forEach items="${sportList}" var="sport">
										<option <c:if test="${sport.idsport == idsport}">selected="selected"</c:if> value="${sport.idsport}">${sport.name}</option>
									</c:forEach>
								</select>
							</div><div class="usr_tmplt_txt_clr"></div>
						</div>							
					</div>
					<div style="width: 100%;"><div style="float: right;"><input type="submit" class="srchBtn" value="Сохранить" style="cursor: pointer; width: 100px; margin-top: 10px"/></div><br style="clear: both;"/></div>
					<div><b>Игры:</b></div>
					<c:forEach items="${eventgames}" var="eventgame">
						<hr/>
						<div class="usr_tmplt_txt" style="width:100%; margin-bottom:10px;">
							<div style="padding: 5px 20px 0px 20px;"><div class="usr_tmplt_txt_l" style="width:30%">Время начала:</div><div class="usr_tmplt_txt_r">${eventgame.starttime}</div><div class="usr_tmplt_txt_clr"></div></div>
							<div style="padding: 5px 20px 0px 20px;"><div class="usr_tmplt_txt_l" style="width:30%">Время окончания:</div><div class="usr_tmplt_txt_r">${eventgame.endtime}</div><div class="usr_tmplt_txt_clr"></div></div>
							<%--
							<div style="padding: 5px 20px 0px 20px;"><div class="usr_tmplt_txt_l" style="width:30%">Max Кол-во участников:</div><div class="usr_tmplt_txt_r">кол-во участников</div><div class="usr_tmplt_txt_clr"></div></div> 	
							<div style="padding: 5px 20px 0px 20px;"><div class="usr_tmplt_txt_l" style="width:30%">Комментарии:</div><div class="usr_tmplt_txt_r">${eventgame.comments}</div><div class="usr_tmplt_txt_clr"></div></div>
							<div style="padding: 5px 20px 10px 20px;"><div class="usr_tmplt_txt_l" style="width:30%">Участники:</div><div class="usr_tmplt_txt_r" style="width:70%">
								<c:forEach items="${gameparties}" var="gameparty">
									<a href="${pageContext.request.contextPath}/pages/players/viewplayer/${gameparty[2]}">${gameparty[0]}&nbsp;${gameparty[1]}</a>, 
								</c:forEach>
							</div><div class="usr_tmplt_txt_clr"></div></div>
	 						<div style="padding: 5px 20px 5px 20px;">
	 							<input type="submit" class="submit small" value="Принять участие" style="cursor: pointer;"/>
							--%>
							<div style="padding: 10px 0px 0px 0px;"> 
								<a style="margin-left: 20px" href="${pageContext.request.contextPath}/pages/events/viewgame/${eventgame.idgame}"><b>Просмотреть игру</b></a>
							</div>
						</div>
					</c:forEach>
				</form:form>
			</div>
			<jsp:include page="../../templates/cabinet.jsp"/>
		</div>
		<jsp:include page="../../templates/footer.jsp"/>
	</div>
</body>
</html>