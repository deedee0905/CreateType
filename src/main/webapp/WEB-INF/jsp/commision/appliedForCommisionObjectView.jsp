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
<title>커미션 신청서 확인하기</title>
</head>
<body>
	<div class="container">
		<header>
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
		</header>
		
		<section>
			<div class="d-flex justify-content-center">
				<div class="text-center border p-2" style="width:550px">
					<div>
						<div>
							<label style="color:rgb(236, 130, 171);">${applicant.nickname }</label> 님의 커미션 신청서 
						</div>
						<div class="rounded border border-outline-secondary mt-2">
							${commisionProposal.content }
							
							
						</div>
						<div class="mb-1 mt-2">
							<h5 class="font-weight-bold text-warning">${commisionProposal.processing }</h5>
						</div>
					</div>
				</div>
				</div>
				<div class="d-flex justify-content-center mt-2">
					<div>
						<button class="btn btn-outline-secondary text-dark" data-toggle="modal" data-target="#work">작업 시작하기</button>
						<button id="messageBtn" class="btn btn-outline-secondary text-dark ml-1" data-toggle="modal" data-target="#exampleModal">메세지 하기</button>
					</div>
				</div>
		</section>
		
		<footer>
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		</footer>
		
	</div>
	
	<%-- dm모달 --%>
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
		            <c:forEach var="messageList" items="${messageList }">
		            	<c:choose>
	            		<c:when test="${messageList.userId == userId }">
		            			<div class="text-right">
		            				<label class="text-info border border-outline-secondary rounded p-1">${messageList.message }</label> <br>
		            			</div>
		            		</c:when>
		            		
		            		<c:otherwise>
		            			<label class="border border-outline-secondary rounded p-1">${messageList.message }</label> <br>
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
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button id="saveBtn" type="button" class="btn btn-primary">Send message</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- 작업시작 Modal -->
		<div class="modal fade" id="work" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">상태변경 확인창</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        작업상태를 변경하시겠습니까?
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		        <button id="workUpdateBtn" type="button" class="btn btn-primary">변경</button>
		      </div>
		    </div>
		  </div>
		</div>

	<script>
		$(document).ready(function() {
			
			$("#workUpdateBtn").on("click", function(e) {
				e.preventDefault();
				
				let id = ${commisionProposal.id }
				let processing = "작업 진행중";
				
				$.ajax({
					type:"get"
					, url:"/commision/workUpdate"
					, data:{"id":id, "processing":processing}
					, success: function(data){
						if(data.result == "success"){
							alert("작업상태 변경 성공");
							return;
						} else {
							alert("작업상태 변경 실패")
							return;
						}
					}
					, error: function(){
						alert("작업상태 변경 에러");
						return;
					}
					
				});
				
				
			});
			
			$("#saveBtn").on("click", function(e) {
				e.preventDefault();
				
				let userId = ${userId}
				let message = $("#messageInput").val();
				let userIdOthers = ${applicant.id}
				
				if(message == ""){
					alert("메세지를 입력하세요.");
					return;
				}
				
				
				$.ajax({
					type:"post"
					, url:"/individual/message"
					, data:{"userId":userId, "userIdOthers":userIdOthers, "message":message}
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