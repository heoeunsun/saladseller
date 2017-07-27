<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/layout/header.jsp"%>
<c:set var="cat_id" value="${param.cat_id}" />
<c:choose>
	 <c:when test="${cat_id eq '1'}">
	<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style="background-image: url(images/chris-lawton-165884.jpg);">
	</c:when>
	<c:when test="${cat_id eq '2'}">
	<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style="background-image: url(images/jez-timms-90838.jpg);">
	</c:when>
	<c:otherwise>
	<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style="background-image: url(images/img_33.jpg);">
	</c:otherwise>
</c:choose>
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2 text-center">
				<div class="display-t">
					<div class="display-tc animate-box" data-animate-effect="fadeIn">
						<c:choose>
						    <c:when test="${cat_id eq '1'}">
						        <h1>fresh food</h1>
						    </c:when>
						    <c:when test="${cat_id eq '2'}">
						        <h1>processed food</h1>
						    </c:when>
						    <c:otherwise>
						        <h1>dessert</h1>
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
				<h2>Products.</h2>
				<c:choose>
					<c:when test="${cat_id eq '1'}">
						<p>Known as Korea's premiere gourmet food destination, we offers thousands of imported specialty foods, olive oils, spices, sauces and cheese with selections you simply can't find anywhere else in the area. Charming, casual and a culinary delight from your local marchants.</p>
				    </c:when>
				    <c:when test="${cat_id eq '2'}">
				    	<p>We offers a wide and appealing array of absolutely fresh produce, seasonal as well as year-round. With our catering team, we brings our unconventional flare anywhere you want to be, from simple but delicious work lunches and elegant family dinner.</p>
				    </c:when>
				    <c:otherwise>
				    	<p>Our partners and their staffs produce from fresh ingredients mixed on the spot ? browse the aisles for everything from a mouthwatering selection of ice creams to waffles to our best chocolate collections. The desserts you order from our shop contain only pure cane sugar, cage free eggs and sustainably grown chocolates.</p>
					</c:otherwise>
				</c:choose>
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
					<% String user_id2 = (String)session.getAttribute("userid"); %>
					<%if(user_id2==null){%>
					<%}else if(user_id2.equals((String)"owner")){%>
						<input type="button" value="Add product" class="btn btn-primary" onclick="location.href='productAdd?cat_id=${param.cat_id}'"> 
					<%}%>
					
				</div>
			</div>
			<div class="row">
				<c:forEach var="product" items="${productList}">
					<div class="col-md-4 text-center animate-box">
						<div class="product">
							<div class="product-grid"
								style="background-image: url(${product.image});" onclick="location.href='productView?num=${product.p_num}'">
								<div class="inner">
									<p>
										<a href="productView?num=${product.p_num}" class="icon"><i class="icon-eye"></i></a>
										<a href="productCart?num=${product.p_num}" onclick="return cartCheck()" class="icon"><i class="icon-shopping-cart"></i></a>
										<% String user_id = (String)session.getAttribute("userid"); %>
										<%if(user_id==null){%>
										<%}else if(user_id.equals((String)"owner")){%>
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