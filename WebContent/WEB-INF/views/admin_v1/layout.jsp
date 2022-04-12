<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>QUẢN TRỊ WEBSITE</title>
<%@ include file="/WEB-INF/views/admin_v1/layout/head.jsp"%>
</head>
<body>
	<div class="container">
		<nav class="row">
			<%@ include file="/WEB-INF/views/admin_v1/layout/menu.jsp"%>
		</nav>
		<article class="row">
			<%@ include file="/WEB-INF/views/admin_v1/layout/body.jsp"%>
		</article>
		<footer class="row">
			<%@ include file="/WEB-INF/views/admin_v1/layout/footer.jsp"%>
		</footer>
	</div>
</body>
</html>