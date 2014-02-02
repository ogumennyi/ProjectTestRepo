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
					<div style="background-color: #EEEFE3; border:1px solid grey; border-radius: 5px;">
						<div class="usr_tmplt_txt" style="width:100%; margin-bottom:10px;">
							<div style="padding: 5px 20px 0px 20px;">
								<div class="usr_tmplt_txt_l" style="width:30%"><b>Название локации:</b></div>
								<div class="usr_tmplt_txt_r"><b>${location.name}</b></div>
								<div class="usr_tmplt_txt_clr"></div>
							</div>
							<div style="padding: 5px 20px 0px 20px;">
								<div class="usr_tmplt_txt_l" style="width:30%">Кол-во мероприятий:</div>
								<div class="usr_tmplt_txt_r">${location.checkin}</div>
								<div class="usr_tmplt_txt_clr"></div>
							</div>
							<div style="padding: 5px 20px 0px 20px;">
								<div class="usr_tmplt_txt_l" style="width:30%">Страна:</div>
								<div class="usr_tmplt_txt_r">${location.country}</div>
								<div class="usr_tmplt_txt_clr"></div>
							</div>
							<div style="padding: 5px 20px 0px 20px;">
								<div class="usr_tmplt_txt_l" style="width:30%">Регион:</div>
								<div class="usr_tmplt_txt_r">${location.region}</div>
								<div class="usr_tmplt_txt_clr"></div>
							</div>
							<div style="padding: 5px 20px 0px 20px;">
								<div class="usr_tmplt_txt_l" style="width:30%">Город:</div>
								<div class="usr_tmplt_txt_r">${location.city}</div>
								<div class="usr_tmplt_txt_clr"></div>
							</div>
							<div style="padding: 5px 20px 0px 20px;">
								<div class="usr_tmplt_txt_l" style="width:30%">Район:</div>
								<div class="usr_tmplt_txt_r">${location.district}</div>
								<div class="usr_tmplt_txt_clr"></div>
							</div>
							<div style="padding: 5px 20px 0px 20px;">
								<div class="usr_tmplt_txt_l" style="width:30%">Улица:</div>
								<div class="usr_tmplt_txt_r">${location.street}</div>
								<div class="usr_tmplt_txt_clr"></div>
							</div>
							<div style="padding: 5px 20px 0px 20px;">
								<div class="usr_tmplt_txt_l" style="width:30%">Дом:</div>
								<div class="usr_tmplt_txt_r">${location.building}</div>
								<div class="usr_tmplt_txt_clr"></div>
							</div>
							<div style="padding: 5px 20px 0px 20px;">
								<div class="usr_tmplt_txt_l" style="width:30%">Почтовый Индекс:</div>
								<div class="usr_tmplt_txt_r">${location.zip}</div>
								<div class="usr_tmplt_txt_clr"></div>
							</div>
							<div style="padding: 5px 20px 0px 20px;">
								<div class="usr_tmplt_txt_l" style="width:30%">Контакты:</div>
								<div class="usr_tmplt_txt_r">${location.contacts}</div>
								<div class="usr_tmplt_txt_clr"></div>
							</div>
							<div style="padding: 5px 20px 0px 20px;">
								<div class="usr_tmplt_txt_l" style="width:30%">web-site:</div>
								<div class="usr_tmplt_txt_r"><a href="${location.httplink}"><b>${location.httplink}</b></a></div>
								<div class="usr_tmplt_txt_clr"></div>
							</div>
							<div style="padding: 5px 20px 0px 20px;">
								<div class="usr_tmplt_txt_l" style="width:30%">Статус Локации:</div>
								<div class="usr_tmplt_txt_r">${location.status}</div>
								<div class="usr_tmplt_txt_clr"></div>
							</div>
							<div style="padding: 5px 20px 0px 20px;">
								<div class="usr_tmplt_txt_l" style="width:30%">Описание объекта:</div>
								<div class="usr_tmplt_txt_r">${location.description}</div>
								<div class="usr_tmplt_txt_clr"></div>
							</div>
							<div style="padding: 5px 20px 0px 20px;">
								<div class="usr_tmplt_txt_l" style="width:30%">Кем создано:</div>
								<div class="usr_tmplt_txt_r">${location.idcreatedby}</div>
								<div class="usr_tmplt_txt_clr"></div>
							</div>
							<div style="padding: 5px 20px 0px 20px;">
								<div class="usr_tmplt_txt_l" style="width:30%">Дата создания:</div>
								<div class="usr_tmplt_txt_r">${location.creationdate}</div>
								<div class="usr_tmplt_txt_clr"></div>
							</div>
							<div style="padding: 5px 20px 0px 20px;">
								<div class="usr_tmplt_txt_l" style="width:30%">Кем изменено:</div>
								<div class="usr_tmplt_txt_r">${location.idchangeby}</div>
								<div class="usr_tmplt_txt_clr"></div>
							</div>
							<div style="padding: 5px 20px 0px 20px;">
								<div class="usr_tmplt_txt_l" style="width:30%">Дата изменения:</div>
								<div class="usr_tmplt_txt_r">${location.changedate}</div>
								<div class="usr_tmplt_txt_clr"></div>
							</div>
							<div style="padding: 10px 20px;">
								<a href="${pageContext.request.contextPath}/pages/locations/editlocation/${location.idlocation}"><b>Редактировать локацию</b></a>
							</div>
						</div>
					</div>
				</div>
				<jsp:include page="../../templates/cabinet.jsp"/>
			</div>
			<jsp:include page="../../templates/footer.jsp"/>
		</div>
	</body>
</html>