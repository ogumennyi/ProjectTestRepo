<%@page session="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="cs" lang="cs">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Session Timeout</title>
</head>
<body>
<div id="content">
<h2>Invalid Session</h2>
<p>
Your session appears to have timed out. Please <a href="<c:url value='/'/>">start again</a>.
</p>
</div>
</body>
</html>
