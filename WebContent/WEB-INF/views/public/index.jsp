<%@page import="pk.util.SlugUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	   <%@include file="/WEB-INF/templates/taglib.jsp" %>
<div class="clearfix slider">
	<ul class="pgwSlider">
		<li><img
			src="${pageContext.request.contextPath}/publicUrl/images/thumbs/megamind_07.jpg"
			alt="Paris, France" data-description="Eiffel Tower and Champ de Mars"
			data-large-src="${pageContext.request.contextPath}/publicUrl/images/slides/megamind_07.jpg" /></li>
		<li><img
			src="${pageContext.request.contextPath}/publicUrl/images/thumbs/wall-e.jpg"
			alt="Montréal, QC, Canada"
			data-large-src="${pageContext.request.contextPath}/publicUrl/images/slides/wall-e.jpg"
			data-description="Eiffel Tower and Champ de Mars" /></li>
		<li><img
			src="${pageContext.request.contextPath}/publicUrl/images/thumbs/up-official-trailer-fake.jpg"
			alt="Shanghai, China"
			data-large-src="${pageContext.request.contextPath}/publicUrl/images/slides/up-official-trailer-fake.jpg"
			data-description="Shanghai ,chaina"></li>
	</ul>
</div>

<div class="clearfix content">
	<div class="content_title">
		<h2>Bài viết mới</h2>
	</div>

	<c:if test="${not empty listLands }">
		<c:forEach items="${listLands}" var="listLands">
		
		<fmt:formatDate value="${listLands.date_create}" var="day" pattern="dd"/>
		<fmt:formatDate value="${listLands.date_create}" var="month" pattern="MM"/>
		
<c:set var="urlDetail" value="${pageContext.request.contextPath }/public/single/${SlugUtil.makeSlug(listLands.lname)}-${listLands.lid}.html"></c:set>
			<div class="clearfix single_content">
				<div class="clearfix post_date floatleft">
					<div class="date">
						<h3>${day}</h3>
						<p>Tháng ${month}</p>
					</div>
				</div>
				<div class="clearfix post_detail">
					<h2>
						<a href="${urlDetail}">${listLands.lname} </a>
					</h2>
					<div class="clearfix post-meta">
						<p>
							<span><i class="fa fa-clock-o"></i> ${listLands.address}</span> <span><i
								class="fa fa-folder"></i> ${listLands.area }</span>
						</p>
					</div>
					<div class="clearfix post_excerpt">
						<img
							src="${pageContext.request.contextPath}/files/${listLands.picture}"
							alt="" />
						<p>${listLands.description}</p>
					</div>
					<a href="${urlDetail}">Đọc thêm</a>
				</div>
			</div>
		</c:forEach>
	</c:if>




</div>

<div class="pagination">
	<nav>
		<ul>
			<li><a href=""> << </a></li>
			<c:forEach var="i" begin="1" end="${tongsopage}">
			<li><a href="${pageContext.request.contextPath}/public/index/${i}">${i}</a></li>
			</c:forEach>
			<li><a href=""> >> </a></li>
		</ul>
	</nav>
</div>