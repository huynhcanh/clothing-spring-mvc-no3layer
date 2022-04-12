<%@ page pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp" %> 
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Detail Order | HDC Store</title>
	<%@ include file="/common/head.jsp" %>
</head>

<body>
    <div class="container">
         <!-- menu -->
		<%@ include file="/common/menu/menu.jsp"%>
    </div>


	
	
	
	<!-- -----------------order item details------------------- -->
    <div class="small-container cart-page">
        <table>
            <tr>
                <th>Product</th>
                <th>Size & Quantity</th>
                <th>Subtotal</th>
            </tr>
            <c:forEach var="orderdetail" items="${orderdetails}" varStatus="status">
				<tr>
	                <td>
	                    <div class="cart-info">
	                        <img src="images/${orderdetail.productsize.product.image }">
	                        <div>
	                            <p>${orderdetail.productsize.product.name }</p>
	                            <c:if test="${orderdetail.productsize.product.discount>0}">
							        	<small>Sale: ${orderdetail.productsize.product.discount}%</small><br>
							        	<small style="text-decoration:line-through;">${ orderdetail.productsize.product.salePrice}</small><br>
							    </c:if>
							    <small>${orderdetail.productsize.product.salePrice * (100-orderdetail.productsize.product.discount)/100}</small>
	                        </div>
	                    </div>
	                </td>
	                <td>
	                	<small>Size: ${orderdetail.productsize.size.name}</small><br>
	                	<small>Quantity: ${orderdetail.quantity}</small><br>
	                </td>
	                <td  style="text-align: center;">${orderdetail.totalMoney}</td>
	            </tr>		
			</c:forEach>
        </table>
		<div class="total-price">
	            <table>               
	                <tr>
	                    <td>Total</td>
	                    <td>${total}</td>
	                </tr>
	            </table>
	    </div>
    </div>


    <!-- ------------footer----------- -->
	<%@ include file="/common/footer.jsp" %>
        
</body>

</html>