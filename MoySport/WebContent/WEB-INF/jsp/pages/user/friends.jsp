<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="cs" lang="cs">
<head>
<title>Мой Спорт</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default.css" media="screen" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/print.css" media="print" />
</head>
<body>
	<div id="view">
		<jsp:include page="../../templates/header.jsp"/>
		<div id="content">
			<div id="contentBlock">
				<div class="item last">
					<div class="box boxText">
						<table class="regular">
							<tr>
								<td><a href="view_public.html"><img src="${pageContext.request.contextPath}/img/ivan.jpg" width="150px" alt="" class="left" /></a> <br></td>
								<td width=300px valign=top>
									<div>
										<strong><a href="view_public.html">Иван Громский</a></strong>
									</div>
									<div>Игры:&nbsp;30</div>
									<div style="display: table-cell; vertical-align: bottom">
										Рейтинг: <img src="${pageContext.request.contextPath}/images/star5.png" alt="" class="left" style="border: 0" align="middle" />
									</div>
									<div>Позиция:&nbsp; Полузащитник</div>
									<div>Локация:&nbsp;Киев</div>
									<div>Виды спорта:&nbsp;Футбол,Баскетбол,Волейбол</div> <br>
								<br>
								<br> <a href="#content">Удалить из Друзей</a>
								</td>
							</tr>
						</table>
					</div>
					<div class="box boxText">
						<table class="regular">
							<tr>
								<td><a href="view_public.html"><img src="${pageContext.request.contextPath}/img/image.gif" width="150px" alt="" class="left" /></a> <br></td>
								<td width=300px valign=top>
									<div>
										<strong><a href="view_public.html">Алексей Монятовский</a></strong>
									</div>
									<div>Игры:&nbsp;40</div>
									<div style="display: table-cell; vertical-align: bottom">
										Рейтинг: <img src="${pageContext.request.contextPath}/images/star9.png" alt="" class="left" style="border: 0" align="middle" />
									</div>
									<div>Позиция:&nbsp; Нападающий</div>
									<div>Локация:&nbsp;Киев</div>
									<div>Виды спорта:&nbsp;Футбол</div> <br>
								<br>
								<br> <a href="#content">Удалить из Друзей</a>
								</td>
							</tr>
						</table>
					</div>
					<div class="box boxText">
						<table class="regular">
							<tr>
								<td><a href="view_public.html"><img src="${pageContext.request.contextPath}/img/image.gif" width="150px" alt="" class="left" /></a> <br></td>
								<td width=300px>
									<div>
										<strong><a href="view_public.html">Надежда Закревская</a></strong>
									</div>
									<div>Игры:&nbsp;60</div>
									<div style="display: table-cell; vertical-align: bottom">
										Рейтинг: <img src="${pageContext.request.contextPath}/images/star7.png" alt="" class="left" style="border: 0" align="middle" />
									</div>
									<div>Позиция:&nbsp; Защитник</div>
									<div>Локация:&nbsp;Донецк</div>
									<div>Виды спорта:&nbsp;Футбол,Баскетбол,Волейбол</div> <br>
								<br>
								<br> <a href="#content">Удалить из Друзей</a>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<jsp:include page="../../templates/cabinet.jsp">
				<jsp:param name="page" value="friends" />
			</jsp:include>
		</div>
		<jsp:include page="../../templates/footer.jsp"/>
	</div>
</body>
</html>