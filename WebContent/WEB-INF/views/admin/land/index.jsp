<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/templates/taglib.jsp" %>
    <%@page import="java.util.ArrayList"%>
<div class="content-box-large">
<div class="row">
    <div class="panel-heading">
        <div class="panel-title ">Quản lý tin tuc</div>
    </div>
</div>
<hr>
<div class="row">
    <div class="col-md-8">
        <a href="${pageContext.request.contextPath}/admin/land/add" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>

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
        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên</th>
                    <th>Ngay dang</th>
                    <th>Duyệt</th>
                    <th>Danh mục</th>
                    <th>Lượt đọc</th>
                    <th>Hình ảnh</th>
                    <th>Chức năng</th>
                </tr>
            </thead>
            <tbody>
           <c:if test="${lland ne null}">
           <c:forEach items="${lland}" var="objland">
                <tr class="odd gradeX">
                    <td>${objland.lid}</td>
                    <td>${objland.lname}</td>
                    <td class="center">${objland.area}</td>
                    <td class="center"></td>
                    <td class="center">${objland.cname}</td>
                    <td class="center">${objland.count_views}</td>
                    <td class="center text-center">
                    <c:if test="${ objland.picture ne null}">
                        <img src="${pageContext.request.contextPath}/files/${objland.picture}" hight=90px width=100px />
                        </c:if>
                    </td>
                    <td class="center text-center">
                        <a href="${pageContext.request.contextPath}/admin/land/edit/${objland.lid}" title="" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
                        <a href="${pageContext.request.contextPath}/admin/land/del/${objland.lid}" title="" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
                    </td>
                </tr>
                </c:forEach>
              </c:if> 
            </tbody>
        </table>

        <!-- Pagination -->
    <nav class="text-center" aria-label="...">
        <ul class="pagination">
            <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
            <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
        </ul>
    </nav>
    <!-- /.pagination -->

    </div>
</div>
<!-- /.row -->
</div>
<!-- /.content-box-large -->