<%@ page pageEncoding="utf-8"%> 
<%@ include file="/common/taglib.jsp" %> 
<!DOCTYPE html> 
<html> 
<head> 
	<title>Order Success | HDC Store</title>
	<%@ include file="/common/head.jsp" %>
	<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"> -->
 </head> 
<body>

	<div class="container">
         <!-- menu -->
		<%@ include file="/common/menu/menu.jsp"%>
    </div>
    
    
    <div style="width: 900px; margin: 50px auto; color: green">
    	<h1 style="font-size: 30px; font-weight: 400;">Successful order! Please prepare the amount in advance: 
    		${totalorderamount} in the next 2-4 days</h1>
    	<a style="cursor:pointer;" class="btn" href="products/index/${id}/0/0/.htm">Continue To Buy</a>
    </div>
	
	
	<!-- ------------footer----------- -->
	<%@ include file="/common/footer.jsp" %>
</body> 
</html> 