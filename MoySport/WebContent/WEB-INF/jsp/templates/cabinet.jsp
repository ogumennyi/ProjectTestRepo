<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="menuBlock">
	<div class="box firstBox subMenu">
		<h3>Мой кабинет:</h3>
		<ul>
			<li <c:if test="${param.page == 'home'}">class="active"</c:if> ><a href="${pageContext.request.contextPath}/pages/user/home">Мой профайл</a></li>
			<li <c:if test="${param.page == 'events'}">class="active"</c:if> ><a href="${pageContext.request.contextPath}/pages/user/events">Мои события</a></li>
			<li <c:if test="${param.page == 'friends'}">class="active"</c:if> ><a href="${pageContext.request.contextPath}/pages/user/friends">Мои друзья</a></li>
			<li <c:if test="${param.page == 'trainings'}">class="active"</c:if> ><a href="${pageContext.request.contextPath}/pages/user/trainings">Мои тренировки</a></li>
			<li <c:if test="${param.page == 'settings'}">class="active"</c:if> ><a href="${pageContext.request.contextPath}/pages/user/settings">Мои настройки</a></li>
			<li <c:if test="${param.page == 'help'}">class="active"</c:if> ><a href="${pageContext.request.contextPath}/pages/user/help">Помощь</a></li>
			<li><a href="${pageContext.request.contextPath}/j_spring_security_logout">Выйти</a></li>
		</ul>
	</div>
	<div class="box boxText">
		<h3>Профайл:</h3>
		<strong>Александр Мединский</strong>
		<div>Игры:&nbsp;15</div>
		<div style="display: table-cell; vertical-align: bottom">
			Рейтинг: <img src="${pageContext.request.contextPath}/images/star7.png" alt="" class="left" style="border: 0" align="middle" />
		</div>
		<div style="margin-top: 5px">Локация:&nbsp;Гостомель</div>
	</div>
</div>