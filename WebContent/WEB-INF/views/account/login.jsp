<%@ page pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html> 
<html> 
<head>
    <title>Account Log In | HDC Store</title>
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
                    <div class="form-container">
                    	
                        <div class="form-btn">
                            <span style="font-size: 40px;">Login</span>
                        </div>
                        <div>
                        	${message}
	                        <form:form action="account/index.htm" method="post" modelAttribute="login">
	                            <form:input path="email" type="text" placeholder="Email"/>
	                            <form:errors path="email" style="color:red;"/>
	                            
	                            <form:input path="password" type="password" placeholder="Password"/>
	                            <form:errors path="password" style="color:red;"/>
	                            
	                            <button type="submit" class="btn">Login</button>
	                            
	                            <div class="row">
	                            	<div class="col-2"><a href="account/register.htm">Register</a></div>
	                            	<div class="col-2"><a href="account/forgetPassword.htm">Forgot password</a></div>
	                            </div>
	                            
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