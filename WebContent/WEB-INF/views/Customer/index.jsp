<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.80.0">

<title>QUẢN TRỊ WEBSITE</title>
<base href="${pageContext.servletContext.contextPath}/">
<link
	href="<c:url value='/resources/assets/dist/css/bootstrap.min.css' />"
	rel="stylesheet">
 <script type="text/javascript" src="//js.nicedit.com/nicEdit-latest.js"></script>
<style type="text/css">
</style>
<%@ include file="/WEB-INF/views/admin_v1/layout/head.jsp"%>
</head>
<body>
<%-- Khởi tạo bean --%>
	<main class="container">
		<nav class="row">
			<%@ include file="/WEB-INF/views/admin_v1/layout/menu.jsp"%>
		</nav>
		<div class="bg-light p-5 rounded">
			${message}
			<form:form class="row g-3" modelAttribute="customer"
				action="Customer/index.htm" id="frm1">

				<form:input path="id" type="hidden" class="form-control"
					id="exampleFormControlInput1" />

				<div class="col-md-4">
					<label for="exampleFormControlInput1" class="form-label">Tên
						khách hàng</label>
					<form:input path="name" type="text" class="form-control"
						id="exampleFormControlInput1"
						placeholder="Vui lòng nhập tên khách hàng" />
				</div>
				<div class="col-md-4">
					<label for="exampleFormControlInput1" class="form-label">Email</label>
					<form:input path="email" type="text" class="form-control"
						id="exampleFormControlInput1" placeholder="Vui lòng nhập email" />
				</div>
				<div class="col-md-5">
					<label for="exampleFormControlInput1" class="form-label">Password</label>
					<form:input path="password" type="text" class="form-control"
						id="exampleFormControlInput1" placeholder="Vui lòng nhập mật khẩu" />
				</div>
				<div class="col-md-5">
					<label for="exampleFormControlInput1" class="form-label">Phone
						Number</label>
					<form:input path="phone" type="text" class="form-control"
						id="exampleFormControlInput1"
						placeholder="Vui lòng nhập số điện thoại" />
				</div>
				<div class="col-md-6">
					<label for="exampleFormControlInput1" class="form-label">IsActive</label>
					<form:select path="isActive" itemValue="isActive"
						class="form-select form-select-lg mb-6"
						aria-label=".form-select-lg example">
						<form:option value="True">True</form:option>
						<form:option value="False">False</form:option>
					</form:select>
				</div>
				<div class="col-md-6">
					<label for="exampleFormControlInput1" class="form-label">IsAdmin</label>
					<form:select path="isAdmin" itemValue="isAdmin"
						class="form-select form-select-lg mb-6"
						aria-label=".form-select-lg example">
						<form:option value="False">False</form:option>
						<form:option value="True">True</form:option>
					</form:select>
				</div>
				<div class="col-md-12">
					<button name="${btnStatus}" class="btn btn-primary">Save</button>
					<a name="btnReset" class="btn btn-primary"
						href="Customer/index.htm" role="button">Reset</a>
				</div>
			</form:form>
		</div>

		<div class="bg-light p-5 rounded">
			<jsp:useBean id="pagedListHolder" scope="request"
				type="org.springframework.beans.support.PagedListHolder" />
			<c:url value="/Customer/index.htm" var="pagedLink">
				<c:param name="p" value="~" />
			</c:url>
			<div class="d-flex flex-row justify-content-between">
				<div>
					<span id="result1"></span>

					<form class="d-inline-flex">
						<input name="searchInput" id="searchInput"
							class="form-control me-2" type="search" placeholder="Search"
							aria-label="Search">

						<button name="btnsearch" id="searchCustomer"
							class="btn btn-outline-success" type="submit">Search</button>
					</form>
				</div>
				<div>
					<tg:paging pagedListHolder="${pagedListHolder}"
						pagedLink="${pagedLink}" />
				</div>
			</div>

			<table class="table">
				<thead>
					<tr>
						<th scope="col">Name</th>
						<th scope="col">Email</th>
						<th scope="col">Password</th>
						<th scope="col">Phone</th>
						<th scope="col">IsActive</th>
						<th scope="col">IsAdmin</th>
						<th scope="col">Chỉnh sửa</th>
						<th scope="col">Xóa</th>
					</tr>
				</thead>
				<tbody id="table_customers">
					<c:forEach var="pd" items="${pagedListHolder.pageList}">
						<tr>
							<td>${pd.name}</td>
							<td>${pd.email}</td>
							<td>${pd.password}</td>
							<td>${pd.phone}</td>
							<td>${pd.isActive}</td>
							<td>${pd.isAdmin}</td>
							<td><a href="Customer/index/${pd.id}.htm?linkEdit"> <img
									width="50" height="40"
									src="<c:url value="/resources/images/edit.png"/>">
							</a></td>
							</td>
							<td><a name="btnDelete"
								href="Customer/index/${pd.id}.htm?linkDelete" role="button">
									<img width="30" height="30"
									src="<c:url value="/resources/images/delete.png"/>">
							</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<tg:paging pagedListHolder="${pagedListHolder}"
				pagedLink="${pagedLink}" />
		</div>



	</main>

	<script
		src="<c:url value='/resources/assets/dist/js/bootstrap.bundle.min.js' />"></script>
	<script>
		function searchValue() {
			//event.preventDefault();
			var searchCustomername = $("#searchInput").val();
			alert(searchCustomername)
		}
	</script>
</body>
</html>
