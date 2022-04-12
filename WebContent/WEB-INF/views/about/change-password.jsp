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
    	${message }
    	<h1>Change Password</h1><br>
    	<form:form action="about/change-password/${id}.htm" method="post" modelAttribute="changepassword">
    		<div>Old password:</div>
    		<form:input path="oldpassword" type="password"/>
    		<form:errors path="oldpassword" style="color:red;"/>
    		
			<div>New password: </div>
			<form:input path="newpassword"  type="password"/>
			<form:errors path="newpassword" style="color:red;"/>
			
			<div> Confirm new password:</div>
			<form:input path="confirmpassword"  type="password"/>
			<form:errors path="confirmpassword" style="color:red;"/>
			
			<div  style="margin-top:10px"><button  style="width: 100%; height: 25px;">Change password</button></div>
    	</form:form> 
    </div>
	
	
	<!-- ------------footer----------- -->
	<%@ include file="/common/footer.jsp" %>
</body> 
</html> 