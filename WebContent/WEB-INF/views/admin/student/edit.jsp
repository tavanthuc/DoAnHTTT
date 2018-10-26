<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="/WEB-INF/templates/taglib.jsp" %>
    <%@page import="java.util.ArrayList"%>
<div class="row">
<c:if test="${not empty stitem }">
	<form action="${pageContext.request.contextPath}/admin/student/edit" method="post" >
         <div class="col-md-12 panel-info">
             <div class="content-box-header panel-heading">
                 <div class="panel-title ">Thông tinh Sinh Viên</div>
             </div>
             <div class="content-box-large box-with-header">
                 <div>
                     <div class="row mb-10"></div>
					
                     <div class="row">
                         <div class="col-sm-6">
                             <div class="form-group">
                                 <label for="name">Họ Và tên</label>
                                 <input type="text" name="NAME" class="form-control" value="${stitem.NAME}" placeholder="Nhập họ và tên">
                             </div>

                             <div class="form-group">
                                 <label>Gioi tính</label>
                                 <select class="form-control" name="SEX">
                               			 <option <c:if test="${stitem.SEX eq 1}">selected</c:if> value="1">Nam</option>
                               			 <option <c:if test="${stitem.SEX eq 0}">selected</c:if> value="0">Nử</option>
									</select>
                             </div>
							  <div class="form-group">
                                 <label for="name">Ngày sinh</label>
                                 <input type="Date" name="BIRTHDAY" value="${stitem.BIRTHDAY}" class="form-control" placeholder="">
                             </div>	
                            <div class="form-group">
                                 <label for="name">Quê quán</label>
                                 <input type="text" name="ADDRESS" <c:if test="${stitem.ADDRESS ne null }"> value="${stitem.ADDRESS}"</c:if> class="form-control" placeholder="Nhập địa chỉ">
                             </div>
                             <div class="form-group">
                                 <label for="name">CMND</label>
                                 <input type="text" name="CMND" <c:if test="${stitem.CMND ne null }"> value="${stitem.CMND}"</c:if> class="form-control" placeholder="Nhập cmnd">
                             </div>
                              <div class="form-group">
                                 <label for="name">Tổng điểm</label>
                                 <input type="text" name="SUMSCORE" <c:if test="${stitem.SUMSCORE ne null }"> value="${stitem.SUMSCORE}"</c:if>class="form-control" >
                             </div>
                              <div class="form-group">
                                 <label for="name">EMAIL</label>
                                 <input type="text" name="EMAIL" <c:if test="${stitem.EMAIL ne null }"> value="${stitem.EMAIL}"</c:if> class="form-control" placeholder="Nhập email">
                             </div>
                              <div class="form-group">
                                 <label for="name">Quốc tịch</label>
                                 <input type="text" name="NATIONALLILY" <c:if test="${stitem.NATIONALLILY ne null }"> value="${stitem.NATIONALLILY}"</c:if> class="form-control" placeholder="Nhập Quốc tịch">
                             </div>
                              <div class="form-group">
                                 <label for="name">Dân tộc</label>
                                 <input type="text" name="NATION" <c:if test="${stitem.NATION ne null }"> value="${stitem.NATION}"</c:if> class="form-control" placeholder="Nhập Dân tộc">
                             </div>
                             <div class="form-group">
                                 <label for="name">Số điện thoại</label>
                                 <input type="text" name="PHONE" <c:if test="${stitem.PHONE ne null }"> value="${stitem.PHONE}"</c:if> class="form-control" placeholder="Nhập số điện thoại">
                             </div>
                             <div class="form-group">
                                 <label for="name">Số báo danh</label>
                                 <input type="text" name="SBD" <c:if test="${stitem.SBD ne null }"> value="${stitem.SBD}"</c:if> class="form-control" placeholder="Nhập Số báo danh">
                             </div>
                              <div class="form-group">
                                 <label>Khoa</label>
                                 <select class="form-control" name="REGISTERFACULY">
                               			 <option >Cntt</option>
                               			 <option >cơ khí</option>
                               			 <option>Môi trường</option>
									</select>
                             </div>
                          
							

                         </div>

                         

                       
                     </div>

                     <hr>

                     <div class="row">
                         <div class="col-sm-12">
                             <input type="submit" value="Lưu chỉnh sửa" class="btn btn-success" />                
                         </div>
                     </div>

                 </div>
             </div>
         </div>
         </form>
         </c:if>
     </div>
     <!-- /.row col-size -->