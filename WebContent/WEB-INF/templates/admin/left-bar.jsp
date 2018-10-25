<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Nav-bar -->
<ul class="nav">
	<!-- Main menu -->
	<li class="current"><a
		href="${pageContext.request.contextPath}/admin"><i
			class="glyphicon glyphicon-home"></i> Trang chủ</a></li>
	<li><a href="${pageContext.request.contextPath}/admin/cat/index"><i
			class="glyphicon glyphicon-list"></i>Quản Lý Danh mục</a></li>
	<li><a href="${pageContext.request.contextPath}/admin/land/index"><i
			class="glyphicon glyphicon-book"></i>Quản Lý Thông Báo</a></li>
	<li><a href="${pageContext.request.contextPath}/admin/user/index"><i
			class="glyphicon glyphicon-plus"></i>Quản Lý Người dùng</a></li>
	<li><a href="${pageContext.request.contextPath}/admin/user/index"><i
			class="glyphicon glyphicon-plus"></i>Quản Lý Sinh Viên</a></li>
	<li><a
		href="${pageContext.request.contextPath}/admin/contact/index"><i
			class="glyphicon glyphicon-plus"></i>Quản Lý Phản Hồi</a></li>
	<li class="submenu"><a href="#"> <i
			class="glyphicon glyphicon-list"></i> Quản lý học phí<span
			class="caret pull-right"></span>
	</a> <!-- Sub menu -->
		<ul>
			<li><a href="${pageContext.request.contextPath}/">Thu học phí</a></li>
			<li><a href="">In biên lai</a></li>
		</ul></li>
</ul>
<!-- /.nav-bar -->