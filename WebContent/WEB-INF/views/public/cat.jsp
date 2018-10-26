<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/WEB-INF/templates/taglib.jsp" %>  
 <%@page import="pk.util.SlugUtil"%> 
<div class="clearfix content">
    <div class="content_title">
    	<c:if test="${not empty catitem}">
        <h2>${catitem.cname}</h2>
        </c:if>
    </div>

    <div class="clearfix single_work_container">
    <c:if test="${listlandid ne null}">
       <c:forEach items="${listlandid}" var="objlanditem">
        <div class="clearfix single_work">
        	<c:set var="urlDetail" value="${pageContext.request.contextPath }/public/single/${SlugUtil.makeSlug(objlanditem.lname)}-${objlanditem.lid}.html"></c:set>
        	<c:if test="${ objlanditem.picture ne null}">
            <img class="img_bottom" src="${pageContext.request.contextPath}/files/${objlanditem.picture}" alt="" />
            </c:if>
          
            
            <h2>${objlanditem.lname}</h2>
            <a href="${urlDetail}">
                <p class="caption">${objlanditem.description}</p>
            </a>
      
           
           
        </div>
       </c:forEach>
</c:if>

        <div class="clearfix work_pagination">
            <nav>
                <a class="newer floatleft" href="">
                    < -- Trang trước</a>
                        <a class="older floatright" href="">Trang kế -- ></a>
            </nav>
        </div>

    </div>
</div>