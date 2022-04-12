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
			<h3>QUẢN LÝ LOẠI SẢN PHẨM</h3>
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#edit">LOẠI
						SẢN PHẨM</a></li>
				<li><a data-toggle="tab" href="#list">DANH SÁCH</a></li>
			</ul>

			<div class="tab-content">
				<div id="edit" class="tab-pane fade in active">
					<jsp:include page="_form.jsp" />
				</div>
				<div id="list" class="tab-pane fade">
					<jsp:include page="_table.jsp"></jsp:include>

				</div>
			</div>
		</article>
		<footer class="row">
			<%@ include file="/WEB-INF/views/admin_v1/layout/footer.jsp"%>
		</footer>
	</div>
</body>
</html>

