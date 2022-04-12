<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<base href="${pageContext.servletContext.contextPath}/">
<div class="panel panel-default">
	<div class="panel-heading">
		<form action="admin/product/index#list">
			<div class="input-group">
				<label class="input-group-addon">Category: </label> <select
					name="category_id" class="form-control"
					onchange="this.form.submit()">
					<c:forEach var="c" items="${cates}">
						<option value="${c.id}"
							${product.categories.id == c.id ? 'selected' : ''}>${c.name}</option>
					</c:forEach>
				</select>
			</div>
		</form>
	</div>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Unit Price</th>
				<th>Sale Price</th>
				<th>Discount</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
				<tr>
					<td>${item.id}</td>
					<td>${item.name}</td>
					<td>${item.unitPrice}</td>
					<td>${item.salePrice}</td>
					<td>${item.discount}%</td>
					<td class="text-center"><a
						href="admin/product/edit/${item.id}.htm" class="btn btn-sm btn-info">
							<span class="glyphicon glyphicon-edit"></span>
					</a> <a href="admin/product/delete/${item.id}.htm"
						class="btn btn-sm btn-danger"> <span
							class="glyphicon glyphicon-trash"></span>
					</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>