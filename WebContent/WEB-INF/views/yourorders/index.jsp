<%@ page pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp" %> 
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Your Orders | HDC Store</title>
	<%@ include file="/common/head.jsp" %>
</head>

<body>
    <div class="container">
         <!-- menu -->
		<%@ include file="/common/menu/menu.jsp"%>
    </div>


	<!-- -----------------cart item details------------------- -->
    <div class="small-container cart-page">
        <table>
            <tr>
				<th>STT</th>
				<th>Your order</th>
				<th>Total</th>
				<th>Time</th>
			</tr>
            <c:forEach var="order" items="${orders}" varStatus="status">
				<tr>
	                <td>
	                    ${status.index + 1}
	                </td>
	                <td>
	                	<a href="yourorders/detail/${id }/${order.id}.htm"><img src="images/account.jpg" style="width:220px"/></a>
	                </td>
	                <td>
	                	${order.totalMoney}
	                </td>
	                <td style="text-align: center;">${order.orderDate}</td>
	            </tr>		
			</c:forEach>
        </table>
		
    </div>


    <!-- ------------footer----------- -->
	<%@ include file="/common/footer.jsp" %>
        
</body>

</html>