<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
<a href="<%= getServletContext().getContextPath()%>/sport">Welcome to MoySport</a>
<a href="<%= getServletContext().getContextPath()%>/table_pages/eventgames">Welcome to EventGames</a>

</div>
</body>
</html>
