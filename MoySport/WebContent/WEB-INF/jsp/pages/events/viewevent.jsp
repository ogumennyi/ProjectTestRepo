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
		<jsp:include page="../../templates/header.jsp">
			<jsp:param name="page" value="searchevents" />
		</jsp:include>
		<div id="content">
			<div id="dataBlock">
				<table class="regular">
					<tr>
						<td width="100%" valign="top">
							<table class="textFont regular" style="padding: 10px">
								<tr>
									<th class="heading" colspan="2" align="left">Игра: ${event[0].name}</th>
								</tr>
								<tr>
									<td class="fldName">Организатор</td>
									<td class="fldText">${events.idcreatedby}</td>
								</tr>
								<tr>
									<td class="fldName">Локация:</td>
									<td class="fldText">${locations.name}</td>
								</tr>
								<tr>
									<td class="fldName">Время начала:</td>
									<td class="fldText">${eventgames.starttime}</td>
								</tr>
								<tr>
									<td class="fldName">Время окончания:</td>
									<td class="fldText">${eventgames.endtime}</td>
								</tr>
								<tr>
									<td class="fldName">Комментарии:</td>
									<td class="fldText">${eventgames.comments}</td>
								</tr>
								<tr>
									<td class="fldName">Max Кол-во участников:</td>
									<td class="fldText">кол-во участников</td>
								</tr>
								<tr>
									<td class="fldName">Участники:</td>
									<td class="fldText">
										<table class="regular" style="padding: 10px">
											<tr>
												<td class="fldText"><a href="userhome.html">Александр Мединский</a>(если ссылка на себя - userhome.html)</td>
											</tr>
											<tr>
												<td class="fldText"><a href="view_public.html">Иван Громский</a>(ссылка на публичный профайл)</td>
											</tr>
											<tr>
												<td class="fldText"><a href="view_public.html">Олег Гуменной</a>(ссылка на публичный профайл)</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td class="fldName" colspan="2"><a href="#">Принять участие</a> (доступно для тех, кто еще не в списках участников)</td>
								</tr>
								<tr>
									<td class="fldName" colspan="2"><a href="edit_event.html">Редактировать Игру</a>( Доступно только для Создателя)</td>
								</tr>
								<tr>
									<td class="fldName" colspan="2" align="center"><br>
									<br>
									<br>Блок Переписки пользователей</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
			<jsp:include page="../../templates/cabinet.jsp"/>
		</div>
		<jsp:include page="../../templates/footer.jsp"/>
	</div>
</body>
</html>