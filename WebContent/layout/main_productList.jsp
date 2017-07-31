<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


			<div class="row">
				<c:forEach var="product" items="${productList}" begin="0" end="17" step="1">
					<div class="col-md-4 text-center animate-box">
						<div class="product">
							<div class="product-grid"
								style="background-image: url(${product.image});">
								<div class="inner">
									<p>
										<a href="productView?num=${product.p_num}" class="icon"><i class="icon-eye"></i></a>
										<a href="productCart?num=${product.p_num}" class="icon"><i class="icon-shopping-cart"></i></a>
										<%if(session.getAttribute("userid").equals((String)"owner")) {%>
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
								<span class="price">\ ${product.price}</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>