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
</head>
<body>
	<div id="view">
		<jsp:include page="../../templates/header.jsp">
			<jsp:param name="page" value="searchevents" />
		</jsp:include>
		<div id="content">
			<div id="dataBlock">
				<form:form action="${pageContext.request.contextPath}/pages/events/createevent" method="post" modelAttribute="event">
					<table>
						<tr>
							<td valign="top">
								<table class="textFont" style="padding: 10px">
									<tr>
										<th class="heading" colspan="2" align="left">Создание События</th>
									</tr>
									<tr>
										<td class="fldName">Вид спорта:</td>
										<td class="fldText">
											<select name="idSport"  class="inputText searchselect" style="margin: 0px;">
												<c:forEach items="${sportList}" var="sport">
													<option <c:if test="${sport.idsport == idsport}">selected="selected"</c:if> value="${sport.idsport}">${sport.name}</option>
												</c:forEach>
											</select>
										</td>
									</tr>
<%--
								<tr>
										<td class="fldName">Max Кол-во участников:</td>
										<td class="fldText"><input type="text" value="" class="inputText"/>кол-во участников</td>
									</tr>
 --%>
									<tr>
										<td class="fldName">Название события:</td>
										<td class="fldText"><form:input type="text" path="name"  class="inputText" /></td>
									</tr>
<tr>
										<td class="fldName">Локация:</td>
										<td class="fldText">
										<select  name="idlocation" class="inputText" style="margin: 0px;">
												<c:forEach items="${locationList}" var="location">
													<option	<c:if test="${location.idlocation == idlocation}">selected="selected"</c:if> value="${location.idlocation}">${location.name}</option>
												</c:forEach>
										</select></td>
									</tr>
	<%--								
									<tr>
										<td class="fldName">Время начала:</td>
										<td class="fldText"><input type="text" value="" class="inputText"/>${eventgames.starttime}</td>
									</tr>
									<tr>
										<td class="fldName">Время окончания:</td>
										<td class="fldText"><input type="text" value="" class="inputText"/>${eventgames.endtime}</td>
									</tr>
									<tr>
										<td class="fldName">Комментарии окончания:</td>
										<td class="fldText"><input type="text" value="" class="inputText"/>${eventgames.comments}</td>
									</tr>
 --%>
									<tr>
										<td class="fldName" colspan="2" align="left"><input type="submit" class="submit" value="Создать" style="cursor: pointer;"/></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</form:form>
			</div>
			<jsp:include page="../../templates/cabinet.jsp"/>
		</div>
		<jsp:include page="../../templates/footer.jsp"/>
	</div>
</body>
</html>
