<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


			<div class="row">
				<c:forEach var="board" items="${boardList}">
					<div class="col-md-4 text-center animate-box">
						<div class="product">
							<div class="product-grid"
								style="background-image: url(${board.image});">
								<div class="inner">
									<p>
										<a href="#" class="icon"><i class="icon-shopping-cart"></i></a>
										<a href="BoardServlet?command=board_view&num=${board.p_num}" class="icon"><i class="icon-eye"></i></a>
<%if(session.getAttribute("id").equals("owner")) {	%>	
										<a href="BoardServlet?command=board_delete&num=${board.p_num}" onclick="return deleteCheck()" class="icon"><i class="icon-trash"></i></a>
										<a href="BoardServlet?command=board_update_form&num=${board.p_num}" class="icon"><i class="icon-edit"></i></a>
<%}%>
									
									</p>
								</div>
							</div>
							<div class="desc">
								<h3>
									<a href="#">${board.p_name}</a>
								</h3>
								<span class="price">\ ${board.price}</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			
<script src="js/board.js"></script>