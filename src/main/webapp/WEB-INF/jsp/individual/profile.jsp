<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<title>개인페이지</title>



</head>
<body>

		<div class="container">
			<header>
				<c:import url="/WEB-INF/jsp/include/header.jsp" />
			</header>
			
			<section>
				<div class="d-flex justify-content-center mt-5">
					<div class="text-center">
						<img class="rounded" width="100" height="100" alt="프로필 사진" src="${user.profileImagePath }">
						<br>
						<h5 class="mt-3 font-weight-bold">${user.nickname }</h5>
						
						<c:choose>
							<c:when test="${userIdNumber eq userId }">
								<a href="/individual/profile/setting/view" class="btn btn-outline-secondary mt-3 mb-5">프로필 편집</a>
							</c:when>
							
							<c:when test="${userNumber eq null }">
								<div class="text-center mt-3">
									메세지 기능은 로그인한 이용자만 이용할 수 있습니다.
								</div>
							</c:when>
							
							<c:otherwise>
								<button id="messageBtn" type="button" class="btn btn-outline-primary mt-2" data-toggle="modal" data-target="#exampleModal">메세지 하기</button>
							</c:otherwise>
						</c:choose>
						
						
					</div>
				</div>
				
				<div class="mb-5">
					<h4>채널</h4>
					<hr>
					
						<c:choose>
							<c:when test="${channel.id > 0}">
								<div class="d-flex">
									<a href="/individual/channel/view?channelId=${channel.id}"><img class="rounded" width="100" height="100" alt="채널 프로필 이미지" src="${channel.channelImagePath }"></a>
									<div class="mt-3 ml-2">
										<a href="/individual/channel/view?channelId=${channel.id}" style="text-decoration:none"><h5 class="font-weight-bold text-dark">${channel.channelName }</h5>
										<span class="text-secondary">구독자 ${subscriber }명</span></a>
									</div>
								</div>
								<div class="mt-3 text-secondary">
									${channel.channelInfo }
								</div>
							</c:when>
						
						
							<c:otherwise>
								<div>
									<span class="text-secondary mt-1">아직 채널이 없습니다.</span> <br>
									
									<c:choose>
										<c:when test="${channelId == -1 && id == userId}">
											<a href="/individual/channel/create/view" class="btn btn-outline-secondary mt-3" href="#">채널 만들기</a>
										</c:when>
										
										<c:otherwise></c:otherwise>
									</c:choose>
									
									
								</div>
							</c:otherwise>
						</c:choose>
					
				</div>
				
			</section>
			
			<footer>
				<c:import url="/WEB-INF/jsp/include/footer.jsp" />
			</footer>
		
		</div>
		
		<%-- 모달 --%>
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Direct message</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		          <div class="rounded p-1 border border-outline-info" style="width:465px">
		            <c:forEach var="dms" items="${dms }">
		            	<c:choose>
	            		<c:when test="${dms.userId == userId }">
		            			<div class="text-right">
		            				<label class="text-info border border-outline-secondary rounded p-1">${dms.message }</label> <br>
		            			</div>
		            		</c:when>
		            		
		            		<c:otherwise>
		            			<label class="border border-outline-secondary rounded p-1">${dms.message }</label> <br>
		            		</c:otherwise>
		            	
		            	</c:choose>
		            </c:forEach>
		          </div>
		          <div class="form-group">
		          	<label>Message:</label>
		            <textarea id="messageInput" class="form-control" id="message-text"></textarea>
		          </div>
  
		      </div>
		      
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		        <button id="saveBtn" type="button" class="btn btn-primary">메세지 보내기</button>
		      </div>
		    </div>
		  </div>
		</div>
		
	
	<script>
		$(document).ready(function() {
			
		
			
			$("#saveBtn").on("click", function(e) {
				e.preventDefault();
				
				let message = $("#messageInput").val();
				let userIdOthers = ${user.id}
				
				if(message == ""){
					alert("메세지를 입력하세요.");
					return;
				}
				
				
				$.ajax({
					type:"post"
					, url:"/individual/message"
					, data:{"userIdOthers":userIdOthers, "message":message}
					, success: function(data){
						
						if(data.result == "success"){
							location.reload();
							return;
						} else {
							alert("메세지 보내기 실패");
							return;
						}
						
					}
					, error: function(){
						alert("메세지 보내기 에러");
						return;
					}
					
				});
				
			});
			
		});
	
	</script>

</body>
</html>