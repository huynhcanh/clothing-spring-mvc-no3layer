<%@ page pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp" %> 
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Detal Product | HDC Store</title>
    <%@ include file="/common/head.jsp" %>
</head>

<body>
    <div class="container">
        <!-- menu -->
		<%@ include file="/common/menu/menu.jsp"%>
    </div>

    <!-- ---------- single Products detail ----------- -->

    <div class="small-container single-product">
        <div class="row">
            <div class="col-2">
                <img src="images/${product.image}" width="100%" id="productImg">
                <c:if test="${check != 0}">
                	<div class="small-img-row">
	                	<c:forEach var="smallphoto" items="${product.smallphotos}" varStatus="status">
	                		<div class="small-img-rol">
		                        <img src="images/${smallphoto.photo}" width="100%" class="small-img">
		                    </div>
	               		</c:forEach>
                	</div>
                </c:if> 
            </div>
            
            <div class="col-2">
                <p><b>Categories:</b> ${product.categories.name }</p>
                <h1>${product.name}</h1>
                <c:if test="${product.discount>0}">
					 <p >Sale: ${ product.discount}%</p>
					 <h4 style="text-decoration:line-through;">${product.salePrice }</h4>
				</c:if>
				<h4>${product.salePrice * (100-product.discount)/100}</h4>
                
                
                <form:form action="cart/index/${id}/${idproduct}.htm" modelAttribute="cart" method = "post">
					<div>	
						<label>Size</label>
						<form:select path="productsize.size.id" items="${sizes}" itemValue="id" itemLabel ="name"/>					
					</div>
					<form:input style="width:70px" path="quantity" type="number" value="1"/>
					${message}
					<button class="btn">Add To Card</button>
				</form:form>
				
                    <h3>Product Detail
                        <i class="fa fa-indent"></i>
                    </h3>
                    <br>
                    <p>${product.description }</p>
            </div>
        </div>
    </div>

    <!-- ----- title------------- -->
    <!-- <div class="small-container">
        <div class="row row2" style="justify-content: space-around;">
            <h2>Relate Products</h2>
            <p>View More</p>
        </div>
    </div> -->

<!-- ---------------Products----------------- -->
    <div class="small-container">

      
    </div>
    
    <!-- ------------footer----------- -->
	<%@ include file="/common/footer.jsp" %>
	

<!-- ------------------- JS for  product gallery------------------------         -->
        <script>
            var ProductImg = document.getElementById("productImg");
            var SmallImg = document.getElementsByClassName("small-img");

            SmallImg[0].onclick = function()
            {
                ProductImg.src = SmallImg[0].src;
            }
            SmallImg[1].onclick = function()
            {
                ProductImg.src = SmallImg[1].src;
            }
            SmallImg[2].onclick = function()
            {
                ProductImg.src = SmallImg[2].src;
            }
            SmallImg[3].onclick = function()
            {
                ProductImg.src = SmallImg[3].src;
            }

        </script>
</body>

</html>