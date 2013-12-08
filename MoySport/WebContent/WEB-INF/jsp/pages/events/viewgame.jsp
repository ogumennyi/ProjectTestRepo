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
				<div style="margin-bottom: 10px;"><b>Игра:</b></div>
				<div class="usr_tmplt_txt" style="width:100%; margin-bottom:10px;">
					<div style="padding: 5px 20px 0px 20px;"><div class="usr_tmplt_txt_l" style="width:30%">Время начала:</div><div class="usr_tmplt_txt_r">${eventgame[0][0]}</div><div class="usr_tmplt_txt_clr"></div></div>
					<div style="padding: 5px 20px 0px 20px;"><div class="usr_tmplt_txt_l" style="width:30%">Время окончания:</div><div class="usr_tmplt_txt_r">${eventgame[0][1]}</div><div class="usr_tmplt_txt_clr"></div></div>
					<div style="padding: 5px 20px 0px 20px;"><div class="usr_tmplt_txt_l" style="width:30%">Max Кол-во участников:</div><div class="usr_tmplt_txt_r">кол-во участников</div><div class="usr_tmplt_txt_clr"></div></div>
					<div style="padding: 5px 20px 0px 20px;"><div class="usr_tmplt_txt_l" style="width:30%">Комментарии:</div><div class="usr_tmplt_txt_r">${eventgame[0][2]}</div><div class="usr_tmplt_txt_clr"></div></div>
					<div style="padding: 5px 20px 10px 20px;"><div class="usr_tmplt_txt_l" style="width:30%">Участники:</div><div class="usr_tmplt_txt_r" style="width:70%">
						<c:forEach items="${gameparties}" var="gameparty">
							<a href="${pageContext.request.contextPath}/pages/players/viewplayer/${gameparty[2]}">${gameparty[1]}&nbsp;${gameparty[0]}</a>, 
						</c:forEach>
					</div><div class="usr_tmplt_txt_clr"></div></div>
					<div style="padding: 5px 20px 10px 20px;">
						<input type="submit" class="submit small" value="Принять участие" style="cursor: pointer;"/>
						<input type="submit" class="submit small" value="Редактировать Игру" style="cursor: pointer; margin-left: 20px"/>
					</div>
					<div style="margin-top: 10px;"><b>Комментарии:</b></div>
					<div style="margin-top: 10px;">Блок Переписки пользователей</div>
				</div>
			</div>
			<jsp:include page="../../templates/cabinet.jsp"/>
		</div>
		<jsp:include page="../../templates/footer.jsp"/>
	</div>
</body>
</html>