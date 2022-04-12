<%@ page pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html> 
<html> 
<head>
    <title>Sent Code - Forgot Password | Account | HDC Store</title>
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
                            <span style="font-size: 40px;">Forgot Password</span>
                        </div>
                    	
						
						<div style="margin-top:30px;">
                            ${message}
                        </div>
                        <form action="account/forgotPassword/confirmCode/${id}.htm" method="post">
                        	<input name="code" type="text" placeholder="Enter your code"/>
                        	${messageCode}
                        	<button type="submit" class="btn">Confirm</button>
                        </form>
						
                    </div>
                </div>
            </div>
        </div>
    </div>
   
    <!-- ------------footer----------- -->
	<%@ include file="/common/footer.jsp" %>

</body>
</html>