<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="cs" lang="cs">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default.css" media="screen" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/print.css" media="print" />
</head>
<body>
	<div id="view">
		<div id="head">
			<div id="logo">
				<a href="${pageContext.request.contextPath}/welcome" class="block">&nbsp;</a>
				<h1>
					<a href=".">Moy<span>Sport</span></a>
				</h1>
				<h2>
					<a href=".">My Hobby, my Passion, my Life</a>
				</h2>
			</div>
			<hr class="hidden" />
			<div id="mainMenu">
				<ul>
					<li class="active"><a href="${pageContext.request.contextPath}/welcome">Авторизация<span></span></a></li>
					<li><a href="${pageContext.request.contextPath}/registration">Регистрация<span></span></a></li>
				</ul>
			</div>
			<hr class="hidden" />
		</div>
		<div id="content">
			<div id="contentBlock">
				<div class="item last">
					<h2>Мой Спорт</h2>
					<br/>
					<p>"Мой спорт" это спортивная социальная сеть, предназначена для улучшения жизни каждого человека, который занимается спортом. Сеть позволяет людям
						найти новых спортивных партнеров, расписание спортивных мероприятий, спортивные объекты в любой точке мира.</p>
					<p>
						<b>Версия проекта 1.0</b>
					</p>
					<ul>
						<li>поиск пользователей</li>
						<li>создание пользователей</li>
						<li>поиск мероприятий</li>
						<li>создание мероприятий</li>
						<li>поиск локаций</li>
						<li>просмотр оценок пользователей</li>
						<li>проставление оценок пользователей</li>
						<li>отслеживание событий друзей (новостная лента)</li>
						<li>добавления пользователей в друзья</li>
					</ul>
				</div>
			</div>
			<hr class="hidden" />
			<div id="menuBlockAu">
				<div class="box firstBox subMenu boxText">
					<h3>Авторизация:</h3>
					<br/>
					<form action="${pageContext.request.contextPath}/j_spring_security_check" method="post">
						<div>email</div>
						<div><input type="text" name='j_username' class="inputText"/></div>
						<div style="padding-top: 5px;">Пароль</div>
						<div><input type="password" name='j_password' class="inputText"/></div>
						<p class="margin_5000">
							<input type="submit" class="submit" value="Войти" style="cursor: pointer;"/>
						</p>
					</form>
					<c:if test="${'fail' eq auth}">
					    <div style="color:red">
				            Login Failed!!!<br />
				            Reason : ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
					     </div>
					</c:if>
				</div>
			</div>
		</div>
		<jsp:include page="templates/footer.jsp"/>
	</div>
</body>
</html>