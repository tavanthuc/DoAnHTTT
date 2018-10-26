<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp"%>


<div class="content-box-large">
	<div class="row">
		<div class="panel-heading">
			<div class="panel-title ">Quản lý user</div>
		</div>
	</div>
	<hr>
	<div class="row">

		<div class="col-md-8">
			<a href="${pageContext.request.contextPath}/admin/user/add" class="btn btn-success"><span
				class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>

		</div>
		<div class="col-md-4">
			<div class="input-group form">
				<input type="text" class="form-control" placeholder="Search...">
				<span class="input-group-btn">
					<button class="btn btn-primary" type="button">Search</button>
				</span>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="panel-body">
			<c:if test="${not empty msg }">

				<p>${msg}</p>
			</c:if>
			<table cellpadding="0" cellspacing="0" border="0"
				class="table table-striped table-bordered" id="example">
				<thead>
					<tr>
						<th>ID</th>
						<th>Tên đăng nhập</th>
						<th>Họ tên</th>
						<th>Chức năng</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${not empty listt}">
						<c:forEach items="${listt}" var="objuserr">
							<c:set
								value="${pageContext.request.contextPath }/admin/user/edit/${objuserr.id}"
								var="urlEdit"></c:set>
							<c:set var="urldel"
								value="${pageContext.request.contextPath }/admin/user/del/${objuserr.id}"></c:set>
							<tr class="odd gradeX">

								<td>${objuserr.id}</td>
								<td>${objuserr.username }</td>
								<td>${objuserr.fullname }</td>
								<td class="center text-center"><a href="${urlEdit}"
									title="" class="btn btn-primary"><span
										class="glyphicon glyphicon-pencil "></span> Sửa</a> <a
									href="${pageContext.request.contextPath }/admin/user/del/${objuserr.id}"
									title="" onclick="return confirm('ban co chac chan muon xoa')"
									class="btn btn-danger"><span
										class="glyphicon glyphicon-trash"></span> Xóa</a></td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>

			<!-- Pagination -->
			<nav class="text-center" aria-label="...">
				
			</nav>
			<!-- /.pagination -->

		</div>
	</div>
	<!-- /.row -->
</div>
<!-- /.content-box-large -->