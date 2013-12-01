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
					<img src="${pageContext.request.contextPath}/images/trainings.jpg" alt="" class="left" style="border: 0; width: 550px" />
				</div>
			</div>
			<jsp:include page="../../templates/cabinet.jsp">
				<jsp:param name="page" value="trainings" />
			</jsp:include>
		</div>
		<jsp:include page="../../templates/footer.jsp"/>
	</div>
</body>
</html>