<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
				<form:form action="${pageContext.request.contextPath}/pages/events/editgame" method="post" modelAttribute="eventgame">
					<div style="background-color: #EEEFE3; border:1px solid grey; border-radius: 5px;">
						<div class="usr_tmplt_txt" style="width:100%; margin-bottom:10px;">
							<div class="usr_tmplt_txt_h" style="padding: 10px 20px 10px 20px;"><div class="usr_tmplt_txt_l" style="width:30%"><b>Событие:</b></div><div class="usr_tmplt_txt_r"><b>${eventname}</b></div><div class="usr_tmplt_txt_clr"></div></div>
							<div style="padding: 5px 20px 5px 20px;"><div class="usr_tmplt_txt_l" style="width:30%">Организатор:</div><div class="usr_tmplt_txt_r"><a href="${pageContext.request.contextPath}/pages/players/viewplayer/${creatorId}">${firstname}&nbsp;${lastname}</a></div><div class="usr_tmplt_txt_clr"></div></div> 
							<div style="padding: 5px 20px 5px 20px;"><div class="usr_tmplt_txt_l" style="width:30%">Контакты организатора:</div><div class="usr_tmplt_txt_r"> tel:${phone} </div><div class="usr_tmplt_txt_clr"></div></div> 
							<div style="padding: 5px 20px 10px 20px;"><div class="usr_tmplt_txt_l" style="width:30%">Вид спорта:</div><div class="usr_tmplt_txt_r">${sportname}</div><div class="usr_tmplt_txt_clr"></div></div>
							<form:input path="idgame" type="hidden" value="${eventgame.idgame}" />
							<div style="padding: 5px 20px 0px 20px;">
								<div class="usr_tmplt_txt_l" style="width:30%">Время начала:</div>
								<div class="usr_tmplt_txt_r"><form:input type="datetime" path="starttime" cssClass="inputText" style="border-color: #A4A4A4; height: 13px; padding:3px 5px 4px 5px;" /></div>
								<div class="usr_tmplt_txt_clr"></div>
							</div>
							<div style="padding: 5px 20px 0px 20px;">
								<div class="usr_tmplt_txt_l" style="width:30%">Время окончания:</div>
								<div class="usr_tmplt_txt_r"><form:input type="datetime" path="endtime" cssClass="inputText" style="border-color: #A4A4A4; height: 13px; padding:3px 5px 4px 5px;" /></div>
								<div class="usr_tmplt_txt_clr"></div>
							</div>
							<div style="padding: 5px 20px 0px 20px;">
								<div class="usr_tmplt_txt_l" style="width:30%">Комментарии игры:</div>
								<div class="usr_tmplt_txt_r"><form:textarea type="text" path="comments"	cols="50" rows="10" class="inputText" style="border-color: #A4A4A4; padding:3px 5px 4px 5px;" /></div>
								<div class="usr_tmplt_txt_clr"></div>
							</div>	
							<div style="padding: 20px 20px 0px 20px;"><div class="usr_tmplt_txt_l" style="width:30%">Участники:</div><div class="usr_tmplt_txt_r" style="width:70%">
						 		<c:forEach items="${gameparties}" var="gameparty">
									<a href="${pageContext.request.contextPath}/pages/players/viewplayer/${gameparty.user.iduser}">${gameparty.user.firstname}&nbsp;${gameparty.user.lastname}</a>, 
								</c:forEach>
							</div><div class="usr_tmplt_txt_clr"></div></div>
						</div>
					</div>
					<div style="width: 100%;"><div style="float: right;"><input type="submit" class="srchBtn" value="Сохранить" style="cursor: pointer; width: 100px; margin-top: 15px"/></div><br style="clear: both;"/></div>
				</form:form>
			</div>
			<jsp:include page="../../templates/cabinet.jsp"/>
		</div>
		<jsp:include page="../../templates/footer.jsp"/>
	</div>
</body>
</html>