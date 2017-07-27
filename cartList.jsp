<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/layout/header.jsp"%>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm"
	role="banner" style="background-image: url(images/alisa-anton-56158.jpg);">
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2 text-center">
				<div class="display-t">
					<div class="display-tc animate-box" data-animate-effect="fadeIn">
						<h1>Cart</h1>
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
				<h2>Cart list</h2>
			</div>			
			<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
				<div class="table-wrapper">
				<c:choose>
					<c:when test="${result.count == 0}">
						Your Shopping Cart is empty.
						<br>
						<br>
						
						<a href="productList?cat_id=1"><input type="button" value="Product list" class="btn btn-primary"></a>
			        </c:when>
					<c:otherwise>
						<form name="form1" id="form1" method="post" action="cartUpdate">
							<table class="alt" style="width:100%; height: 100px; margin: auto; text-align: center;" >
								<thead>
								<tr>
									<td><span></span></td>
									<td><span>product name</span></td>
									<td><span>Unit Price</span></td>
									<td><span>Quantity</span></td>
									<td><span>Price</span></td>
									<td></td>
								</tr>
								</thead>
								<tbody align="center">
								<c:forEach var="row" items="${result.list}" varStatus="status">
								<tr>
									<td><a href="productView?num=${row.productId}"><img src="${row.productImage}" alt="user"  width="100px"></a></td>
									<td><span><a href="productView?num=${row.productId}"><b>${row.productName}</b></a></span></td>
									<td style="width: 100px" align="right"><span>￦<fmt:formatNumber pattern="###,###,###" value="${row.productPrice}" /></span></td>
									<td><span><input type="number" style="width: 60px" name="amount" value="${row.amount}" min="1">
									<input type="hidden" name="productId" value="${row.productId}"></span></td>
									<td style="width: 100px" align="right"><span>￦<fmt:formatNumber pattern="###,###,###" value="${row.money}" /></span></td>
									<td><a href="cartDelete?cartId=${row.cartId}" onclick="return deleteCheck()"><input type="button" value="delete" class="btn btn-primary"></a></td>
								</tr>
								</c:forEach>
								<tr>
									<td colspan="6" align="center">
									<span>
									current total : ￦ <fmt:formatNumber pattern="###,###,###" value="${result.sumMoney}" /><br>
									shipping charge : ￦<fmt:formatNumber pattern="###,###,###" value="${result.fee}" /><br>
									Order total : ￦ <fmt:formatNumber pattern="###,###,###" value="${result.allSum}" />
									</span>
									</td>
								</tr>

								</tbody>
								<tfoot>
								<tr>
									<td colspan="6">
									<span>
									<br>
									Orders including ￦100,000 qualify for FREE Delivery.
									</span>
									</td>
								</tr>
								<tr>
									<td colspan="6">
									<input type="hidden" name="count" value="${row.count}">
									<input type="submit" id="btnUpdate" value="Update" class="btn btn-primary" onclick="return cartUpdate()">
									<a href="#"><input type="button" value="Checkout" class="btn btn-primary"></a>
									<a href="productSearch?keyword=0"><input type="button" value="Product list" class="btn btn-primary"></a>
									</td>
								</tr>
								</tfoot>
							</table>
						</form>
					</c:otherwise>
				</c:choose>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script src="js/board.js"></script>
<%@ include file="/layout/footer.jsp"%>
