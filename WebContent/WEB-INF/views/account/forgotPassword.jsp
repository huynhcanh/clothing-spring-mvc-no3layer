<%@ page pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html> 
<html> 
<head>
    <title>Forgot Password | Account | HDC Store</title>
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
                    	
                    	<div class="form-btn" style="margin-top:25px;">
                            <span style="font-size: 30px;">Forgot Password</span>
                        </div>
						${message}
                        <form action="account/forgetPassword.htm" method="post">
                        	<input name="email" type="email" placeholder="Email"/>
                        	${messageEmail}
                        	<button type="submit" class="btn">Submit</button>
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