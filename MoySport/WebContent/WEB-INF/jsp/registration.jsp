<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="cs" lang="cs">
<head>
<title>Мой Спорт</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default.css" media="screen" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/print.css" media="print" />
<style>
      .error {
        color: #ff0000;
        font-weight: bold;
      }
</style>
</head>
<body>
	<div id="view">
		<div id="head">
			<div id="logo">
				<a href="${pageContext.request.contextPath}/welcome" class="block">&nbsp;</a>
				<h1>
					<a href="http://web-mastery.info/">Moy<span>Sport</span></a>
				</h1>
				<h2>
					<a href="http://web-mastery.info/">my Hobby, my Passion, my Life</a>
				</h2>
			</div>
			<hr class="hidden" />
			<div id="mainMenu">
				<ul>
					<li><a href="${pageContext.request.contextPath}/welcome">Авторизация<span></span></a></li>
					<li class="active"><a href="${pageContext.request.contextPath}/registration">Регистрация<span></span></a></li>
				</ul>
			</div>
			<hr class="hidden" />
		</div>
		<div id="content">
			<div id="contentBlock">
				<h2>Регистрация</h2>
				<br/>
				<form:form method="post" action="${pageContext.request.contextPath}/user/new" modelAttribute="user">
					<fieldset>
						<div>
							<div><form:label path="nickname"><spring:message code="label.login.nickname"/></form:label></div>
							<form:input path="nickname" cssClass="inputText" />
						</div>
						<div style="padding-top: 5px;">
							<form:errors path="nickname" cssClass="error" />						
						</div>
						<div style="padding-top: 5px;">
							<div style="float: left;">
								<div>Имя</div>
								<form:input path="firstname" cssClass="inputText" />
							</div>
							<div style="float: left; margin-left: 25px">
								<div>Фамилия</div>
								<form:input path="lastname" cssClass="inputText" />
							</div>
						</div>
						<br style="clear: both;"/>
						<div style="padding-top: 5px;">
							<div style="float: left;">
								<div>Пароль</div>
								<form:input path="pwd" cssClass="inputText" />
							</div>
							<div style="float: left; margin-left: 25px">
								<div>Повторите пароль</div>
								<input type="text" name="confirm_password" value="" class="inputText"/>
							</div>
						</div>
						<br style="clear: both;"/>
						<div style="padding-top: 5px;"></div>
						<form:errors path="pwd" cssClass="error" />					
						<div style="padding-top: 5px;">
						<form:input path="birthdate" name="birthdate" cssClass="inputText" type="hidden"/>
							<div style="float: left;">
								<div>День рождения</div>
								<select name="day" >
										<option  value="День" selected="selected">День</option>
										<c:forEach var="i" begin="1" end="31">
											<option>${i}</option>
										</c:forEach>
								</select>
							</div>
							<div style="float: left; margin-left: 25px">
								<div>Месяц рождения</div>
								<select name="month">
										<option value="Месяц" selected="selected">Месяц</option>
										<option>Январь</option>
										<option>Февраль</option>
										<option>Март</option>
										<option>Апрель</option>
										<option>Май</option>
										<option>Июнь</option>
										<option>Июль</option>
										<option>Август</option>
										<option>Сентябрь</option>
										<option>Октябрь</option>
										<option>Ноябрь</option>
										<option>Декабрь</option>
								</select>
							</div>
							<div style="float: left; margin-left: 50px">
								<div>Год рождения</div>
								<select name="year" >
										<option value="Год" selected="selected">Год</option>
										<c:forEach var="i" begin="1900" end="2010">
											<option>${i}</option>
										</c:forEach>
								</select>
							</div>
							<div style="float: left; margin-left: 75px">
								<div style="float: left; margin-left: 75px">
								<form:errors path="birthdate" cssClass="error" />
							</div>
							</div>
						</div>
						
						<br style="clear: both;"/>						
						<div style="padding-top: 5px;">Телефон</div>
						<form:input path="mphone" cssClass="inputText" />
						<div style="padding-top: 5px;">email</div>						
						<form:input path="email" cssClass="inputText" />
						<div style="padding-top: 5px;"></div>
						<form:errors path="email" cssClass="error" />
						<br/><br/>
						<p>
							<input type="submit" class="submit" value="Зарегистрироваться" style="cursor: pointer;"/>
						</p>
					</fieldset>
					<br/>
				</form:form>
			</div>
		</div>
		<jsp:include page="templates/footer.jsp"/>
	</div>
</body>
</html>