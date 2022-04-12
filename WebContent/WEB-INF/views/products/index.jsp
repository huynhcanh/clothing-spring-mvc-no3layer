<%@ page pageEncoding="utf-8"%> 
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Products | HDC Store</title>
    <%@ include file="/common/head.jsp" %>
</head>

<body>
    <div class="container">
        <!-- menu -->
		<%@ include file="/common/menu/menu.jsp"%>
    </div>


	<%-- Khởi tạo bean --%>
	<jsp:useBean id="pagedListHolder" scope="request" type="org.springframework.beans.support.PagedListHolder" />
	<c:url value="products/index/${id}/${categoryid}/${sortbypriceid}/${searchtext}.htm" var="pagedLink"> <c:param name="p" value="~" /> </c:url>
	
	
    <div class="small-container">
		
        <div class="row row-2">
            <h2>All Products</h2>
            
			<div>
            	<lable><b>Filter By Categories</b></label>
            	<form:form action="#" modelAttribute="category" method="post" style="display:inline-block">
					<form:select onchange="changeCategory(this)" path="id" items="${categories}" itemValue="id" itemLabel="name" />
				</form:form>
            </div>
            
            <div>
            	<lable><b>Sort By Price</b></label>
            	<form:form action="#" modelAttribute="sortbyprice" method="post" style="display:inline-block">
					<form:select onchange="changeSortByPrice(this)" path="id" items="${sortbyprices}" itemValue="id" itemLabel="name" />
				</form:form>
            </div>
            
            <div>
            	<lable><b>Search Product</b></label>
            	<form action="products/index/${id}/${categoryid}/${sortbypriceid}.htm" method="post" style="display:inline-block">
					<input style="width: 140px;" id="search" value="${searchtext}" name="searchtext"
						type="text" placeholder="Product name">
					<button style="height: 30px;">Search</button>
				</form>
            </div>
		</div>
        
		<div class="row" style="justify-content: flex-start;">
	        <c:forEach var="pd" items="${pagedListHolder.pageList}" varStatus="status">
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
		
		<div style="margin-bottom:80px;">
			<tg:paging pagedListHolder="${pagedListHolder}" pagedLink="${pagedLink}" />
		</div>
	      
    </div>
    
    
     <!-- ------------footer----------- -->
	<%@ include file="/common/footer.jsp" %>

	<script type="text/javascript">
		function changeSortByPrice(obj) {
			let value = obj.value;
			let link = document.createElement('a');
			let input = document.getElementById("search");
			console.log(input.value);
		    link.href = "products/index/" + ${id} + "/" + ${categoryid} + "/" + value  + "/" + input.value + ".htm";
			link.click();
		}
		function changeCategory(obj) {
			let value = obj.value;
			let link = document.createElement('a');
			let input = document.getElementById("search");
		    link.href = "products/index/" + ${id} + "/" + value + "/" + ${sortbypriceid} + "/" + input.value + ".htm";
			link.click();
		}
	</script>
</body>

</html>