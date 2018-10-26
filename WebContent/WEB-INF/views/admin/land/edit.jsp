<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="/WEB-INF/templates/taglib.jsp" %>
    <%@page import="java.util.ArrayList"%>
<div class="row">
<c:if test="${not empty llandd }">
	<form action="${pageContext.request.contextPath}/admin/land/edit/${llandd.lid}" method="post" enctype="multipart/form-data">
         <div class="col-md-12 panel-info">
             <div class="content-box-header panel-heading">
                 <div class="panel-title ">Sửa tin</div>
             </div>
             <div class="content-box-large box-with-header">
                 <div>
                     <div class="row mb-10"></div>

                     <div class="row">
                         <div class="col-sm-6">
                             <div class="form-group">
                                 <label for="name">Tên tin</label>
                                 <input type="text" name="lname" value="${llandd.lname}" class="form-control" placeholder="Nhập tên truyện">
                             </div>

                             <div class="form-group">
                                 <label>Danh mục tin</label>
                                 <select class="form-control" name="cid">
                                 <c:if test="${lcat ne null}">
                                <c:forEach items="${lcat}" var="objcat">
                                	
									   <option  value="${objcat.cid}" >${objcat.cname}</option>
									  
									  
									   </c:forEach>
									  </c:if>
									</select>
                             </div>
							  <div class="form-group">
                                 <label for="name">area</label>
                                 <input type="text" name="area"  value="${llandd.area}" class="form-control" placeholder="">
                             </div>	
                             <div class="form-group" >
                                 <label>Thêm hình ảnh</label>
                                 <input type="file" class="btn btn-default" name="pt" id="exampleInputFile1">
                                 <img alt="" src="${pageContext.request.contextPath}/files/${llandd.picture}" hight=90 width=100>
                                 <p class="help-block"><em>Định dạng: jpg, png, jpeg,...</em></p>
                             </div>

                             <div class="form-group" name="description">
                                 <label>Mô tả</label>
                                 <textarea class="form-control" rows="3">${llandd.description}</textarea>
                             </div>


                         </div>

                         <div class="col-sm-6"></div>

                         <div class="col-sm-12">
                             <div class="form-group" >
                                 <label>address</label>
                                 <textarea class="form-control" name="address" rows="7">${llandd.address}</textarea>
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
         </c:if>
     </div>
     <!-- /.row col-size -->