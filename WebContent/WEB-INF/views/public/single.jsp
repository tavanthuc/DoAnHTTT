<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="/WEB-INF/templates/taglib.jsp" %>
      <%@page import="pk.util.SlugUtil"%>   
<div class="clearfix content">
	<c:if test="${landitem ne null}">
    <h1>${landitem.lname} </h1>
    <div class="clearfix post-meta">
        <p><span><i class="fa fa-clock-o"></i> ${landitem.address} </span> <span><i class="fa fa-folder"></i> Diện tích: ${landitem.area} m2</span></p>
    </div>

    <div class="vnecontent">
        <p>${landitem.description}</p>
        
    </div>
</c:if>
    <a class="btn" href="">Bài trước</a>
    <a class="btn" href="">Bài kế</a>

</div>

<div class="more_themes">
    <h2>Bất động sản liên quan <i class="fa fa-thumbs-o-up"></i></h2>
    <div class="more_themes_container">
    
    <c:forEach items="${listrela}" var="objl" begin="0" end="3">
    	<c:if test="${objl.lid ne landitem.lid}">
        <div class="single_more_themes floatleft">
            <img class="img_bottom" src="${pageContext.request.contextPath}/files/${objl.picture}" alt="" />
            <c:set var="urlDetail" value="${pageContext.request.contextPath }/public/single/${SlugUtil.makeSlug(objl.lname)}-${objl.lid}.html"></c:set>
            <a href="${urlDetail}">
            
                <h2>${objl.lname}</h2>
            </a>
        </div>
        </c:if>
        </c:forEach>
    

    </div>
</div>