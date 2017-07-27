<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/layout/header.jsp"%>
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
				url: "${pageContext.request.contextPath}/replies2",
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
					alert("실패");
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
				url:"${pageContext.request.contextPath}/replies2/all/" + num,
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

		 str += "<h3> &mdash;" + this.replyer + "</h3> "
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
				url  : "${pageContext.request.contextPath}/replies2/"+rno,
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
				url  : "${pageContext.request.contextPath}/replies2/" + rno,
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
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm"
	role="banner" style="background-image: url(images/111.jpg);">
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2 text-center">
				<div class="display-t">
					<div class="display-tc animate-box" data-animate-effect="fadeIn">
						<h1>Recipe</h1>
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
				<h2>Recipe Details</h2>
				<p>Find and share everyday cooking inspiration on <b>saladseller</b>.<br> Discover recipes, cooks, and how-tos.</p>
			</div>

	<div id="fh5co-product">
		<div class="container">
			<div class="about-content">
				<div class="row animate-box">
					<div class="col-md-6">
						<h2 align="center">&lt; ${board.title} &gt;</h2>
						<img class="img-responsive" src="images/${board.fullname}" alt="about"><br>
							<p align="right">
							<% String user_id = (String)session.getAttribute("userid"); %>
							<%if(user_id==null){%>
							<%}else if(user_id.equals((String)"owner")){%>
								<a href="recipeModifyForm?num=${board.num}" class="btn btn-primary btn-outline btn-lg">Update</a>
								<a href="recipeDelete?num=${board.num}" class="btn btn-primary btn-outline btn-lg" onclick="return deleteCheck()">Delete</a>
							<%}%>
								<a href="recipe" class="btn btn-primary btn-outline btn-lg">List</a>
								
							</p>
					</div>
					<div class="col-md-6">
						<div class="desc">
							<br>
							<br>
							<h3>Meterials</h3>
							<p>${board.content1}</p>
						</div>
						<div class="desc">
							<h3>Recipe</h3>
							<p>${board.content2}</p>
						</div>
					</div>
		<div class="fh5co-tab-content-wrap">
			<div class="fh5co-tab-content tab-content active" data-tab-content="1">
			<div class="col-md-10 col-md-offset-1">

					<div class="col-md-12">
					<br><br><br>
								<h3>Comments</h3>
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
		<script src="js/board.js"></script>	
</body>

<%@ include file="/layout/footer.jsp"%>