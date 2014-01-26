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
				<jsp:param name="page" value="searchlocations" />
			</jsp:include>
			<div id="content">
				<div id="dataBlock">
					<form:form action="${pageContext.request.contextPath}/pages/locations/editlocation" method="post" modelAttribute="location">
						<table>
							<tr>
								<td width="100%" valign="top">
									<table class="textFont" style="padding: 10px">
										<tr>
											<th class="heading" colspan="2" align="left">Создание локации</th>
										</tr>
										<tr>
											<td class="fldName">ID Локации:</td>
											<td class="fldText"><form:input type="text" path="idlocation" cssClass="inputText"/></td>
										</tr>
										<tr>
											<td class="fldName">Название локации:</td>
											<td class="fldText"><form:input type="text" path="name" cssClass="inputText"/></td>
										</tr>
										<tr>
											<td class="fldName">Страна:</td>
											<td class="fldText"><form:input type="text" path="country" cssClass="inputText" /></td>
										</tr>
										
										<tr>
											<td class="fldName">Регион:</td>
											<td class="fldText"><form:input type="text" path="region" cssClass="inputText" /></td>
										</tr>
										<tr>
											<td class="fldName">Город:</td>
											<td class="fldText"><form:input type="text" path="city" cssClass="inputText" /></td>
										</tr>
										<tr>
											<td class="fldName">Район:</td>
											<td class="fldText"><form:input type="text" path="district" cssClass="inputText" /></td>
										</tr>
										<tr>
											<td class="fldName">Улица:</td>
											<td class="fldText"><form:input type="text" path="street" cssClass="inputText" /></td>
										</tr>
										<tr>
											<td class="fldName">Дом:</td>
											<td class="fldText"><form:input type="text" path="building" cssClass="inputText" /></td>
										</tr>
										<tr>
											<td class="fldName">Почтовый Индекс:</td>
											<td class="fldText"><form:input type="text" path="zip" cssClass="inputText" /></td>
										</tr>
										<tr>
											<td class="fldName">Описание объекта:</td>
											<td class="fldText"><form:input type="text" path="description" cssClass="inputText" /></td>
										</tr>
										<tr>
											<td class="fldName">Контакты:</td>
											<td class="fldText"><form:input type="text" path="contacts" cssClass="inputText" /></td>
										</tr>
										<tr>
											<td class="fldName">web-site:</td>
											<td class="fldText"><form:input type="text" path="httplink" cssClass="inputText" /></td>
										</tr>
										<tr>
											<td class="fldName">Статус Локации:</td>
											<td class="fldText">
												<form:select path="status" cssClass="inputText">
													<option <c:if test="${location.status == 'BLACK'}">selected="selected"</c:if> value="BLACK">BLACK</option>
													<option <c:if test="${location.status == 'WHITE'}">selected="selected"</c:if> value="WHITE">WHITE</option>
												</form:select>
											</td>
										</tr>
										
										
										<tr>
											<td class="fldName" colspan="2" align="left"><input type="submit" class="submit" value="Сохранить" style="cursor: pointer;"></td>
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