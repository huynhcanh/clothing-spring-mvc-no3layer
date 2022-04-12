<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<c:set var="prefix" value="/admin/order" scope="request" />
<c:set var="form" value="${order}" scope="request" />

<%@ include file="/WEB-INF/views/admin_v1/layout/head.jsp"%>
</head>
<body>
	<div class="container">
		<nav class="row">
			<%@ include file="/WEB-INF/views/admin_v1/layout/menu.jsp"%>
		</nav>
		<h4 class="alert alert-success">QUẢN LÝ ĐƠN HÀNG</h4>
		<!-- tabs -->
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#edit"> <span
					class="glyphicon glyphicon-edit"></span> Chỉnh sửa
			</a></li>
			<li><a data-toggle="tab" href="#list"> <span
					class="glyphicon glyphicon-list"></span> Danh sách
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

		<footer class="row">
			<%@ include file="/WEB-INF/views/admin_v1/layout/footer.jsp"%>
		</footer>
	</div>
</body>
</html>
