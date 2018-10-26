<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>
 <section id="header_area">
        <div class="wrapper header">
            <div class="clearfix header_top">
                <div class="clearfix logo floatleft">
                    <a href="index.php">
                        <h1><span>C</span>Land</h1>
                    </a>
                </div>
                <div class="clearfix search floatright">
                    <form>
                        <input type="text" placeholder="Search" />
                        <input type="submit" />
                    </form>
                </div>
            </div>
            <div class="header_bottom">
                <nav>
                    <ul id="nav">
                        <li><a href="${pageContext.request.contextPath}/public/index">Trang chủ</a></li>
                        <li id="dropdown"><a href="cat.php">Bất động sản</a>
                            <ul>
                            <c:forEach items="${listcat}" var="objcat">
                                <li><a href="${pageContext.request.contextPath}/public/cat/${objcat.cid}">${objcat.cname}</a></li>
                               </c:forEach>    
                            </ul>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/public/single">Giới thiệu</a></li>
                        <li><a href="${pageContext.request.contextPath}/public/contact">Liên hệ</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </section>