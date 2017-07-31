<%@ include file="/common/taglib.jsp" %>

 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Shop &mdash; Salad Seller</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by gettemplates.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="gettemplates.co" />

	<!--
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE
	DESIGNED & DEVELOPED by FreeHTML5.co

	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

	//////////////////////////////////////////////////////
	 -->

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet"> -->
	<!-- <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i" rel="stylesheet"> -->

	<!-- Animate.css -->
	
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">

	<!-- Flexslider  -->
	<link rel="stylesheet" href="css/flexslider.css">

	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="css/style.css">

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
<script type="text/javascript" src="script/board.js"></script>
	</head>
	<body>

	<div class="fh5co-loader"></div>

	<div id="page">
	<nav class="fh5co-nav" role="navigation">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-xs-2">
					<div id="fh5co-logo"><a href="index"><img src="images/logo_small.png" alt="logo"></a></div>
				</div>
				<div class="col-md-6 col-xs-6 text-center menu-1">
					<ul>
					<li><a href="about">About</a></li>
					<li><a href="services">Services</a></li>
					<li class="has-dropdown">
						<a href="productList?cat_id=1">Shop</a>
						<ul class="dropdown">
							<li><a href="productList?cat_id=1">fresh food</a></li>
							<li><a href="productList?cat_id=2">processed food</a></li>
							<li><a href="productList?cat_id=3">dessert</a></li>
						</ul>
					</li>
					<li class="has-dropdown">
						<a href="BoardServlet?command=board_list">API</a>
						<ul class="dropdown">
							<li><a href="BoardServlet?command=board_list">영양소</a></li>
							<li><a href="BoardServlet?command=board_list2">레시피</a></li>
						</ul>
					</li>
					<li><a href="contact">Contact</a></li>
					</ul>
				</div>
				
				<div class="col-md-3 col-xs-4 text-right hidden-xs menu-2">
					<ul>
						<li class="search">
							<form action="productSearch">
								<div class="input-group">
								      <input type="text" name="keyword" placeholder="Search..">
								      <span class="input-group-btn"><button class="btn btn-primary" type="submit"><i class="icon-search"></i></button>
								      </span>
							      
							    </div>
						    </form>
						</li>
					
						<li class="shopping-cart">
							<a href="cartList" class="cart">
								<span><small>
									<c:choose>
											<c:when test="${cartCount != '' || cartCount ne null}">
											${cartCount}
											</c:when>
											<c:otherwise>
											0
											</c:otherwise>
									</c:choose>
										
								</small><i class="icon-shopping-cart"></i></span>
							</a>
						
						</li>
			<%if(session.getAttribute("userid")==""){%>
						<li class="sign-in"><a href="loginForm" class="signin"><span><i class="icon-login"></i></span></a></li>
			<%} else{%>
						<li class="sign-out">HI, <%=session.getAttribute("userid")%><a href="logout" class="signin"><span><i class="icon-login"></i></span></a></li>
			<%}%>
						
					</ul>
				</div>
			</div>

		</div>
	</nav>