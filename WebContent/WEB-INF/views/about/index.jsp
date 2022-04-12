<%@ page pageEncoding="utf-8"%> 
<%@ include file="/common/taglib.jsp" %> 
<!DOCTYPE html> 
<html> 
<head> 
	<title>About | HDC Store</title>
	<%@ include file="/common/head.jsp" %>
	<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"> -->
 </head> 
<body>

	<div class="container">
         <!-- menu -->
		<%@ include file="/common/menu/menu.jsp"%>
    </div>
    
    
    <div style="margin:50px 0 100px 350px; width:380px;">
    	<div>
    		${message}
	    	<h1>Information persional</h1><br>
	    	<form:form action="about/update/${id}.htm"  method="post" modelAttribute="updateinfo">
				<div>
					<p>Email: &ensp; ${email}</p>
				</div>
				<div>
					<br><div>Name:</div>
					<form:input path="name"  type="text"/>
					<form:errors path="name" style="color:red;"/>
				</div>
				<div>
					<div>Phone:</div>
					<form:input path="phone"  type="text"/>
					<form:errors path="phone" style="color:red;"/>
				</div>
				<div style="margin-top:10px">
					<button style="width: 100%; height: 25px;">Update</button>
				</div>
				
			</form:form>
    	</div>
    	
		<div style="text-align: right;margin-top: 10px;">
				<a href="about/change-password/${id}.htm">Change password</a>
		</div>
    </div>
	
	
	<!-- ------------footer----------- -->
	<%@ include file="/common/footer.jsp" %>
</body> 
</html> 