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
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<header>
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
		</header>
		
		<section>
			<div class="d-flex justify-content-center">
				<div>
		          <div class="rounded p-1 border border-outline-info" style="width:550px">
		            <c:forEach	var="messageList" items="${messageList }">
		            	<c:choose>
	            			<c:when test="${messageList.userId == userId }">
		            			<div class="text-right message">
		  							<i data-id="${messageList.id }" class="bi bi-x messageDeleteBtn text-secondary" data-toggle="modal" data-target="#exampleModal"></i>
		            				<label class="text-info border border-outline-secondary rounded p-1">${messageList.message }</label> <br>
		            			</div>
		            		</c:when>
		            		
		            		<c:otherwise>
		            			<label class="border border-outline-secondary rounded p-1">${messageList.message }</label> <br>
		            		</c:otherwise>
		            	</c:choose>
		            </c:forEach>
		          </div>
		          <label class="mt-3">Message:</label>
			      <div class="d-flex" style="width:550px">
			        <input id="messageInput" class="form-control" id="message-text">
			      	<button id="saveBtn" type="button" class="btn btn-primary ml-2">Send message</button>
			      	<a href="/individual/messageList/view?userIdOthers=${userIdOthers }"><i class="text-dark bi bi-arrow-clockwise mt-2 ml-1" style="font-size:20px"></i></a>
			      </div>

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
	        <h5 class="modal-title" id="exampleModalLabel">메세지 삭제하기</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        해당 메시지를 삭제하시겠습니까? <br>
	        삭제된 메시지는 복구할 수 없습니다.
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	        <button id="deleteBtn" type="button" class="btn btn-danger">삭제하기</button>
	      </div>
	    </div>
	  </div>
	</div>

	<script>
		$(document).ready(function() {
			
			$("#deleteBtn").on("click", function(e) {
				e.preventDefault();
				
				let id = $(this).data("id");
				
				$.ajax({
					type:"get"
					, url:"/individual/message/delete"
					, data:{"id":id}
					, success: function(data){
						if(data.result == "success"){
							location.reload();
							return;
						} else {
							alert("메세지 삭제 실패");
							return;
						}
					}
					, error: function(){
						alert("메세지 삭제 에러");
						return;
					}
					
				});
				
			});
			
			$(".messageDeleteBtn").on("click", function(e) {
				e.preventDefault();
				
				let id = $(this).data("id")
				
				$("#deleteBtn").data("id", id);
				
			});
			
			$("#saveBtn").on("click", function(e) {
				e.preventDefault();
				
				let message = $("#messageInput").val();
				let userIdOthers = ${userIdOthers}
			
				
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