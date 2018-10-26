<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/templates/taglib.jsp"%>
<div class="clearfix sidebar">
    <div class="clearfix single_sidebar category_items">
        <h2>Danh mục bất động sản</h2>
        <ul>
        <c:if test="${not empty listcat }">
        <c:forEach items="${listcat}" var="objcat">
            <li class="cat-item"><a href="${pageContext.request.contextPath}/public/cat/${objcat.cid}">${objcat.cname}</a>(12)</li>
          </c:forEach>  
          </c:if>
        </ul>
    </div>

    <div class="clearfix single_sidebar">
        <div class="popular_post">
            <div class="sidebar_title">
                <h2>Xem nhiều</h2>
            </div>
            <ul>
             <c:if test="${not empty listland }">
        <c:forEach items="${listland}" var="objland">
           
                <li><a href="${pageContext.request.contextPath}/public/single/${objland.lid}">${objland.lname} </a></li>
              
          </c:forEach>  
          </c:if> 
            </ul>
        </div>
    </div>

    <div class="clearfix single_sidebar">
        <h2>Danh mục hot</h2>
      <c:if test="${not empty listcat }">
        <c:forEach items="${listcat}" var="objcat">
            <li class="cat-item"><a href="${pageContext.request.contextPath}/public/cat/${objcat.cid}">${objcat.cname}</a>(12)</li>
          </c:forEach>  
          </c:if>
    </div>
</div>
