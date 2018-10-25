<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp"%>
<%@page import="java.util.ArrayList"%>

<div class="content-box-large">
	<div class="row">
		<div class="panel-heading">
			<div class="panel-title ">Quản lý danh muc</div>
		</div>
	</div>
	<hr>
	<div class="row">

		<div class="col-md-8">
			<a href="${pageContext.request.contextPath}/admin/cat/add" class="btn btn-success"><span
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
						<th>Tên</th>
						<th>Chức năng</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${not empty list}">
						<c:forEach items="${list}" var="objcat">
							<c:set
								value="${pageContext.request.contextPath }/admin/cat/edit/${objcat.cid}"
								var="urlEdit"></c:set>
							<c:set var="urldel"
								value="${pageContext.request.contextPath }/admin/cat/del/${objcat.cid}"></c:set>
							<tr class="odd gradeX">

								<td>${objcat.cid}</td>
								<td>${objcat.cname }</td>
								<td class="center text-center"><a href="${urlEdit}"
									title="" class="btn btn-primary"><span
										class="glyphicon glyphicon-pencil "></span> Sửa</a> <a
									href="${pageContext.request.contextPath }/admin/cat/del/${objcat.cid}"
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
				<ul class="pagination">
				<%
				
						int pageht =0;
				
				int tongsopage = (int) request.getAttribute("tongsopage");
				try{
				 pageht = (int) request.getAttribute("page");
				}catch(Exception e){
					
				}
				int back=0;
				int next=0;
				if((pageht>=0)&&(pageht<tongsopage)){
				next=pageht+1;
				}
				if((pageht<=tongsopage)&&(pageht>0)){
					back=pageht-1;
				}
				 
				%>
					<li><a href="<%=request.getContextPath()%>/admin/cat/index/<%=back%>" >«</a></li>
					<%
				
					int offset=(int) request.getAttribute("offset");
						for (int i = 1; i <= tongsopage; i++) {
					%>
					<li  class="<%if((i-1)*2==offset) out.print("active");%>"><a
						href="<%=request.getContextPath()%>/admin/cat/index/<%=i%>"><%=i%></a></li>
					<%
						}
					%>
					<li><a href="<%=request.getContextPath()%>/admin/cat/index/<%=next%>" >»</a></li>
				</ul>
			</nav>
			<!-- /.pagination -->

		</div>
	</div>
	<!-- /.row -->
</div>
<!-- /.content-box-large -->