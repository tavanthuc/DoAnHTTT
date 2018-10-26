<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/templates/taglib.jsp" %>
    <%@page import="java.util.ArrayList"%>
<div class="content-box-large">
<div class="row">
    <div class="panel-heading">
        <div class="panel-title ">Quản lý Sinh viên</div>
    </div>
</div>
<hr>
<div class="row">
    <div class="col-md-8">
        <a href="${pageContext.request.contextPath}/admin/student/add" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>

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
                    <th>MSSV</th>
                    <th>Tên</th>
                    <th>Khoa</th>
                    <th>CMND</th>
                    <th>Quê quán</th>
                    <th>Ngày Sinh</th>
                    <th>Gioi tính</th>
                    <th>Chức năng</th>
                </tr>
            </thead>
            <tbody>
           <c:if test="${lStudent ne null}">
           <c:forEach items="${lStudent}" var="objstudent">
                <tr class="odd gradeX">
                    <td>${objstudent.ID}</td>
                    <td>${objstudent.NAME}</td>
                    <td class="center"></td>
                    <td class="center">${objstudent.CMND}</td>
                    <td class="center">${objstudent.ADDRESS}</td>
                    <td class="center">${objstudent.BIRTHDAY}</td>
                    <td class="center text-center"><c:if test="${objstudent.SEX eq 1}">nam</c:if><c:if test="${objstudent.SEX ne 1}">nữ</c:if></td>
                    <td class="center text-center">
                        <a href="${pageContext.request.contextPath}/admin/student/edit/${objstudent.ID}" title="" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span>Xem chi tiết</a>
                        <a href="${pageContext.request.contextPath}/admin/student/del/${objstudent.ID}" title="" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
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