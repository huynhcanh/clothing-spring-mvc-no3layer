<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<button formaction="admin/order/create.htm" ${empty product.id ? '' : 'disabled'} class="btn btn-primary">
	<span class="glyphicon glyphicon-plus"></span> Create
</button>
<button formaction="admin/order/update.htm" ${empty product.id ? 'disabled' : ''} class="btn btn-success">
	<span class="glyphicon glyphicon-save"></span> Update
</button>
<button formaction="admin/ordert/delete/${product.id}.htm" ${empty product.id ? 'disabled' : ''} class="btn btn-danger">
	<span class="glyphicon glyphicon-trash"></span> Delete
</button>
<a href="admin/order/index.htm" class="btn btn-info">
	<span class="glyphicon glyphicon-refresh"></span> Reset
</a>