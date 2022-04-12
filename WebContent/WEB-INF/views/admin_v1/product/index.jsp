<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
			<c:set var="prefix" value="/admin/product" scope="request" />
			<c:set var="form" value="${product}" scope="request" />

			<h4 class="alert alert-success">QUẢN LÝ SẢN PHẨM</h4>

			<!-- tabs -->
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#edit"> <span
						class="glyphicon glyphicon-edit"></span> Edit
				</a></li>
				<li><a data-toggle="tab" href="#list"> <span
						class="glyphicon glyphicon-list"></span> List
				</a></li>
			</ul>
			<!-- tab content -->
			<div class="tab-content">
				<div id="edit" class="tab-pane fade in active">
					<jsp:include page="_form.jsp" />
				</div>
				<div id="list" class="tab-pane fade">
					<jsp:include page="_list.jsp" />
				</div>
			</div>
		</article>
		<footer class="row">
			<%@ include file="/WEB-INF/views/admin_v1/layout/footer.jsp"%>
		</footer>
	</div>
</body>
</html>