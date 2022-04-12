<%@ page pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp" %> 
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Cart | HDC Store</title>
	<%@ include file="/common/head.jsp" %>
</head>

<body>
    <div class="container">
         <!-- menu -->
		<%@ include file="/common/menu/menu.jsp"%>
    </div>


	<!-- -----------------form edit cart ------------------- -->
	<c:if test="${statusEdit}">
		<form:form action="cart/product/edit/${id}/${cart.id}.htm" modelAttribute="cart" method = "post">
			<div class="small-container cart-page">
				<table>
					<tr>
						<th>Product</th>
						<th>Size & Quantity</th>
						<th>Confirm</th>
					</tr>
					<tr>
						<td>
							<div class="cart-info">
								<img src="images/${cart.productsize.product.image }">
								<div>
		                            <p>${cart.productsize.product.name }</p>
		                            <c:if test="${cart.productsize.product.discount>0}">
							        	<small>Sale: ${cart.productsize.product.discount}%</small><br>
							        	<small style="text-decoration:line-through;">${ cart.productsize.product.salePrice}</small><br>
							        </c:if>
							        <small>${cart.productsize.product.salePrice * (100-cart.productsize.product.discount)/100}</small>
		                        </div>
							</div>
						</td>
						<td>
							<div>	
								<label>Size</label>
								<form:select path="productsize.size.id" items="${sizes}" itemValue="id" itemLabel ="name"/>					
							</div>
							<div>	
								<label>Quantity:</label>
								<form:input type="number" path="quantity" style="width: 60px;"/>				
							</div>
						</td>
						<td><button class="btn" style="width: 80%;">Edit</button></td>
						
					</tr>
				</table>
			</div>
		</form:form>
	</c:if>
	
	
	<!-- -----------------cart item details------------------- -->
    <div class="small-container cart-page">
        <table>
            <tr>
                <th>Product</th>
                <th>Size & Quantity</th>
                <th>Subtotal</th>
            </tr>
            <c:forEach var="cart" items="${carts}" varStatus="status">
				<tr>
	                <td>
	                    <div class="cart-info">
	                        <img src="images/${cart.productsize.product.image }">
	                        <div>
	                            <p>${cart.productsize.product.name }</p>
	                            <c:if test="${cart.productsize.product.discount>0}">
							        	<small>Sale: ${cart.productsize.product.discount}%</small><br>
							        	<small style="text-decoration:line-through;">${ cart.productsize.product.salePrice}</small><br>
							    </c:if>
							    <small>${cart.productsize.product.salePrice * (100-cart.productsize.product.discount)/100}</small>
	                            
	                            
	                            <br>
	                            <a style="background: cornflowerblue;color: white; cursor: pointer;"
	                            	onclick="document.getElementsByClassName('product')
	                            	[${status.index}].style.display = 'block'"> Remove</a>
	                            <div class="product" style="display:none;">
	                            	<a href="cart/product/remove/${id}/${cart.id}.htm">Confirm</a>
	                            	<a onclick="document.getElementsByClassName('product')
	                            	[${status.index}].style.display = 'none'" style="cursor: pointer;">Cancel</a>
	                            </div>
	                        </div>
	                    </div>
	                </td>
	                <td>
	                	<small>Size: ${cart.productsize.size.name}</small><br>
	                	<small>Quantity: ${cart.quantity}</small><br>
	                	
	                	<a style="height: 30px; background: cornflowerblue; color: white;cursor: pointer;"
	                	   href="cart/product/showFormEdit/${id}/${cart.id}.htm"
	                	> edit</a>
	                </td>
	                <td  style="text-align: center;">${cart.totalMoney}</td>
	            </tr>		
			</c:forEach>
        </table>
		
		<c:if test="${total == 0}">
			<br><h3 style="text-align:center;">Your cart is empty</h3>
		</c:if>
		<c:if test="${total != 0}">
			<div class="total-price">
	            <table>               
	                <tr>
	                    <td>Total</td>
	                    <td>${total}</td>
	                </tr>
	            </table>
	        </div>
	        
			
			<div class="orderup">
				<a href="order/index/${id}.htm" class="btn">Order Up &#8594;</a>
			</div>
			
		</c:if>
        

    </div>


    <!-- ------------footer----------- -->
	<%@ include file="/common/footer.jsp" %>
        
</body>

</html>