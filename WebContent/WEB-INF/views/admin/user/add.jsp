<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp"%>

<c:if test="${not empty msg }">
	<p>them thanh cong</p>
</c:if>
<div class="row">


	<form action="${pageContext.request.contextPath}/admin/user/add"
		method="post">

		<div class="col-md-12 panel-info">
			<div class="content-box-header panel-heading">
				<div class="panel-title ">Thêm người dùng</div>
			</div>
			
			<div class="content-box-large box-with-header">
				<div>
					<div class="row mb-10"></div>

					<div class="row">
						<div class="col-sm-6">

							<div class="form-group">
								<label for="name">username</label> <input type="text"
									class="form-control" name="username"
									placeholder="Nhập tên người dùng">
							</div>
							<div><form:errors path="objuser.username" Style="color:red; font-weight:both"></form:errors></div>
							<div class="form-group">
								<label for="name">fullname</label> <input type="text"
									class="form-control" name="fullname"
									placeholder="Nhập tên danh muc">
							</div>
							<div><form:errors path="objuser.fullname" Style="color:red; font-weight:both"></form:errors></div>
							<div class="form-group">
								<label for="name">password</label> <input type="password"
									class="form-control" name="password"
									placeholder="Nhập tên mật khẩu">
							</div>
							<div><form:errors path="objuser.password" Style="color:red; font-weight:both"></form:errors></div>
						</div>
						<div class="col-sm-6"></div>
					</div>

					<hr>

					<div class="row">
						<div class="col-sm-12">
							<input type="submit" value="Thêm" class="btn btn-success" /> <input
								type="reset" value="Nhập lại" class="btn btn-default" />
						</div>
					</div>

				</div>
			</div>
		</div>
	</form>
</div>
<!-- /.row col-size -->