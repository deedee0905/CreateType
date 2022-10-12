<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<script
	  src="https://code.jquery.com/jquery-3.6.0.min.js"
	  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	  crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<title>포스트</title>
</head>
<body>
	<div class="container">
	
		<header>
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
		</header>
	
		<section>
			<div>
				<%--헤더 --%>
				<div class="d-flex justify-content-between mt-3">
					<div>
						<div><h2>${post.title }</h2></div>
						<div><h4>${post.subtitle }</h4></div>
					</div>
					
					<div>
						<a href="#" class="btn btn-outline-secondary btn-sm mt-5"> 수정하기</a>
					</div>
				</div>
				
				<hr>
				
				<%--본문 --%>
				<div>
					<div>
						<p>
							${post.content }
						</p>
					</div>
				</div>
				
				<hr>
				<%--프로필 영역 --%>
				<div class="d-flex justify-content-center mt-2 mb-2">
					<div class="text-center post-detail-channelbox border border-secondary rounded p-4" >
						<img class="rounded" width="80" height="80" alt="프로필사진" src="https://cdn.pixabay.com/photo/2022/09/15/06/14/pattern-7455773_960_720.png"><br>
						<label class="mt-1 font-weight-bold">채널이름(My channel)</label> <br>
						<span>상태메세지 (ex. 개발은 롤러코스터)</span>
					</div>
				</div>
				
				<%-- 좋아요, view 카운트 --%>
				<div class="mt-2">
				
				<c:choose>
					<%-- 로그인한 사용자가 좋아요를 누른 게시물 --%>
						<c:when test="${like}">
							<a id="deleteLike" href="#" data-post-id="${post.id }"><i class="bi bi-heart-fill text-danger ml-2"></i></a>
							
						</c:when>
					<%-- 로그인한 사용자가 좋아요를 누르지 않은 게시물 --%>
						<c:otherwise>
							<a id="addLike" href="#" data-post-id="${post.id }"><i class="bi bi-heart text-danger"></i></a>
						</c:otherwise>
				</c:choose>
				
					<span class="ml-2">조회수 ${count }</span>
					<span class="ml-2"> 2022.10.05</span>
				</div>
				
				<hr>
				
				<%--덧글 영역 --%>
				<div>
					<div>
						<span class="font-weight-bold" style="font-size:20px">덧글</span> <br>
						
						<c:forEach var="comment" items="${commentList }">
						<div class="d-flex justify-content-between mt-3">
							<div class="d-flex">
								<img class="rounded" width="50" height="50" alt="" src="https://cdn.pixabay.com/photo/2016/04/06/10/08/background-1311251_960_720.jpg">
								<span class="font-weight-bold ml-2 mt-2">너부리</span>
									<span class="ml-1 mt-2">${comment.comment}</span>
							</div>
							
							<div>
								<a href="#" data-toggle="modal" data-target="#deleteModal" class="more-btn" data-comment-id="${comment.id }"><i class="bi bi-three-dots mr-3 text-dark"></i></a>
							</div>
						</div>
						<hr>
						</c:forEach>
						
						
				
				
						
						<div>
							<div class="d-flex">
								<input id="commentInput" class="form-control" type="text" placeholder="댓글을 입력하세요">
								<button id="commentSaveBtn" class="btn btn-primary text-white ml-3" value="${post.id}">덧글입력</button>
								<button class="btn btn-primary text-white ml-1" data-toggle="modal" data-target="#exampleModal">후원하기</button>
							</div>
						</div>
						
					</div>
				</div>
				
			</div>
		</section>
	
		<footer>
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		</footer>
	</div>
	
	<%-- 모달 --%>
	<div class="modal fade" id="exampleModal" tabindex="-1">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">후원하기</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      
	        <table class="table text-center">
	        	<thead>
	        		<tr>
	        			<th>보유 포인트</th>
	        			<th>사용할 포인트</th>
	        			<th>남은 포인트</th>
	        		</tr>
	        	</thead>
	        		
	        	<tbody>
	        		<tr>
	        			<c:set var="point" value="5000"/>
	        			<td><fmt:formatNumber value="${point }" type="number" /></td>
	        			<td><input class="form-control form-control-sm"></td>
	        			<td><fmt:formatNumber value="${point }" type="number"/></td>
	        		</tr>
	        	</tbody>
	        </table>
	        
	        <hr>
	        
	        <div class="mt-2" style="font-size:12px">
	        	주식회사 크리에이트타입은 회원 상호 간 콘텐츠 거래를 위한 중개 시스템을 제공할 뿐, 회원을 대리하지 않습니다. 
	        	환급, 취소 등 회원 간 성립된 거래에 대한 모든 책임은 회원이 직접 부담합니다. <br>
	        	자세한 내용은 서비스 이용 전 동의하신 <span class="text-primary">이용약관</span>을 참고해주세요.
	        </div>
	        
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	        <button id="btn" type="button" class="btn btn-primary">후원하기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<%--삭제 modal --%>
	<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" ">
		  
		</button>
		
		<!-- Modal -->
		<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel"> 덧글 삭제</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body d-flex justify-content-center">
		        <button id="commentDeleteBtn" class="btn btn-danger">삭제하기</button>
		      </div>
		      <div class="modal-footer">

		      </div>
		    </div>
		  </div>
		</div>
	

<script>

	$(document).ready(function() {
		
		
		$("#commentDeleteBtn").on("click", function() {
			let id = $(this).data("comment-id");
			
			$.ajax({
				type:"get"
				, url:"/post/comment/delete"
				, data:{"id":id}
				,success: function(data) {
					if(data.result == "success"){
						location.reload();
						return;
					} else {
						alert("덧글삭제 실패");
					}
						
				}
				,error: function() {
					alert("덧글삭제 에러");
				}
			});
			
		});
		
		
		$(".more-btn").on("click", function(e) {
			e.preventDefault();
			
			let id = $(this).data("comment-id");
			
			$("#commentDeleteBtn").data("comment-id", id);
			return;
		});
		
		
		$("#commentSaveBtn").on("click", function(e) {
			e.preventDefault();
			
			let postId = $("#commentSaveBtn").val();
			let comment = $("#commentInput").val();
			
			if(comment == ""){
				alert("덧글 내용을 입력하세요");
				return;
			}
			
			$.ajax({
				type:"post"
				, url:"/post/comment/insert"
				, data:{"postId":postId, "comment":comment}
				, success:function(data) {
					
					if(data.result == "success"){
						location.reload();
					} else {
						alert("덧글입력 실패");
					}
				}
				, error:function() {
					alert("덧글입력 에러");
				}
			});
			
			
		});
		
		$("#addLike").on("click", function(e) {
			e.preventDefault();
			
			let postId = $(this).data("post-id");
			
			$.ajax({
				type:"get"
				, url:"/post/like/insert"
				, data:{"postId":postId}
				, success:function(data) {
					
					if(data.result == "success"){
						alert("좋아요 체크 완료");
						location.reload();
						return;
					} else{
						alert("좋아요 체크 실패");
						return;
					}
				}
				, error:function() {
					alert("좋아요 체크 에러");
				}
			});
			
		});
		
		
		
		$("#deleteLike").on("click", function(e) {
			e.preventDefault();
			
			let postId = $(this).data("post-id");
			
			$.ajax({
				type:"get"
				,url:"/post/like/delete"
				,data:{"postId":postId}
				,success: function(data) {
					
					if(data.result == "success"){
						alert("좋아요 삭제 성공");
						location.reload();
					} else {
						alert("좋아요 삭제 실패");
					}
				}
				,error: function() {
					alert("좋아요 삭제 에러");
				}
			});
		});
		
		
		
		
		
	});
	

</script>

</body>
</html>