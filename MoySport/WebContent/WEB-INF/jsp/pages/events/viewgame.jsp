<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
			<div id="dataBlock">
				<div class="usr_tmplt_txt" style="width:100%; margin-bottom:10px; background-color: #F9FAF3; border:1px solid grey; border-radius: 5px;">
					<div style="padding: 5px 20px 10px 20px;"><div class="usr_tmplt_txt_l" style="width:30%"><b>Событие:</b></div><div class="usr_tmplt_txt_r"><b>${eventgame.events.name}</b></div><div class="usr_tmplt_txt_clr"></div></div>
					<div style="padding: 5px 20px 0px 20px;"><div class="usr_tmplt_txt_l" style="width:30%">Время начала:</div><div class="usr_tmplt_txt_r">${eventgame.starttime}</div><div class="usr_tmplt_txt_clr"></div></div>
					<div style="padding: 5px 20px 0px 20px;"><div class="usr_tmplt_txt_l" style="width:30%">Время окончания:</div><div class="usr_tmplt_txt_r">${eventgame.endtime}</div><div class="usr_tmplt_txt_clr"></div></div>
					<div style="padding: 5px 20px 0px 20px;"><div class="usr_tmplt_txt_l" style="width:30%">Max Кол-во участников:</div><div class="usr_tmplt_txt_r">кол-во участников</div><div class="usr_tmplt_txt_clr"></div></div>
					<div style="padding: 5px 20px 0px 20px;"><div class="usr_tmplt_txt_l" style="width:30%">Комментарии:</div><div class="usr_tmplt_txt_r">${eventgame.comments}</div><div class="usr_tmplt_txt_clr"></div></div>
					<div style="padding: 5px 20px 10px 20px;"><div class="usr_tmplt_txt_l" style="width:30%">Участники:</div><div class="usr_tmplt_txt_r" style="width:70%">
						<c:set var="userGameAction" value="acceptgame"/>
						<c:set var="userGameActionButtonText" value="Принять участие"/>
						<c:set var="gamepartyId" value=""/>
						<c:forEach items="${eventgame.gameparties}" var="gameparty">
							<c:if test="${user.iduser == gameparty.user.iduser}">
								<c:set var="userGameAction" value="declinegame"/>
								<c:set var="userGameActionButtonText" value="Отклонить участие"/>
								<c:set var="gamepartyId" value="${gameparty.idgp}"/>
							</c:if>
							<a href="${pageContext.request.contextPath}/pages/players/viewplayer/${gameparty.user.iduser}">${gameparty.user.firstname}&nbsp;${gameparty.user.lastname}</a>, 
						</c:forEach>
					</div><div class="usr_tmplt_txt_clr"></div></div>
					<div style="padding: 5px 20px 10px 20px;">
						<div style="float: left;">
							<form:form method="post" action="${pageContext.request.contextPath}/${userGameAction}">
								<input type="hidden" name="idgame" value="${eventgame.idgame}"/>
								<input type="hidden" name="idgp" value="${gamepartyId}"/>
								<input type="submit" class="submit small" value="${userGameActionButtonText}" style="cursor: pointer;"/>
							</form:form>
						</div>
						<div style="float: left; margin-left: 20px;">
							<a href="${pageContext.request.contextPath}/pages/events/editgame/${eventgame.idgame}"><b>Редактировать Игру</b></a>
						</div>
						<div style="float: left; margin-left: 20px;">
							<a href="${pageContext.request.contextPath}/pages/events/viewevent/${eventgame.events.idevent}"><b>Просмотреть событие</b></a>
						</div>
						<br style="clear: both;"/>
					</div>
				</div>
				<div style="margin-top: 10px;"><b>Комментарии:</b></div>
				<div style="margin-top: 10px;">Блок Переписки пользователей</div>
			</div>
			<jsp:include page="../../templates/cabinet.jsp"/>
		</div>
		<jsp:include page="../../templates/footer.jsp"/>
	</div>
</body>
</html>
