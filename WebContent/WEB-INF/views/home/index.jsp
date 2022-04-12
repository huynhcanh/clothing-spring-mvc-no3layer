<%@ page pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Home | HDC Store</title>
    <%@ include file="/common/head.jsp" %>
</head>

<body>
	
		
	<div class="container">
        <!-- menu -->
		<%@ include file="/common/menu/menu.jsp"%>
    </div>
    
	<div class="header">
		<div class="container">
			<div class="row">
				<div class="col-2">
					<h1><!--  -->
						HDC  Store A New Style!
					</h1>
					<p>
						<i>Don’t cry because it’s over, smile because it happened</i>
					</p>
					<a href="products/index/${id}/0/0/.htm" class="btn">Shop now &#8594;</a>
				</div>
				<div class="col-2">
					<img src="images/account.jpg">
				</div>
			</div>
		</div>
	</div>

    <!-- ------------- featured categorries ---------------- -->
    <div class="categories">
        <div class="small-container">
        	 <h2 class="title">Categories Products</h2>
            <div class="row">
                <div class="col-3">
                    <img src="images/category-1.jpg">
                </div>
                <div class="col-3">
                    <img src="images/category-2.jpg">
                </div>
                <div class="col-3">
                    <img src="images/category-3.jpg">
                </div>

            </div>
        </div>

    </div>
    <!-- ------------- Latest products ---------------- -->
    <div class="small-container">
        
        <h2 class="title">Latest Products</h2>
        <div class="row" style="justify-content: flex-start;">
	        <c:forEach var="pd" items="${products}"  begin="${products.size()-4 }" >
					<div class="col-4">
				     	<a href="products/detail/${id}/${pd.id}.htm" >
					     	 <img src="images/${pd.image}">
					        <h4>${pd.name}</h4>
					         <div class="rating">
					        	<i class="fa fa-star"></i>
					            <i class="fa fa-star"></i>
					            <i class="fa fa-star"></i>
					            <i class="fa fa-star-half-o"></i>
					            <i class="fa fa-star-o"></i>
					        </div>
					        <c:if test="${pd.discount>0}">
					        	<p style="background: cornflowerblue; color: white;">Sale: ${ pd.discount}%</p>
					        	<p style="text-decoration:line-through;">${ pd.salePrice}</p>
					        </c:if>
					        <p>${pd.salePrice * (100-pd.discount)/100}</p>
				        </a>
					</div>
			</c:forEach>
		</div>
    </div>
    
    <!-- ------------ testimonial -------------- -->
    <div class="testimonial">
    	
        <div class="small-container">
        	<h2 class="title">Testimonial</h2>
            <div class="row">
                <div class="col-3">
                    <i class="fa fa-qoute-lef"></i>
                    <p>Abilities or he perfectly pretended so strangers be exquisite. Oh to another chamber pleased
                        imagine do in. Went me rank at last loud shot an draw. Excellent so to no sincerity smallness.
                        Removal request delight if on he we</p>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-o"></i>
                    </div>
                    <img src="images/user-1.png">
                    <h3>Đạt 1 Phích</h3>
                </div>
                <div class="col-3">
                    <i class="fa fa-qoute-lef"></i>
                    <p>Abilities or he perfectly pretended so strangers be exquisite. Oh to another chamber pleased
                        imagine do in. Went me rank at last loud shot an draw. Excellent so to no sincerity smallness.
                        Removal request delight if on he we</p>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-o"></i>
                    </div>
                    <img src="images/user-2.png">
                    <h3>An Nguyen</h3>
                </div>
                <div class="col-3">
                    <i class="fa fa-qoute-lef"></i>
                    <p>Abilities or he perfectly pretended so strangers be exquisite. Oh to another chamber pleased
                        imagine do in. Went me rank at last loud shot an draw. Excellent so to no sincerity smallness.
                        Removal request delight if on he we</p>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-o"></i>
                    </div>
                    <img src="images/user-3.png">
                    <h3>Quang Hoang</h3>
                </div>
            </div>
        </div>
    </div>
    <!-- ------------------- brands --------------------- -->
    <div class="brands">
        <div class="small-container">
        	<h2 class="title">Brands</h2>
            <div class="row">
                <div class="col-5">
                    <img src="images/logo-godrej.png">
                </div>
                <div class="col-5">
                    <img src="images/logo-oppo.png">
                </div>
                <div class="col-5">
                    <img src="images/logo-coca-cola.png">
                </div>
                <div class="col-5">
                    <img src="images/logo-paypal.png">
                </div>
                <div class="col-5">
                    <img src="images/logo-philips.png">
                </div>
            </div>
        </div>
    </div>
    
    
    
    
    
    <!-- ------------footer----------- -->
	<%@ include file="/common/footer.jsp" %>

    
</body>
</html>