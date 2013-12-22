<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
			<div id="dataBlock">
				<div class="usr_tmplt_txt" style="width:100%; background-color: #F9FAF3; border:1px solid grey; border-radius: 5px;">
					<div class="usr_tmplt_txt_h" style="padding: 10px 20px 10px 20px;"><div class="usr_tmplt_txt_l"><b>Событие:</b></div><div class="usr_tmplt_txt_r"><b>${event.name}</b></div><div class="usr_tmplt_txt_clr"></div></div>
					<div style="padding: 5px 20px 0px 20px;"><div class="usr_tmplt_txt_l">Организатор:</div><div class="usr_tmplt_txt_r">${event.createdby.firstname}&nbsp;${event.createdby.lastname}</div><div class="usr_tmplt_txt_clr"></div></div>
					<div style="padding: 5px 20px 0px 20px;"><div class="usr_tmplt_txt_l">Локация:</div><div class="usr_tmplt_txt_r">${event.locations.name}</div><div class="usr_tmplt_txt_clr"></div></div>
					<div style="padding: 10px 20px;">
						<a href="${pageContext.request.contextPath}/pages/events/editevent/${event.idevent}"><b>Редактировать событие</b></a>
					</div>
				</div>
				<div style="margin-top: 10px;"><b>Игры:</b></div>
				<c:forEach items="${event.eventgames}" var="eventgame">
					<hr/>
					<div class="usr_tmplt_txt" style="width:100%; margin-bottom:10px;">
						<div style="padding: 5px 20px 0px 20px;"><div class="usr_tmplt_txt_l" style="width:30%">Время начала:</div><div class="usr_tmplt_txt_r">${eventgame.starttime}</div><div class="usr_tmplt_txt_clr"></div></div>
						<div style="padding: 5px 20px 0px 20px;"><div class="usr_tmplt_txt_l" style="width:30%">Время окончания:</div><div class="usr_tmplt_txt_r">${eventgame.endtime}</div><div class="usr_tmplt_txt_clr"></div></div>
						<div style="padding: 5px 20px 0px 20px;"><div class="usr_tmplt_txt_l" style="width:30%">Max Кол-во участников:</div><div class="usr_tmplt_txt_r">кол-во участников</div><div class="usr_tmplt_txt_clr"></div></div>
						<div style="padding: 5px 20px 0px 20px;"><div class="usr_tmplt_txt_l" style="width:30%">Комментарии:</div><div class="usr_tmplt_txt_r">${eventgame.comments}</div><div class="usr_tmplt_txt_clr"></div></div>
						<div style="padding: 5px 20px 10px 20px;"><div class="usr_tmplt_txt_l" style="width:30%">Участники:</div><div class="usr_tmplt_txt_r" style="width:70%">
							<c:forEach items="${eventgame.gameparties}" var="gameparty">
								<a href="${pageContext.request.contextPath}/pages/players/viewplayer/${eventgame.idgame}">${gameparty.user.firstname}&nbsp;${gameparty.user.lastname}</a>, 
							</c:forEach>
						</div><div class="usr_tmplt_txt_clr"></div></div>
						<div style="padding: 0px 20px;">
							<a href="${pageContext.request.contextPath}/pages/events/viewgame/${eventgame.idgame}"><b>Просмотреть игру</b></a>
						</div>
					</div>
				</c:forEach>
			</div>
			<jsp:include page="../../templates/cabinet.jsp"/>
		</div>
		<jsp:include page="../../templates/footer.jsp"/>
	</div>
</body>
</html>
