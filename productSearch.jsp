<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/layout/header.jsp"%>
	<c:set var="keyword" value="${param.keyword}" />
	<c:choose>
		 <c:when test="${keyword eq '0'}">
		<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style="background-image: url(images/annie-spratt-138430.jpg);">
		</c:when>
		<c:otherwise>
		<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style="background-image: url(images/55.jpg);">
		</c:otherwise>
	</c:choose>	
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2 text-center">
				<div class="display-t">
					<div class="display-tc animate-box" data-animate-effect="fadeIn">
	<c:choose>
		 <c:when test="${keyword eq '0'}">
						<h1>all products</h1>
		</c:when>
		<c:otherwise>
						<h1>search product</h1>
		</c:otherwise>
	</c:choose>	
					</div>
				</div>
			</div>
		</div>
	</div>
</header>
<div id="fh5co-product">
	<div class="container">
		<div class="row animate-box">
			<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
				<span>Salad Seller</span>
				
	<c:choose>
		 <c:when test="${keyword eq '0'}">
						<h2>All products</h2>
		</c:when>
		<c:otherwise>
						<h2>results for "${param.keyword}"</h2>
		</c:otherwise>
	</c:choose>
				
			</div>
			<div class="row">
				<c:forEach var="product" items="${productList}">
					<div class="col-md-4 text-center animate-box">
						<div class="product">
							<div class="product-grid"
								style="background-image: url(${product.image});">
								<div class="inner">
									<p>
									<% String user_id2 = (String)session.getAttribute("userid"); %>
										<a href="productView?num=${product.p_num}" class="icon"><i class="icon-eye"></i></a>
									<%if(user_id2==null){%>
										<a href="loginForm" onclick="return loginCheck()" class="icon"><i class="icon-shopping-cart"></i></a>
									<%}else{ %>
										<a href="productCart?num=${product.p_num}" onclick="return cartCheck()" class="icon"><i class="icon-shopping-cart"></i></a>
									<%} %>
										
										
									<%if(user_id2==null){%>
									<%}else if(user_id2.equals((String)"owner")){%>
										<a href="productUpdate?num=${product.p_num}" class="icon"><i class="icon-edit"></i></a>
										<a href="productDelete?num=${product.p_num}" onclick="return deleteCheck()" class="icon"><i class="icon-trash"></i></a>
									<%}else{}%>
									</p>
								</div>
							</div>
							<div class="desc">
								<h3>
									<a href="#">${product.p_name}</a>
								</h3>
								<span class="price">\<fmt:formatNumber pattern="###,###,###" value="${product.price}" /></span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			
			
<script src="js/board.js"></script>
		</div>
	</div>
</div>

<%@ include file="/layout/footer.jsp"%>