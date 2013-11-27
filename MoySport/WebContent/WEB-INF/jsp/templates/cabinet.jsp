<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div id="menuBlock">
	<div class="box firstBox subMenu">
		<h3>Мой кабинет:</h3>
		<ul>
			<li><a href="<%=getServletContext().getContextPath()%>/pages/user/home">Мой профайл</a></li>
			<li><a href="<%=getServletContext().getContextPath()%>/pages/user/events">Мои события</a></li>
			<li><a href="<%=getServletContext().getContextPath()%>/pages/user/friends">Мои друзья</a></li>
			<li><a href="<%=getServletContext().getContextPath()%>/pages/user/trainings">Мои тренировки</a></li>
			<li><a href="<%=getServletContext().getContextPath()%>/pages/user/settings">Мои настройки</a></li>
			<li><a href="<%=getServletContext().getContextPath()%>/pages/user/help">Помощь</a></li>
			<li><a href="<%=getServletContext().getContextPath()%>/j_spring_security_logout">Выйти</a></li>
		</ul>
	</div>
	<div class="box boxText">
		<h3>Профайл:</h3>
		<strong>Александр Мединский</strong>
		<div>Игры:&nbsp;15</div>
		<div style="display: table-cell; vertical-align: bottom">
			Рейтинг: <img src="<%=getServletContext().getContextPath()%>/images/star7.png" alt="" class="left" style="border: 0" align="middle" />
		</div>
		<div style="margin-top: 5px">Локация:&nbsp;Гостомель</div>
	</div>
	<!-- 
	<div class="box subMenu">
		<h3>Archive:</h3>
		<ul>
			<li><a href="http://web-mastery.info/">January 2008</a></li>
			<li><a href="http://web-mastery.info/">February 2008</a></li>
			<li><a href="http://web-mastery.info/">March 2008</a></li>
			<li><a href="http://web-mastery.info/">April 2008</a></li>
			<li><a href="http://web-mastery.info/">May 2008</a></li>
		</ul>
	</div>
	 -->
</div>