<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/layout/header.jsp"%>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<link rel="stylesheet" type = "text/css" href="/css/board.css">
<script type="text/javascript" src="/js/board.js"></script>
<style type="text/css">
	#modDiv{
		width: 60%;
		height : 100px;
		background-color: rgba(0, 0, 0, 0);
		position: relative;
		top: 50%;
		left: 5%;
		margin-top : -50px auto;
		margin-left: -150px auto;
		padding: 0;
		z-index: 1000
	;}
	</style>
<script
	src="https://code.jquery.com/jquery-2.2.4.js"
	integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
	crossorigin="anonymous">
</script>
<script type="text/javascript">
	
	function getOriginalName(fileName){
		/* UUID 가 붙은 file 명을 원래 파일명으로 가져오는 메서드작성*/
		/*  UUID + _ + orginalFileName */
		if(fileName == null){
			return;
		}
		
		var idx = fileName.indexOf("_") + 1;   
		return fileName.substr(idx);
	}
	
	
	
	$(function(){
		
		var num = ${param.num};   //임의의 게시글 번호 
		var fileName = getOriginalName("${board.fullname}");
		
		$("#fileLink").append(fileName);
		//alert(fileName);
		
		getAllList();
		/*form의 submit이 눌리면 댓글 등록 요청보내기 : ajax*/
		/* 전송 데이터 : 작성자, 작성내용, 게시글 번호 */
		
		$("#replyForm").on("submit",function(){
			//ajax 요청보내기
			var replytext = $("#replytext").val();
			
			$.ajax({
				url: "${pageContext.request.contextPath}/replies",
				type:"POST",
				data : {
					num : num,
					replytext : replytext
				},
				datatype : "text", //반환 받을 데이터의 타입   성공/실패
				success : function(result){
					if(result == "SUCCESS"){
						alert("등록되었습니다.");
						getAllList();
					}
				},
				error : function(request,status,error){
					alert("로그인 후 작성하실 수 있습니다.");
				}
				
			});
			return false;
		});
		/*
		리스트를 ajax로 요청하는 경우 : 페이지 로딩, 새로운 댓글 입력 성공 후, 수정/삭제 후
		빈번한 작업은 메서드 작성후, 메서드 호출
		
		getAllList 가 할일 :
		/replies/all/{num} 요청을 보내고
		응답(json)이 오면 응답을 이용하여 댓글 리스트 만들기
		*/
		function getAllList(){
			$.ajax({
				url:"${pageContext.request.contextPath}/replies/all/" + num,
				type:"GET",
				dataTyape:"json",
				success : function(data){
					
					//alert(data);
					//alert("성공");	
					//json형태로 댓글 리스트를 받게 됩니다. 
					//json 형태의 data를 이용해서 댓글 리스트를 출력
				    // li형태의 리스트로 만들고
				   /*
				   <li> reply내용 rno, replytext </li>
				   */
				     //li 리스트롤 ul html로 붙이기 
				     //for each
				   var str = "";  //우리가 작성할 <li></li>를 작성 
				   
				   
				   $(data).each(function(){
					 var date = new Date(this.regdate);
					
					   var d = date.getDate();
					   var m =  date.getMonth();
					   m += 1;  // JavaScript months are 0-11
					   var y = date.getFullYear();

		 str += "<h3> &mdash;&emsp;" + this.replyer + "</h3> "
			+ "<li data-rno='"+this.rno+"' class = 'replyLi'>"
			+ "<blockquote>"+this.replytext+ "&nbsp;<button class='icon-edit'></button></blockquote></li>";

					   $("#replies").html(str);
				   }); 
				},
				error : function(request,status,error){
					alert("code :" + request.status +"\n"
							+"message : " + request.responseText +"\n"
							+"error :" + error);
				}
			});
			
			$("#feed").load(window.location.href+"#div replies");
		}
		
		/*
			<li> 달려있는 수정 버튼에 이벤트 처리 하기
			ajax통신 후에 생기는 요소들 이기 때문에 이벤트 처리시에 기존에 존재하는
			부모요소(ul) 을 기준으로 처리
			
			id가 replies인 요소 하위 요소 중 
			class가 replyLi 인 요소의 button이 눌리면 동작 
		*/
		$("#replies").on("click",".replyLi button",function(){
			
			//수정 버튼이 눌리면... 기존의 댓글을 가져와서
			//모달에 표시, 모달 title 에는 댓글 번호 넣기
			
			var reply = $(this).parent().parent();   //각각 li 를 선택함
			var replytext = reply.text();
			var rno = reply.attr("data-rno");
			
			$(".modal-title").html(rno);
			$("#modal-replytext").val(replytext);
			$("#modDiv").show("slow");
		});
		
		$("#closeBtn").on("click",function(){
			$("#modDiv").hide("slow");
		});
		
		
		$("#replyModBtn").on("click",function(){
			
			//모달 창 수정버튼 클릭
			//모달창에 replyText를 업데이트 요청 보내기
			//결과를 받아서 리스트로 출력 >> getAllList()
			//  replies + rno
			
// 			alert("123123123");
			
			var rno = $(".modal-title").html();
			var replytext = $("#modal-replytext").val();
			
			$.ajax({
				type : "post",
				url  : "${pageContext.request.contextPath}/replies/"+rno,
				datatype : "text",
				data : {
					replytext : replytext
				},
				success : function(result){
					if(result =="SUCCESS"){
						alert("수정 되었습니다.");
						$("#modDiv").hide("slow");
						getAllList();
					}
				},
				error : function(request,status,error){
					alert("수정 권한이 없습니다.");
					$("#modDiv").hide("slow");
				}
			});
		});
		
		$("#replyDelBtn").on("click",function(){
			//삭제요청을 보내고 결과에 대한 응답을 받는다. 
			var rno = $(".modal-title").html();
			$.ajax({
				type : "delete",
				url  : "${pageContext.request.contextPath}/replies/" + rno,
				datatype : "text",
				success : function(result){
					if(result == "SUCCESS"){
						alert("삭제 되었습니다.");
						$("#modDiv").hide("slow");
						getAllList();
					}
				},
				error : function(request,status,error){
					alert("삭제 권한이 없습니다.");
					$("#modDiv").hide("slow");
				}
				
			});
				
		});
		//삭제버튼 이벤트 등록 > 컨트롤러 작성
		//>응답처리 
		
	}); //$(function) end
</script>
<c:set var="cat_id" value="${product.cat_id}" />
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
				<h2>Product Details</h2>
				<p>We offers a wide and appealing array of absolutely fresh produce, seasonal as well as year-round. Fruits in season and all manner of vegetables are truly fresh. Browse the aisles for everything from grapes to bananas to lettuce and limes. </p>
			</div>

	<div id="fh5co-product">
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1 animate-box">
						<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">	
							<img src="${product.image}" alt="user"  width="500px">
						</div>
					<div class="row animate-box">
						<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">

							<h2>${product.p_name}</h2>
							<p>
								<a href="productCart?num=${param.num}" class="btn btn-primary btn-outline btn-lg" onclick="return cartCheck()">Add to Cart</a>
								<a href="productList?cat_id=${product.cat_id}" class="btn btn-primary btn-outline btn-lg">List</a>
							<% String user_id = (String)session.getAttribute("userid"); %>
							<%if(user_id==null){%>
							<%}else if(user_id.equals((String)"owner")){%>
								<a href="productUpdate?num=${param.num}" class="btn btn-primary btn-outline btn-lg">Update</a>
								<a href="productDelete?num=${param.num}" class="btn btn-primary btn-outline btn-lg" onclick="return deleteCheck()">Delete</a>
							<%}%>

							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<div class="fh5co-tabs animate-box">
						<ul class="fh5co-tab-nav">
							<li class="active"><a href="#" data-tab="1"><span class="icon visible-xs"><i class="icon-file"></i></span><span class="hidden-xs">Product Details</span></a></li>
							<li><a href="#" data-tab="2"><span class="icon visible-xs"><i class="icon-bar-graph"></i></span><span class="hidden-xs">Specification</span></a></li>
							<li><a href="#" data-tab="3"><span class="icon visible-xs"><i class="icon-star"></i></span><span class="hidden-xs">Ratings</span></a></li>
						</ul>

						<!-- Tabs -->
						<div class="fh5co-tab-content-wrap">

							<div class="fh5co-tab-content tab-content active" data-tab-content="1">
								<div class="col-md-10 col-md-offset-1">
									<span class="price">\<fmt:formatNumber pattern="###,###,###" value="${product.price}" /></span>
									<h2>${product.p_name}</h2>
									<p>${product.specification}</p>
								</div>
							</div>

							<div class="fh5co-tab-content tab-content" data-tab-content="2">
								<div class="col-md-10 col-md-offset-1">
									<h3>Product Specification</h3>
									<p>${product.descript}</p>
								</div>
							</div>

							<div class="fh5co-tab-content tab-content" data-tab-content="3">
							
								<div class="col-md-10 col-md-offset-1">
								<h3>Happy Buyers</h3>
								<form name = "replyForm" id = "replyForm">
									<div class="row form-group">
										<div class="col-md-12">
											<input type = "text" name = "replytext" id = "replytext" class="form-control" placeholder="content"/>	
										</div>
									</div>
									<div class="form-group">
										<input type = "submit" value = "등록"  class="btn btn-primary">
									</div>
								</form>
								
								<!-- replies에다가 댓글 목록을 출력 -->

									<div class="feed">
										<div>
											 <div id = "modDiv" style="display: none;">
												<div class = "modal-title"></div>
												<div>
													<input type = "text" class="form-control" id = "modal-replytext" placeholder="content"/>
												</div>
												<div>
													<button type = "button" id = "replyModBtn" class="icon-edit"></button>
													<button type = "button" id = "replyDelBtn" class="icon-trash"></button>
													<button type = "button" id = "closeBtn" class="icon-delete"></button>
												</div>
											</div>
												<ul id = "replies">
												</ul>
										</div>
									</div>
								</div>
							</div>

						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
			
		</div>
	</div>
</div>
</body>
<script src="js/board.js"></script>
<%@ include file="/layout/footer.jsp"%>