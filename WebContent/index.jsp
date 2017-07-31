 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/header.jsp" %>

	<aside id="fh5co-hero" class="js-fullheight">
		<div class="flexslider js-fullheight">
			<ul class="slides">
			<c:forEach var="product" items="${productList}" begin="0" end="2" step="1">
		   	<li style="background-image: url(${product.image});">
		   		<div class="overlay-gradient"></div>
		   		<div class="container">
		   			<div class="col-md-6 col-md-offset-3 col-md-pull-3 js-fullheight slider-text">
		   				<div class="slider-text-inner">
		   					<div class="desc">
		   						<span class="price">\<fmt:formatNumber pattern="###,###,###" value="${product.price}" /></span>
		   						<h2>${product.p_name}</h2>
		   						<p>${product.specification}</p>
			   					<p><a href="productView?num=${product.p_num}" class="btn btn-primary btn-outline btn-lg">Purchase Now</a></p>
		   					</div>
		   				</div>
		   			</div>
		   		</div>
		   	</li>

			</c:forEach>
		  	</ul>
		  	
		  	
	  	</div>
	</aside>

	<div id="fh5co-services" class="fh5co-bg-section">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-sm-4 text-center">
					<div class="feature-center animate-box" data-animate-effect="fadeIn">
						<span class="icon">
							<i class="icon-credit-card"></i>
						</span>
						<h3>Credit Card</h3>
						<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove</p>
						<p><a href="services.jsp" class="btn btn-primary btn-outline">Learn More</a></p>
					</div>
				</div>
				<div class="col-md-4 col-sm-4 text-center">
					<div class="feature-center animate-box" data-animate-effect="fadeIn">
						<span class="icon">
							<i class="icon-wallet"></i>
						</span>
						<h3>Save Money</h3>
						<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove</p>
						<p><a href="services.jsp" class="btn btn-primary btn-outline">Learn More</a></p>
					</div>
				</div>
				<div class="col-md-4 col-sm-4 text-center">
					<div class="feature-center animate-box" data-animate-effect="fadeIn">
						<span class="icon">
							<i class="icon-paper-plane"></i>
						</span>
						<h3>Free Delivery</h3>
						<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove</p>
						<p><a href="services.jsp" class="btn btn-primary btn-outline">Learn More</a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div id="fh5co-product">
	<div class="container">
		<div class="row animate-box">
			<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
				<span>Salad Seller</span>
				<h2>Recent products.</h2>
			</div>
			</div>
			<%@ include file="/layout/main_productList.jsp" %>
		</div>
	</div>

<%@ include file="/layout/main_api.jsp" %>
	<div id="fh5co-counter" class="fh5co-bg fh5co-counter" style="background: #efefef;">
		<div class="container">
			<div class="row">
				<div class="display-t">
					<div class="display-tc">

						<div class="col-md-3 col-sm-6 animate-box">
							<div class="feature-center">
								<span class="icon">
									<i class="icon-user"></i>
								</span>

								<span class="counter js-counter" data-from="0" data-to="${memberCount}" data-speed="7000" data-refresh-interval="50">1</span>
								<span class="counter-label">Happy Clients</span>
							</div>
						</div>
						<div class="col-md-3 col-sm-6 animate-box">
							<div class="feature-center">
								<span class="icon">
									<i class="icon-shop"></i>
								</span>
								<span class="counter js-counter" data-from="0" data-to="${proCount}" data-speed="7000" data-refresh-interval="50">1</span>
								<span class="counter-label">Fresh Food</span>
							</div>
						</div>
						<div class="col-md-3 col-sm-6 animate-box">
							<div class="feature-center">
								<span class="icon">
									<i class="icon-shop"></i>
								</span>
								<span class="counter js-counter" data-from="0" data-to="${proCount2}" data-speed="7000" data-refresh-interval="50">1</span>
								<span class="counter-label">Processed Food</span>
							</div>
						</div>
						<div class="col-md-3 col-sm-6 animate-box">
							<div class="feature-center">
								<span class="icon">
									<i class="icon-shop"></i>
								</span>
								<span class="counter js-counter" data-from="0" data-to="${proCount3}" data-speed="7000" data-refresh-interval="50">1</span>
								<span class="counter-label">Dessert</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<%@ include file="/layout/footer.jsp" %>
