<%@ page pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html> 
<html> 
<head>
    <title>Account Register | HDC Store</title>
    <%@ include file="/common/head.jsp" %>

    
</head> 

<body> 
   
    <!-- ------------Account-page------------------- -->
    <div class="account-page">
        <div class="container">
            <div class="row">
                <div class="col-2">
                    <img src="images/account.jpg" width="100%">
                </div>

                <div class="col-2">
                    <div class="form-container" style="height:580px;">
                    	
                        <div class="form-btn">
                            <span style="font-size: 40px;">Register</span>
                        </div>
                        <div>
                        	${message}
	                       <form:form action="account/register.htm" method="post" modelAttribute="register">
                        
	                        	<form:input path="email" type="email" placeholder="Email"/>
	                        	<form:errors path="email" style="color:red;"/>
	                        	
	                        	<form:input path="name" type="text" placeholder="Name"/>
	                        	<form:errors path="name" style="color:red;"/>
	                        	
	                        	<form:input path="phone" type="phone" placeholder="Phone"/>
	                        	<form:errors path="phone" style="color:red;"/>
	                        	
	                            <form:input path="password" type="password" placeholder="Password"/>
	                            <form:errors path="password" style="color:red;"/>
	                            
	                            <form:input path="confirmpassword" type="password" placeholder="Confirm password"/>
	                            <form:errors path="confirmpassword" style="color:red;"/>
	                            
	                            <button type="submit" class="btn">Register</button>
	                        </form:form>
                        </div>
						
                    </div>
                </div>
            </div>
        </div>
    </div>
   
    <!-- ------------footer----------- -->
	<%@ include file="/common/footer.jsp" %>
    
     
</body>
</html>