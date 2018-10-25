<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	   <%@include file="/WEB-INF/templates/taglib.jsp" %>
	   <c:if test="${not empty msg }">
	   <p>them thanh cong</p>
	   </c:if>
	   <c:set var="cid" value="${cat.cid}"></c:set>
	   <c:set var="cname" value="${cat.cname }"></c:set>
	
<div class="row">
<c:if test="${not empty cat}">
<form action="${pageContext.request.contextPath}/admin/cat/edit/${cid}" method="post">
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
							<label for="name">Tên danh muc</label> <input type="text"
								class="form-control" value="${cname}" name="cname" placeholder="Nhập tên danh muc">
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