<%@ page pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp" %>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<table class="table table-hover">
	<thead>
		<tr>
			<th>Tên sản phẩm</th>
			<th>Giá</th>
			<th>Số lượng</th>
			<th>Giảm giá</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="item" items="${orderDetails}">
		<tr>
			<td>${item.productsize.product.name}</td>
			<td>$<f:formatNumber value="${item.productsize.product.salePrice}" pattern="#,###.00"/></td>
			<td>${item.quantity}</td>
			<td>${item.productsize.product.discount}%</td>
		</tr>
	</c:forEach>
	</tbody>
</table>