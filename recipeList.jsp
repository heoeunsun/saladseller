<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/layout/header.jsp"%>

	<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style="background-image: url(images/111.jpg);">

	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2 text-center">
				<div class="display-t">
					<div class="display-tc animate-box" data-animate-effect="fadeIn">
						<h1>recipe</h1>
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
				<h2>recipe list.</h2>
					<p>Find and share everyday cooking inspiration on <b>saladseller</b>. <br>Discover recipes, cooks, and how-tos.</p>
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
				</div>
			</div>
			<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
				<div class="table-wrapper">
				<table>
				<thead>
					<tr>
						<td colspan="5" style="border: white; text-align: right">
					<% String user_id2 = (String)session.getAttribute("userid"); %>
					<%if(user_id2==null){%>
					<%}else if(user_id2.equals((String)"owner")){%>
						<input type="button" value="Write" class="btn btn-primary" onclick="location.href='recipeWriteForm'"> 
					<%}%>
						</td>
					</tr>
					<tr>
						<td><span>no.</span></td>
						<td><span>title</span></td>
						<td><span>writer</span></td>
						<td><span>date</span></td>
						<td><span>view</span></td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="board" items="${boardList}">
						<tr>
							<th>${board.num}</th>
							<th><a href="recipeView?num=${board.num}">${board.title} <c:if
										test="${board.replyCount >0}"> [${board.replyCount}]</c:if></a></th>
							<td>${board.name}</td>
							<td><fmt:formatDate value="${board.writedate}" type="date" />
							</td>
							<td>${board.readCount}</td>
						</tr>
					</c:forEach>

					<tr>
						<td colspan="5">
					</tr>

					<tr>
						<td colspan="5" align="center">
							<!-- 	 					[처음][이전][1][2]..... --> <c:if test="${start !=1}">
								<a
									href="recipe?page=1
	 							<c:if test = "${type != null}">&type=${type}</c:if>
	 							<c:if test = "${keyword != null}">&keyword=${keyword}</c:if>
	 						">
									[처음]</a>

								<a
									href="recipe?page=${start-1}
		 						<c:if test = "${type != null}">&type=${type}</c:if>
	 							<c:if test = "${keyword != null}">&keyword=${keyword}</c:if>
	 						">[이전]</a>
							</c:if> <c:forEach begin="${start}" end="${end < last ? end : last}"
								var="i">
								<!-- 현재 페이지는 링크 달지 않는다. -->
								<c:choose>
									<c:when test="${i == current}">
										<b>[${i}]</b>
									</c:when>
									<c:otherwise>
										<a
											href="recipe?page=${i}
	 									<c:if test = "${type != null}">&type=${type}</c:if>
	 									<c:if test = "${keyword != null}">&keyword=${keyword}</c:if>
	 								">[${i}]</a>
									</c:otherwise>
								</c:choose>
							</c:forEach> <c:if test="${end < last }">
								<a
									href="recipe?page=${end+1}
	 							<c:if test = "${type != null}">&type=${type}</c:if>
	 							<c:if test = "${keyword != null}">&keyword=${keyword}</c:if>
	 						">[다음]</a>
								<a
									href="recipe?page=${last}
	 							<c:if test = "${type != null}">&type=${type}</c:if>
	 							<c:if test = "${keyword != null}">&keyword=${keyword}</c:if>
	 						">[마지막]</a>
							</c:if>



						</td>
					</tr>



					<tr>
						<td colspan="5">
							<form action="recipe">
								<select name="type">
									<option value="1">제목</option>
									<option value="2">내용</option>
									<option value="3">제목+내용</option>
									<option value="4">작성자</option>
								</select> <input type="text" name="keyword"> <input type="submit"
									value="검색">
							</form>
						</td>
					</tr>
					</tbody>
				</table>
			</div>
		</div>
			
<script src="js/board.js"></script>
		</div>
	</div>
</div>

<%@ include file="/layout/footer.jsp"%>