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
				<jsp:param name="page" value="searchlocations" />
			</jsp:include>
			<div id="content">
				<div id="dataBlock">
					<h3>Редактирование локации</h3>
					<form:form action="${pageContext.request.contextPath}/pages/locations/editlocation" method="post" modelAttribute="location">
						<div style="background-color: #EEEFE3; border:1px solid grey; border-radius: 5px;">
							<div class="usr_tmplt_txt" style="width:100%; margin-bottom:10px;">
								<form:input path="idlocation" type="hidden" value="${location.idlocation}" />
								<%-- <div class="usr_tmplt_txt_h" style="padding: 10px 20px 10px 20px;">
									<div class="usr_tmplt_txt_l" style="width:30%"><b>Локации №:</b></div>
									<div class="usr_tmplt_txt_r"><b>${location.idlocation}</b></div>
									<div class="usr_tmplt_txt_clr"></div>
								</div> --%>
								<div style="padding: 5px 20px 0px 20px;">
									<div class="usr_tmplt_txt_l" style="width:30%">Название локации:</div>
									<div class="usr_tmplt_txt_r"><form:input path="name" cssClass="inputText" style="border-color: #A4A4A4; height: 13px; padding:3px 5px 4px 5px;" /></div>
									<div class="usr_tmplt_txt_clr"></div>
								</div>
								<div style="padding: 5px 20px 0px 20px;">
									<div class="usr_tmplt_txt_l" style="width:30%">Страна:</div>
									<div class="usr_tmplt_txt_r"><form:input path="country" cssClass="inputText" style="border-color: #A4A4A4; height: 13px; padding:3px 5px 4px 5px;" /></div>
									<div class="usr_tmplt_txt_clr"></div>
								</div>
								<div style="padding: 5px 20px 0px 20px;">
									<div class="usr_tmplt_txt_l" style="width:30%">Регион:</div>
									<div class="usr_tmplt_txt_r"><form:input path="region" cssClass="inputText" style="border-color: #A4A4A4; height: 13px; padding:3px 5px 4px 5px;" /></div>
									<div class="usr_tmplt_txt_clr"></div>
								</div>
								<div style="padding: 5px 20px 0px 20px;">
									<div class="usr_tmplt_txt_l" style="width:30%">Город:</div>
									<div class="usr_tmplt_txt_r"><form:input path="city" cssClass="inputText" style="border-color: #A4A4A4; height: 13px; padding:3px 5px 4px 5px;" /></div>
									<div class="usr_tmplt_txt_clr"></div>
								</div>
								<div style="padding: 5px 20px 0px 20px;">
									<div class="usr_tmplt_txt_l" style="width:30%">Район:</div>
									<div class="usr_tmplt_txt_r"><form:input path="district" cssClass="inputText" style="border-color: #A4A4A4; height: 13px; padding:3px 5px 4px 5px;" /></div>
									<div class="usr_tmplt_txt_clr"></div>
								</div>
								<div style="padding: 5px 20px 0px 20px;">
									<div class="usr_tmplt_txt_l" style="width:30%">Улица:</div>
									<div class="usr_tmplt_txt_r"><form:input path="street" cssClass="inputText" style="border-color: #A4A4A4; height: 13px; padding:3px 5px 4px 5px;" /></div>
									<div class="usr_tmplt_txt_clr"></div>
								</div>
								<div style="padding: 5px 20px 0px 20px;">
									<div class="usr_tmplt_txt_l" style="width:30%">Дом:</div>
									<div class="usr_tmplt_txt_r"><form:input path="building" cssClass="inputText" style="border-color: #A4A4A4; height: 13px; padding:3px 5px 4px 5px;" /></div>
									<div class="usr_tmplt_txt_clr"></div>
								</div>
								<div style="padding: 5px 20px 0px 20px;">
									<div class="usr_tmplt_txt_l" style="width:30%">Почтовый Индекс:</div>
									<div class="usr_tmplt_txt_r"><form:input path="zip" cssClass="inputText" style="border-color: #A4A4A4; height: 13px; padding:3px 5px 4px 5px;" /></div>
									<div class="usr_tmplt_txt_clr"></div>
								</div>
								<div style="padding: 5px 20px 0px 20px;">
									<div class="usr_tmplt_txt_l" style="width:30%">Контакты:</div>
									<div class="usr_tmplt_txt_r"><form:input path="contacts" cssClass="inputText" style="border-color: #A4A4A4; height: 13px; padding:3px 5px 4px 5px;" /></div>
									<div class="usr_tmplt_txt_clr"></div>
								</div>
								<div style="padding: 5px 20px 0px 20px;">
									<div class="usr_tmplt_txt_l" style="width:30%">web-site:</div>
									<div class="usr_tmplt_txt_r"><form:input path="httplink" cssClass="inputText" style="border-color: #A4A4A4; height: 13px; padding:3px 5px 4px 5px;" /></div>
									<div class="usr_tmplt_txt_clr"></div>
								</div>
								<div style="padding: 5px 20px 0px 20px;">
									<div class="usr_tmplt_txt_l" style="width:30%">Статус Локации:</div>
									<div class="usr_tmplt_txt_r">
										<form:select  path="status" cssClass="inputText" style="border-color: #A4A4A4; height: 23px; padding:3px 5px 4px 5px;">
											<option <c:if test="${location.status == 'BLACK'}">selected="selected"</c:if> value="BLACK">BLACK</option>
											<option <c:if test="${location.status == 'WHITE'}">selected="selected"</c:if> value="WHITE">WHITE</option>
										</form:select>
									</div>
									<div class="usr_tmplt_txt_clr"></div>
								</div>
								<div style="padding: 5px 20px 0px 20px;">
									<div class="usr_tmplt_txt_l" style="width:30%">Описание объекта:</div>
									<div class="usr_tmplt_txt_r"><form:textarea type="text" path="description"	cols="50" rows="10" class="inputText" style="border-color: #A4A4A4; padding:3px 5px 4px 5px;" /></div>
									<div class="usr_tmplt_txt_clr"></div>
								</div>
								<div style="padding: 5px 20px 0px 20px;">
									<div class="usr_tmplt_txt_l" style="width:30%">Кем создано:</div>
									<%-- <div class="usr_tmplt_txt_r">${location.idcreatedby}</div> --%>
									<div class="usr_tmplt_txt_r"><a href="${pageContext.request.contextPath}/pages/players/viewplayer/${location.createdby.iduser}">${location.createdby.firstname} ${location.createdby.lastname}</a></div>
									<div class="usr_tmplt_txt_clr"></div>
								</div>
								<div style="padding: 5px 20px 0px 20px;">
									<div class="usr_tmplt_txt_l" style="width:30%">Дата создания:</div>
									<div class="usr_tmplt_txt_r">${location.creationdate}</div>
									<div class="usr_tmplt_txt_clr"></div>
								</div>
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