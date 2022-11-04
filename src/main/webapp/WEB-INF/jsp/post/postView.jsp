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
						<div><h2>${post.title } </h2></div>
						<div><h4>${post.subtitle }</h4></div>
					</div>
					
					<div>
						<c:choose>
							<c:when test="${userId eq post.userId}">
								<a href="/post/update?id=${post.id }" class="btn btn-outline-secondary btn-sm mt-5 mr-3"> 수정하기</a>
								<a href="#" data-toggle="modal" data-target="#postDeleteModal"  class="btn btn-outline-secondary btn-sm mt-5 mr-3"> 삭제하기</a>
							</c:when>
							
							<c:otherwise>
								
							</c:otherwise>
							
						</c:choose>	
					</div>
				</div>
				
				<hr>
				
				<%--본문 --%>
				<div>
					<div>
						<c:choose>
							<%--포스트 작성자가 로그인한 상황인 경우 --%>
							<c:when test="${post.userId == userId }">
								<p>
									${post.content }
								</p>
							</c:when>
							
							<%--구매한 포스트인 경우 --%>
							<c:when test="${record > 0 }">
								<p>
									${post.content }
								</p>
							</c:when>
						
							<%--price컬럼의 값이 0이 아니고, 포스트를 구매하지 않은 경우 --%>
							<c:when test="${post.price != null }">
								<div class="text-center mt-5 mb-5 border border-outline-secondary p-3">
									이어지는 내용이 궁금하세요? 포스트를 구매하고 이어지는 내용을 감상해보세요. <br>
									<c:choose>
									
										<%--포스트 구매x, 로그인X인 상황 --%>
										<c:when test="${userId == null }">
											<button id="notLoginPurchaseBtn" class="btn btn-dark mt-3">구매하기</button>
										</c:when>
										
										<%--포스트 구매x, 로그인O인 상황 --%>
										<c:otherwise>
											<button class="btn btn-dark mt-3" data-toggle="modal" data-target="#purchase">구매하기</button>
										</c:otherwise>
									</c:choose>
								</div>
							</c:when>
							
							<%--post테이블의 price 컬럼 값이 0인 경우 --%>
							<c:otherwise>
								<p>
									${post.content }
								</p>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				
				<hr>
				<%--프로필 영역 --%>
				<div class="d-flex justify-content-center mt-2 mb-2">
					<div class="channel-box text-center  border border-secondary rounded p-4" >
						<a href="/individual/channel/view?channelId=${channel.id }" style="text-decoration:none">
							<img class="rounded" width="80" height="80" alt="프로필사진" src="${channel.channelImagePath }"><br>
						</a>
						<a href="/individual/channel/view?channelId=${channel.id }" style="text-decoration:none">
							<label class="mt-1 font-weight-bold text-dark">${channel.channelName }</label> <br>
							<span class="text-dark">${channel.channelInfo }</span> <br>
						</a>
						
					<c:choose>
                     
                     <%--본인이 쓴 게시글인 경우 --%>
	                     <c:when test="${post.channelId eq channelId }">
	                     </c:when>
	                     
                     <%--구독한 상태 --%>
	                     <c:when test="${subscription  > 0 && userId != null}">
	                        <button id="subscriptionCancelBtn" class="btn btn-dark mt-3" data-channel-id="${post.channelId }"><i class="bi bi-clipboard-check text-white mr-1"></i></i>구독중</button>
	                     </c:when>
                     
                     <%--구독하지 않은 상태 --%>
	                     <c:when test="${subscription == 0 && userId != null}">
	                        <button id="subscriptionBtn" class="btn btn-dark mt-3">구독하기</button>
	                     </c:when>
	                     
	                 <%--로그인하지 않은 상태 --%>
	                 	<c:otherwise>
	                 		<button id="notLoginSubscription" class="btn btn-dark mt-3">구독하기</button>
	                 	</c:otherwise>
	                     
                  	</c:choose>
						
					</div>
				</div>
				
				<%-- 좋아요, view 카운트 --%>
				<div class="mt-2">
				
				<c:choose>
					<%-- 로그인한 사용자가 좋아요를 누른 게시물 --%>
						<c:when test="${like > 0 && userId != null}" >
							<a id="deleteLike" href="#" data-post-id="${post.id }"><i class="bi bi-heart-fill text-danger ml-2"></i></a>
						</c:when>	
						
					<%-- 로그인한 사용자가 좋아요를 누르지 않은 게시물 --%>
						<c:when test="${like == 0 && userId != null}">
							<a id="addLike" href="#" data-post-id="${post.id }"><i class="bi bi-heart text-danger ml-2"></i></a>
						</c:when>
						
						<c:otherwise>
							<a id="notLoginLike" href="#"><i class="bi bi-heart text-danger ml-2"></i></a>
						</c:otherwise>
				
				</c:choose>
					<span class="ml-2">조회수 ${count }</span>
					<span class="ml-2"><fmt:formatDate value="${post.createdAt }" pattern="yyyy년 MM월 dd일"/></span>
				</div>
				
				<hr>
				
				<%--덧글 영역 --%>
				<div>
					<div>
						<span class="font-weight-bold" style="font-size:20px">덧글</span> <br>
						
						<c:forEach var="comment" items="${commentList }">
						<div class="d-flex justify-content-between mt-3">
							<div class="d-flex">
							<a href="/individual/profile/view?userId=${comment.user.id }&channelId=${comment.comment.channelId }">
								<img class="rounded" width="50" height="50" alt="프로필 사진" src="${comment.user.profileImagePath }">
							</a>	
								<a href="/individual/profile/view?userId=${comment.user.id }&channelId=${comment.comment.channelId }" style="text-decoration:none">
									<label class="font-weight-bold ml-2 mt-2 text-dark">${comment.user.nickname}</label>
								</a>
									<label class="ml-1 mt-2">${comment.comment.comment }</label>
							</div>
							
							<c:choose>
								<c:when test="${userId != comment.user.id }"></c:when>
								
								<c:otherwise>
									<div>
										<a href="#" data-toggle="modal" data-target="#commentDeleteModal" class="more-btn" data-comment-id="${comment.comment.id }"><i class="bi bi-three-dots mr-3 text-dark"></i></a>
									</div>
								</c:otherwise>
							</c:choose>
							
						</div>
						<hr>
						</c:forEach>
						
						
				
				
						
						<div>
							<div class="d-flex">
								<input id="commentInput" class="form-control" type="text" placeholder="댓글을 입력하세요">
								
								<c:choose>
									<%--로그인 된 상태 --%>
									<c:when test="${userId != null }">
										<button id="commentSaveBtn" class="btn btn-primary text-white ml-3" value="${post.id}">덧글입력</button>
										<button class="btn btn-primary text-white ml-1" data-toggle="modal" data-target="#exampleModal">후원하기</button>
									</c:when>
									
									<%--로그인 안된 상태 --%>
									<c:otherwise>
										<button id="notLoginCommentBtn" class="btn btn-primary text-white ml-3">덧글입력</button>
										<button id="notLoginSponsorshipBtn" class="btn btn-primary text-white ml-1">후원하기</button>
									</c:otherwise>
								</c:choose>
								
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
	
	<%--후원하기 모달 --%>
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
	        			
	        		</tr>
	        	</thead>
	        		
	        	<tbody>
	        		<tr>
	        			<c:set var="totalPoint" value="${point }"/>
	        			<td><fmt:formatNumber value="${totalPoint }" type="number" /></td>
	        			<td><input id="sponsorshipInput" class="form-control form-control-sm"></td>
	        			
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
	        <button id="sponsorshipBtn" type="button" class="btn btn-primary">후원하기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<%--덧글삭제 modal --%>
	<!-- Button trigger modal -->
		
		
		<!-- Modal -->
		<div class="modal fade" id="commentDeleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
		
		
		<!--포스트 삭제 Modal -->
		<div class="modal fade" id="postDeleteModal" tabindex="-1">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel"></h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      	
		        <h5>정말 포스트를 삭제하시겠습니까?</h5>
		        
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		        <button id="postDeleteBtn" type="button" class="btn btn-danger">삭제하기</button>
		      </div>
		    </div>
		  </div>
		</div>
	
	<%--구매하기 모달 --%>
	<div class="modal fade" id="purchase" tabindex="-1">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">구매하기</h5>
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
	        			<c:set var="totalPoint" value="${point }"/>
	        			<td><fmt:formatNumber value="${totalPoint }" type="number" /></td>
	        			<td><fmt:formatNumber value="${post.price }" type="number" /></td>
	        			<td><fmt:formatNumber value="${totalPoint - post.price }" type="number"/></td>
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
	        <button id="postPurchaseBtn" type="button" class="btn btn-primary">구매하기</button>
	      </div>
	    </div>
	  </div>
	</div>
	

<script>

	$(document).ready(function() {
		
		
		$("#notLoginSponsorshipBtn").on("click", function(e) {
			e.preventDefault();
			
			alert("로그인한 사용자만 후원하기 기능을 이용할 수 있습니다.");
			return;
		});
		
		$("#sponsorshipBtn").on("click", function(e) {
			e.preventDefault();
		
			let methodOfPayment = "후원";
			let price = -$("#sponsorshipInput").val();
			let balance = ${point} + price;
			let postId = ${post.id}
			
			if(balance < 0){
				alert("보유한 포인트 금액이 부족합니다.");
				return;
			}
			
			$.ajax({
				type:"get"
				, url:"/post/purchase"
				, data:{"methodOfPayment":methodOfPayment, "price":price, "postId":postId}
				, success: function(data){
					
					if(data.result == "success"){
						location.reload();
					} else {
						alert("후원 실패");
						return;
					}
					
				}
				, error: function(){
					alert("후원 에러");
					return;
				}
			});
			
		});
		
		
		
		$("#notLoginPurchaseBtn").on("click", function(e) {
			e.preventDefault();
			
			alert("포스트 구매는 로그인한 사용자만 이용할 수 있습니다.");
			location.href="/user/signin/view";
		});
		
		$("#postPurchaseBtn").on("click", function(e) {
			e.preventDefault();
			
			let methodOfPayment = "구매";
			let price = -${post.price}
			let postId = ${post.id}
			
			let balance = ${point} - ${post.price}
			
			if(balance < 0){
				alert("보유하고 있는 포인트가 부족합니다.");
				return;
			}
			
			$.ajax({
				type:"get"
				, url:"/post/purchase"
				, data:{"methodOfPayment":methodOfPayment, "price":price, "postId":postId}
				, success: function(data){
					
					if(data.result == "success"){
						location.reload();
					} else {
						alert("구매 실패");
						return;
					}
					
				}
				, error: function(){
					alert("구매 에러");
					return;
				}
			});
			
		});
		
		$("#notLoginCommentBtn").on("click", function(e) {
			e.preventDefault();
			
			alert("덧글입력은 로그인 이용자만 사용이 가능합니다.");
			return;
			
		});
		
		$("#notLoginSubscription").on("click", function(e) {
			e.preventDefault();
			
			alert("채널 구독은 로그인 이용자만 사용이 가능합니다.");
			return;
		});
		
		$("#subscriptionCancelBtn").on("click", function(e) {
			e.preventDefault();
			
			let channelId = ${post.channelId}
			
			
			
			$.ajax({
				type:"get"
				, url:"/individual/subscription/delete"
				, data:{"channelId":channelId}
				, success: function(data){
					if(data.result == "success"){
						location.reload();
						return;
					} else {
						alert("구독취소 실패");
						return;
					}
				}
				, error: function(){
					alert("구독취소 에러");
				}
				
			});
			
		});
		
		
		$("#subscriptionBtn").on("click", function(e) {
			e.preventDefault();
			
			let channelId = ${post.channelId};
			
			
		
			$.ajax({
				type:"get"
				, url:"/individual/subscription/insert"
				, data:{"channelId":channelId}
				, success:function(data){
					if(data.result == "success"){
						location.reload();
						return;
					} else {
						alert("구독 실패");
						return;
					}
				}
				, error:function(){
					alert("구독하기 에러");
				}
			});
			

			
		});
		
		
		$("#postDeleteBtn").on("click", function() {
			
			let channelId = ${post.channelId}
			let id = ${post.id}
			let url = "/post/createList/view?category=" + ${post.category}
			
			$.ajax({
				type:"get"
				, url:"/post/create/postDelete"
				, data:{"channelId":channelId, "id":id}
				,success: function(data) {
					
					if(data.result == "success"){
						location.href=url;
						return;
					} else {
						alert("포스트 삭제 실패");
						return;
					}
					
				}
				,error: function() {
					alert("포스트 삭제 에러");
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
				, success: function(data){
					
					if(data.result == "success"){
						
						location.reload();
						return;
					} else {
						alert("좋아요 체크 실패");
					}
					
				}
				, error: function(){
					alert("좋아요 체크 에러");
				}
				
			});
			
			
		});
		
		$("#notLoginLike").on("click", function() {
			alert("좋아요 체크는 로그인한 사용자만 이용이 가능합니다.");
			return;
			
		});
		
		
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
					alert("로그인시 덧글 입력이 가능합니다.");
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