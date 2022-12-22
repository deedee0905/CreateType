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
<title>커미션 포스트</title>
</head>
<body>
	
	<div class="container">
		<header>
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
		</header>
	
		<section>
			<div  class="d-flex justify-content-center">
				<div>
					<img width="300" height="400" alt="그림 샘플" src="${postInfo.thumbnail }">
				</div>
				
				<div class="ml-3" id="infoBox" style="width: 380px">
					<div>
						<div class="d-flex justify-content-between">
							<div>
								<label class="font-weight-bold" style="font-size:25px">${postInfo.title }</label>
								<div class="mb-2">
									<c:choose>
										<c:when test="${postInfo.deadline == 0 && postInfo.userId == userId}">
											<label class="text-danger">*신청마감하신 커미션 포스트입니다.</label>
										</c:when>
										
										<c:when test="${postInfo.userId == userId && postInfo.deadline != 0 }">
											<a href="/commision/postUpdate/view?id=${postInfo.id }&channelId=${postInfo.channelId}" class="btn btn-dark btn-sm">수정하기</a>
											<button class="btn btn-dark ml-1 btn-sm" data-toggle="modal" data-target="#exampleModal">마감하기</button>
										</c:when>
									</c:choose>
								
									
									
								</div>
							</div>
							
							<c:choose>
							
								<c:when test="${postInfo.userId == userId }">
									<%--본인이 쓴 게시물일 경우 북마크 기능 활성화 x  --%>
								</c:when>
								
								<c:when test="${bookmark == 0 }">
									<a id="bookmarkInsert"><i class="bi bi-bookmark text-warning" style="font-size:25px"></i></a>
								</c:when>

								<c:otherwise>
									<a id="bookmarkDelete"><i class="bi bi-bookmark-check-fill text-warning" style="font-size:25px"></i></a>
								</c:otherwise>
							</c:choose>
							
							
						</div>
						
						<div class="d-flex">
							<a href="/individual/channel/view?channelId=${postInfo.channelId }"><img class="rounded" width="35" height="35" alt="프로필 사진" src="${userInfo.profileImagePath }"></a>
							<a href="/individual/channel/view?channelId=${postInfo.channelId }" style="text-decoration:none" class="mt-1 ml-1 text-dark font-weight-bold">${userInfo.nickname }</a> <br>
						</div>
						<label class="mt-1">
							<fmt:formatNumber value="${postInfo.minimumPrice }" type="number"/>원
							~ 
							<fmt:formatNumber value="${postInfo.maximumPrice }" type="number"/>원
						</label> 
						
						<br>
						
						<c:choose>
							<c:when test="${postInfo.deadline == 0 }">
								<%-- `deadline` 컬럼이 0인 경우 nn일 이내 전달 문구 숨기기 --%>
							</c:when>
							
							<c:otherwise>
								<label>${postInfo.deadline }일 이내 전달</label> <br>
							</c:otherwise>
						</c:choose>
						
						<c:if test="${postInfo.deadline == 0 && postInfo.userId != userId}">
							<label class="text-danger font-weight-bold">*신청이 마감된 커미션입니다.*</label> <br>　 
						</c:if>
						
						<div style="height: 117px">
							<%-- 버튼 높이 맞추기용 --%>
						</div>
						
						<c:choose>
							<c:when test="${userId eq postInfo.userId}">
							</c:when>
							
							<c:when test="${postInfo.deadline == 0 }">
							</c:when>
							
							<c:when test="${userId != null and userId != postInfo.userId}">
								<a href="/commision/proposal/view?commisionPostId=${postInfo.id }&userId=${postInfo.userId}" class="btn btn-dark btn-lg form-control mt-5 text-white" style="position:relative; bottom:50;">
									신청하기
								</a>
							</c:when>
							
							<c:otherwise>
								<a id="notLoginInsertBtn" class="btn btn-dark btn-lg form-control mt-5 text-white" style="position:relative; bottom:50;">신청하기</a>
							</c:otherwise>
						</c:choose>
						
						
					</div>
				</div>
			</div>
			
			<hr>
			<div class="d-flex justify-content-center">
				<div style="width: 600px; " class="text-center mt-3 mb-5">
					${postInfo.content }
				
				</div>
			</div>
			
		</section>
	
	
		<footer>
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		</footer>
	</div>
	
	<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">커미션 포스트 마감</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       해당 커미션 신청을 마감하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button id="finishBtn" type="button" class="btn btn-danger">마감하기</button>
      </div>
    </div>
  </div>
</div>
	
	<script>
		$(document).ready(function() {
			
			$("#finishBtn").on("click", function(){
				
				let commisionPostId = ${postInfo.id}
				let deadline = 0;
				let url = "/commision/postObject/view?id=" + ${postInfo.id} + "&channelId=" + ${postInfo.channelId}
				
				$.ajax({
					type:"get"
					, url:"/commision/finish"
					, data:{"commisionPostId":commisionPostId, "deadline":deadline}
					, success : function(data){
						
						if(data.result == "success"){
							location.href = url
							return;
						} else {
							alert("커미션 포스트 마감 실패");
							return;
						}
						
					}
					, error : function(){
						alert("커미션 포스트 마감 에러");
						return;
					}
					
				});
				
			});
			
			$("#notLoginInsertBtn").on("click", function(e) {
				e.preventDefault();
				
				alert("로그인한 이용자만 신청이 가능합니다.");
				return;
				
			});
			
			$("#bookmarkInsert").on("click", function(e) {
				e.preventDefault();
				
				let postId = ${postInfo.id}
				let channelId = ${postInfo.channelId}
				
				if(${userId == null}){
					alert("로그인한 이용자만 게시물을 북마크 할 수 있습니다.");
					return;
				}
				
				$.ajax({
					type:"get"
					,url:"/commision/bookmark/insert"
					,data:{"postId":postId, "channelId":channelId}
					,success: function(data){
						if(data.result == "success"){
							location.reload();
							return
						} else {
							alert("북마크 체크 실패");
							return;
						}
					}
					,error: function(){
						alert("북마크 체크 오류");
					}
					
				});
				
				
			});
			
			$("#bookmarkDelete").on("click", function(e) {
				e.preventDefault();
				
				let postId = ${postInfo.id}
				let channelId = ${postInfo.channelId}
				
				$.ajax({
					type:"get"
					,url:"/commision/bookmark/delete"
					,data:{"postId":postId, "channelId":channelId}
					,success: function(data){
						if(data.result == "success"){
							location.reload();
							return
						} else {
							alert("북마크 해제 실패");
							return;
						}
					}
					,error: function(){
						alert("북마크 해제 오류");
					}
					
				});
				
			
			});
			
			
		});
	
	</script>

</body>
</html>