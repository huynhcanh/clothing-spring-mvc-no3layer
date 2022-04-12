<%@ page pageEncoding="utf-8"%> 
<%@ include file="/common/taglib.jsp" %> 
<!DOCTYPE html> 
<html> 
<head> 
	<title>Order | HDC Store</title>
	<%@ include file="/common/head.jsp" %>
	<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"> -->
 </head> 
<body>

	<div class="container">
         <!-- menu -->
		<%@ include file="/common/menu/menu.jsp"%>
    </div>
    
    
    <div style="width: 900px; margin: 50px auto">
    	<p style="color:cornflowerblue; font-weight: bold;font-style: italic;">
    		Please enter your delivery address and double-check all the information below before submitting your order</p>

		<br>
		<div style="width: 400px; margin:auto">
			<h1 style="text-align: center;">Your Order Infomation</h1><br>
			<div>
				<p><b>Email:</b> &ensp; ${customer.email}</p><br>
				<p><b>Name:</b> &ensp; ${customer.name}</p><br>
				<p><b>Phone:</b> &ensp; ${customer.phone}</p><br>
				<p><b>Total order amount:</b> &ensp; ${totalorderamount}</p><br>
			</div>
			<form action="order/confirm-order/${id}.htm" method="post">
				<p><b>Enter Your order address:</b></p>
				${messageAddress}
				<input name="address" type="text"></label>
				<button class="btn">Comfirm Order</button>
			<form>
		</div>
		
    </div>
	
	
	<!-- ------------footer----------- -->
	<%@ include file="/common/footer.jsp" %>
</body> 
</html> 