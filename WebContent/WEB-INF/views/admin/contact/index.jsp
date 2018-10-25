<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp"%>
<%@page import="java.util.ArrayList"%>

<div class="content-box-large">
	<div class="row">
		<div class="panel-heading">
			<div class="panel-title ">Quản lý liên hệ</div>
		</div>
	</div>
	<hr>
	<div class="row">

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
					<table cellpadding="0" cellspacing="0" border="0"
				class="table table-striped table-bordered" id="example">
				<thead>
					<tr>
						<th>ID</th>
						<th>Tên</th>
						<th>email</th>
						<th>subject</th>
						<th>content</th>
						<th>Chức năng</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${not empty lcontact}">
						<c:forEach items="${lcontact}" var="objcat">
							<c:set
								value="${pageContext.request.contextPath }/admin/contact/edit/${objcat.cid}"
								var="urlEdit"></c:set>
							<c:set var="urldel"
								value="${pageContext.request.contextPath }/admin/contact/del/${objcat.cid}"></c:set>
							<tr class="odd gradeX">

								<td>${objcat.cid}</td>
								<td>${objcat.fullname }</td>
								<td>${objcat.email }</td>
								<td>${objcat.subject}</td>
								<td>${objcat.content}</td>
								<td class="center text-center"><a
									href="${pageContext.request.contextPath }/admin/contact/del/${objcat.cid}"
									title="" onclick="return confirm('ban co chac chan muon xoa')"
									class="btn btn-danger"><span
										class="glyphicon glyphicon-trash"></span> Xóa</a></td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
	

			<!-- Pagination -->
			
			<!-- /.pagination -->

		</div>
	</div>
	<!-- /.row -->
</div>
<!-- /.content-box-large -->