<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html>
<style>
p {
  border: 2px solid black;
  outline: #4CAF50 solid 10px;
  margin: auto;  
  padding: 20px;
  text-align: center;
}
<%@ include file="/WEB-INF/views/admin_v1/report/RP.css" %>
</style>
<head>
	<meta charset="utf-8">
	<title>Thống kê</title>
	<%@ include file="/WEB-INF/views/admin_v1/layout/head.jsp"%>
</head>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<body>
	<div class="container">
	<nav class="row">
		<%@ include file="/WEB-INF/views/admin_v1/layout/menu.jsp"%>
	</nav>
	<section>
		<div class="container">
			<div class="card">
				<div class="content">
          <div class="imgBx">
						<img src="images/goods.png">
					</div>
					<div class="contentBx">
						<h3><span style="color: black">TỔNG SỐ SẢN PHẨM ĐƯỢC BÁN RA THỊ TRƯỜNG</span></h3>
					</div>
				</div>
				<ul class="sci">
					<li>
            <span style="font-size: 50px">
              <span style="color: black">${count}</span>
            </span>
					</li>
				</ul>
			</div>
			<div class="card">
				<div class="content">
					<div class="imgBx">
						<img src="images/dollar.png">
					</div>
					<div class="contentBx">
						<h3><span style="color: black">TỔNG LỢI NHUẬN<br>THU ĐƯỢC</span></h3>
					</div>
				</div>
				<ul class="sci">
					<li>
            <span style="font-size: 50px">
              <span style="color: black">${money}</span>
            </span>
					</li>
				</ul>
			</div>
		</div>
	</section>
	</div>
</body>
</html>