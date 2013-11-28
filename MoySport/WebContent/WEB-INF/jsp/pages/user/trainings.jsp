<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
<title>Мой Спорт</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="<%=getServletContext().getContextPath()%>/css/default.css" media="screen" />
<link rel="stylesheet" type="text/css" href="<%=getServletContext().getContextPath()%>/css/print.css" media="print" />
</head>
<body>
	<div id="view">
		<jsp:include page="../../templates/header.jsp"/>
		<div id="content">
			<div id="contentBlock">
				<div class="item last">
					<img src="<%=getServletContext().getContextPath()%>/images/trainings.jpg" alt="" class="left" style="border: 0; width: 550px" />
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