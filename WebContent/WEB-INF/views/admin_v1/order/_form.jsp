<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="/common/taglib.jsp" %>
<script src="http://js.nicedit.com/nicEdit-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<form:form modelAttribute="order" action="${prefix}/index"
	enctype="multipart/form-data">
	<div class="panel panel-default">
		<div class="panel-body">
			<div class="row">
				<div class="form-group col-sm-4">
					<label>Mã</label>
					<form:input path="id" class="form-control" readonly="true"
						placeholder="Auto Number" />
				</div>
				<div class="form-group col-sm-4">
					<label>Khách hàng</label>
					<form:input path="customers.id" class="form-control" />
				</div>
				<div class="form-group col-sm-4">
					<label>Địa chỉ vận chuyển</label>
					<form:input path="adddress" class="form-control" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-4">
					<label>Ngày đặt</label>
					<form:input path="orderDate" class="form-control datepicker" />
				</div>
				<div class="form-group col-sm-4">
					<label>Tổng cộng</label>
					<form:input path="totalMoney" class="form-control" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-12">
					<label>Chi tiết đơn hàng</label>
					<jsp:include page="_details.jsp" />
				</div>
			</div>
		</div>
		<div class="panel-footer text-right">
			<div class="pull-left text-danger">${message}${param.message}</div>
<%-- 			<jsp:include page="_btn-crud.jsp" /> --%>
		</div>
	</div>
</form:form>