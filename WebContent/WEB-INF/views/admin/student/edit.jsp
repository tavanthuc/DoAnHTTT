<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="/WEB-INF/templates/taglib.jsp" %>
    <%@page import="java.util.ArrayList"%>
<div class="row">
	<form action="${pageContext.request.contextPath}/admin/student/add" method="post" >
         <div class="col-md-12 panel-info">
             <div class="content-box-header panel-heading">
                 <div class="panel-title ">Thêm Sinh Viên</div>
             </div>
             <div class="content-box-large box-with-header">
                 <div>
                     <div class="row mb-10"></div>

                     <div class="row">
                         <div class="col-sm-6">
                             <div class="form-group">
                                 <label for="name">Tên Sinh Viên</label>
                                 <input type="text" name="NAME" class="form-control" placeholder="Nhập họ và tên">
                             </div>

                             <div class="form-group">
                                 <label>Gioi tính</label>
                                 <select class="form-control" name="SEX">
                               			 <option value="1">Nam</option>
                               			 <option value="0">Nử</option>
									</select>
                             </div>
							  <div class="form-group">
                                 <label for="name">Ngày sinh</label>
                                 <input type="Date" name="BIRTHDAY" class="form-control" placeholder="">
                             </div>	
                            <div class="form-group">
                                 <label for="name">Quê quán</label>
                                 <input type="text" name="ADDRESS" class="form-control" placeholder="Nhập địa chỉ">
                             </div>
                             <div class="form-group">
                                 <label for="name">CMND</label>
                                 <input type="text" name="CMND" class="form-control" placeholder="Nhập cmnd">
                             </div>
                              <div class="form-group">
                                 <label>Khoa</label>
                                 <select class="form-control" name="SEX">
                               			 <option value="1">Cntt</option>
                               			 <option value="0">cơ khí</option>
                               			 <option value="0">Môi trường</option>
									</select>
                             </div>
                             <div class="form-group">
                                 <label for="name">Password</label>
                                 <input type="password" name="password" class="form-control" placeholder="Nhập mk">
                             </div>
							<div class="form-group">
                                 <label for="name">Address</label>
                                 <input type="text" name="ADDRESS" class="form-control" placeholder="Nhập địa chỉ">
                             </div>

                         </div>

                         

                       
                     </div>

                     <hr>

                     <div class="row">
                         <div class="col-sm-12">
                             <input type="submit" value="Thêm" class="btn btn-success" />
                             <input type="reset" value="Nhập lại" class="btn btn-default" />
                         </div>
                     </div>

                 </div>
             </div>
         </div>
         </form>
     </div>
     <!-- /.row col-size -->