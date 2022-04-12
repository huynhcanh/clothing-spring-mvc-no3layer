<%@ page pageEncoding="utf-8"%>
<base href="${pageContext.servletContext.contextPath}/">

<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<button class="navbar-toggle" data-toggle="collapse"
				data-target="#menu">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="admin/home/index.htm"> Trang chủ</a>
		</div>
		<div class="collapse navbar-collapse" id="menu">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <span
						class="glyphicon glyphicon-briefcase"></span> Quản lý <span
						class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="admin/product/index.htm">Sản phẩm</a></li>
						<li><a href="admin/category/index.htm">Loại</a></li>
						<li><a href="Customer/index.htm">Khách hàng</a></li>
						<li><a href="admin/order/index.htm">Đơn hàng</a></li>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <span
						class="glyphicon glyphicon-stats"></span> Báo cáo <span
						class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="admin/report/index.htm">Thống kê</a></li>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <span
						class="glyphicon glyphicon-lock"></span>Security<span
						class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="account/index.htm">Sign Out</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</nav>