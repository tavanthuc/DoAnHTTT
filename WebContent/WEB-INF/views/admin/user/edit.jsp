<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	   <%@include file="/WEB-INF/templates/taglib.jsp" %>
	   <c:if test="${not empty msg }">
	   <p>them thanh cong</p>
	   </c:if>
	  
	
<div class="row">
<c:if test="${not empty user}">
<form action="${pageContext.request.contextPath}/admin/user/edit/${user.id}" method="post">
	<div class="col-md-12 panel-info">
		<div class="content-box-header panel-heading">
			<div class="panel-title ">Sua danh mục</div>
		</div>
		<div class="content-box-large box-with-header">
			<div>
				<div class="row mb-10"></div>

				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<label for="name">Tên người dùng</label> <input type="text"
								class="form-control" value="${user.username}" name="username" placeholder="Nhập tên người dung">
						</div>
						<div class="form-group">
							<label for="name">Họ tên</label> <input type="text"
								class="form-control" value="${user.fullname}" name="fullname" placeholder="Nhập tên day du">
						</div>
						<div class="form-group">
							<label for="name">Mat khau</label> <input type="password"
								class="form-control" value="${user.password}" name="password" placeholder="Nhập mat khau">
						</div>
					</div>
					<div class="col-sm-6"></div>
				</div>

				<hr>

				<div class="row">
					<div class="col-sm-12">
						<input type="submit" value="sua" class="btn btn-success" /> <input
							type="reset" value="Nhập lại" class="btn btn-default" />
					</div>
				</div>

			</div>
		</div>
	</div>
	</form>
	</c:if>
</div>
<!-- /.row col-size -->