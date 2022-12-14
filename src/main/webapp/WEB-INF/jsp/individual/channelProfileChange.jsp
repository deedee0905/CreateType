<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>

	<script
	  src="https://code.jquery.com/jquery-3.6.0.min.js"
	  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	  crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<meta charset="UTF-8">
<title>개인페이지 - 프로필 변경</title>
</head>
<body>
	
	<div class="container">
	
		<header>
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
		</header>
		
		<section>
			<div class="d-flex justify-content-center mt-4" >
				<div>
					<div>
						<h3>채널 프로필 수정</h3>
						<h5 class="mt-3">프로필 사진</h5>
						
						<div class="profile-section">
							<img class="rounded" width="100" height="100" alt="프로필 사진" src="${channel.channelImagePath }">
							<input id="fileInput" class="form-control form-control-sm mt-2" type="file">
							<a href="#" id="imageDelete" class="text-secondary text-end" style="float: right">이미지 삭제</a>
						</div>
					</div>
					
					<div class="mt-5">
						<h5>채널 이름 </h5>
						<input id="channelNameInput" class="form-control form-control-sm mt-2" value="${channel.channelName }">
						<label class="text-secondary">1자 이상 32자 이내로 입력해주세요.</label>
					</div>
					
					<div class="mt-1">
						<h5>자기소개</h5>
						<textarea id="channelInfoInput" class="form-control">${channel.channelInfo }</textarea>
						
					</div>
					
					<div class="mt-5 mb-3">
						<div class="d-flex justify-content-between">
							<a class="btn btn-outline-secondary text-dark" href="/individual/channel/view?channelId=${channelId}">취소</a>
							<button id="saveBtn" class="btn text-white" type="button" style="background-color:deepskyblue">변경내용 저장</button>
						</div>
					</div>
				</div>
			</div>
		</section>
	
		<footer>
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		</footer>
	</div>
	
	<script>
		$(document).ready(function() {
			
			$("#imageDelete").on("click", function() {
				
				let file = $("#fileInput").val("");
				
			});
			
			
			$("#saveBtn").on("click", function(e) {
				e.preventDefault();
				
				let file = $("#fileInput").val();
				let channelName = $("#channelNameInput").val();
				let channelInfo = $("#channelInfoInput").val();
				let url = "/individual/channel/view?channelId=" + ${channelId};
				
				if(channelName == ""){
					alert("채널 이름을 확인하세요.");
					return;
				}
				
				if(file == ""){
					alert("채널 프로필 사진을 확인하세요.");
					return;
				}
				
				var formData = new FormData();
				formData.append("file", $("#fileInput")[0].files[0]);
				formData.append("channelName", channelName);
				formData.append("channelInfo", channelInfo);
				
				$.ajax({
					type:"post"
					, url:"/individual/profile/channel"
					, data:formData
					, enctype:"multipart/form-data"
					, processData:false
					, contentType:false
					, success:function(data){
						
						if(data.result == "success"){
							location.href= url;
							return;
						} else {
							alert("실패");
							return;
						}
						
					}
					, error:function(){
						alert("채널 프로필 변경 에러");
					}
					
				});
				
			});
			
			
		});
	
	</script>

</body>
</html>