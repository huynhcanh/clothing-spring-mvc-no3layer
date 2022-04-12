<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<base href="${pageContext.servletContext.contextPath}/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<div class="panel panel-default">
	<div class="panel-heading">
	<h4 class="panel-title"> DANH SÁCH LOẠI SẢN PHẨM</h4>
	</div>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
				<tr>
					<td>${item.id}</td>
					<td>${item.name}</td>
					<td class="text-center"><a
						href="admin/category/edit/${item.id}.htm" class="btn btn-sm btn-info">
							<span class="glyphicon glyphicon-edit"></span>
					</a> <a href="admin/category/delete/${item.id}.htm"
						class="btn btn-sm btn-danger"> <span
							class="glyphicon glyphicon-trash"></span>
					</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>