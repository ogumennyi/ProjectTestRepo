<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
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

</div>
</body>
</html>
