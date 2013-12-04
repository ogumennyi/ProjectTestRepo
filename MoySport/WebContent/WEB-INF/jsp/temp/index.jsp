<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<<<<<<< HEAD
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <link rel="stylesheet" href="<c:url value='/static/css/tutorial.css'/>" type="text/css" />
      <title>Employee Information System - Home</title>
  </head>
<body>
<div id="content">
<h1>Home Page</h1>
<p>
Anyone can view this page.
</p>

<p>
Your principal object is....: <%= request.getUserPrincipal() %>
</p>
<sec:authorize url='./employee/list.html'>
<p>
You can currently access "/employee" URLs.
</p>
</sec:authorize>
<sec:authorize url='./admin/home.html'>
<p>
You can currently access "/admin" URLs.
</p>
</sec:authorize>
<p>
<a href="<%= getServletContext().getContextPath()%>/employee/list.html">Employee List</a></p>
<p><a href="<%= getServletContext().getContextPath()%>/admin/home.html">Admin Home</a></p>
<% if(request.getUserPrincipal()!=null){ %>
<p><a href="<%= getServletContext().getContextPath()%>/j_spring_security_logout">Logout</a></p>
<% } else { %>
<p><a href="<%= getServletContext().getContextPath()%>/login">Login</a></p>
<% } %>
<hr>
<br><a href="<%= getServletContext().getContextPath()%>/table_pages/eventgames">Welcome to EventGames</a>
<br><a href="<%= getServletContext().getContextPath()%>/table_pages/gameparties">Welcome to GameParties</a>
<br><a href="<%= getServletContext().getContextPath()%>/table_pages/trainingplan">Welcome to TrainingPlan</a>
<br><a href="<%= getServletContext().getContextPath()%>/table_pages/userskill">Welcome to UserSkill</a>
<br><a href="<%= getServletContext().getContextPath()%>/table_pages/users">Welcome to Users</a>
<br><a href="<%= getServletContext().getContextPath()%>/table_pages/sport">Welcome to Sport</a>
<br><a href="<%= getServletContext().getContextPath()%>/table_pages/events">Welcome to Events</a>
<br><a href="<%= getServletContext().getContextPath()%>/table_pages/gameratings">Welcome to Gameratings</a>
<br><a href="<%= getServletContext().getContextPath()%>/table_pages/locations">Welcome to Locations</a>
<br><a href="<%= getServletContext().getContextPath()%>/table_pages/trainings">Welcome to Trainings</a>
<br><a href="<%= getServletContext().getContextPath()%>/table_pages/trainingweek">Welcome to Trainingweek</a>
=======
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="cs" lang="cs">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="<c:url value='/static/css/tutorial.css'/>" type="text/css" />
    <title>Employee Information System - Home</title>
</head>
<body>
<div id="content">
<h1>Home Page</h1>
<p>
Anyone can view this page.
</p>

<p>
Your principal object is....: <%= request.getUserPrincipal() %>
</p>
<sec:authorize url='./employee/list.html'>
<p>
You can currently access "/employee" URLs.
</p>
</sec:authorize>
<sec:authorize url='./admin/home.html'>
<p>
You can currently access "/admin" URLs.
</p>
</sec:authorize>
<p>
<a href="${pageContext.request.contextPath}/employee/list.html">Employee List</a></p>
<p><a href="${pageContext.request.contextPath}/admin/home.html">Admin Home</a></p>
<% if(request.getUserPrincipal()!=null){ %>
<p><a href="${pageContext.request.contextPath}/j_spring_security_logout">Logout</a></p>
<% } else { %>
<p><a href="${pageContext.request.contextPath}/login">Login</a></p>
<% } %>
<hr>
<br><a href="${pageContext.request.contextPath}/table_pages/eventgames">Welcome to EventGames</a>
<br><a href="${pageContext.request.contextPath}/table_pages/gameparties">Welcome to GameParties</a>
<br><a href="${pageContext.request.contextPath}/table_pages/trainingplan">Welcome to TrainingPlan</a>
<br><a href="${pageContext.request.contextPath}/table_pages/userskill">Welcome to UserSkill</a>
<br><a href="${pageContext.request.contextPath}/table_pages/users">Welcome to Users</a>
<br><a href="${pageContext.request.contextPath}/table_pages/sport">Welcome to Sport</a>
>>>>>>> refs/heads/nb15

</div>
</body>
</html>
