<%@ page pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Contact | HDC Store</title>
    <%@ include file="/common/head.jsp" %>
</head>

<body>
	
	<div class="container">
        <!-- menu -->
		<%@ include file="/common/menu/menu.jsp"%>
    </div>
    	
	<%-- <div style="margin-bottom: 40px;">
		<div  style="text-align:center;margin-bottom:30px;">
			<h1 class="h1-responsive font-weight-bold text-center my-4">Contact us</h1><br>
			<p class="text-center w-responsive mx-auto mb-5">Do you have any
				questions? Please do not hesitate to contact us directly. Our team
				will come back to you within a matter of hours to help you.</p>
		</div>
		<div class="row" style="justify-content: space-around;">

			<div>
				<h2 style="text-align:center;">Your Contact</h2><br>
				<form action="contact/index/${id}.htm" method="POST">
					<div>Your name: <b><i>${name}</i></b></div>
					 
					<br>
					<div>
						<div>Content:</div>
						<textarea rows="9" cols="60"></textarea>
					</div>
					
					<button class="btn btn-primary">Send</button>
				</form>
			</div>
			<div>
				<ul class="list-unstyled mb-0">
					<li><img alt="" src="images/map-logo.png" height="50">
						<p>97 Man Thien Street - Hiep Phu Ward - Ho Chi Minh City</p></li>

					<li><img alt="" src="images/phone-logo.png" height="50">
						<p>+84564355691</p></li>

					<li><img alt="" src="images/gmail-logo.png" height="50">
						<p>hdcstore@gmail.com</p></li>
				</ul>
			</div>

		</div> --%>
		
		<div style="margin-bottom: 40px;">
			<div  style="text-align:center;margin-bottom:30px;">
				<h1 class="h1-responsive font-weight-bold text-center my-4">Contact us</h1><br>
				<p class="text-center w-responsive mx-auto mb-5">Do you have any
					questions? Please do not hesitate to contact us directly. Our team
					will come back to you within a matter of hours to help you.</p>
			</div>
			<div class="row" style="justify-content: space-around;">
	
				<div>
					<ul class="list-unstyled mb-0">
						<li><img alt="" src="images/map-logo.png" height="50">
							<p>97 Man Thien Street - Hiep Phu Ward - Ho Chi Minh City</p></li>
	
						<li><img alt="" src="images/phone-logo.png" height="50">
							<p>+84564355691</p></li>
	
						<li><img alt="" src="images/gmail-logo.png" height="50">
							<p>hdcstore@gmail.com</p></li>
					</ul>
				</div>
	
			</div>
		</div>
  
    <!-- ------------footer----------- -->
	<%@ include file="/common/footer.jsp" %>
	

    
</body>
</html>