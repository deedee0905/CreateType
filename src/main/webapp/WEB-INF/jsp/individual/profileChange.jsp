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
						<h3>현재 프로필 수정</h3>
						<h5 class="mt-3">프로필 사진</h5>
						
						
						<div class="profile-section">
							<img id="imageBox" class="rounded" width="100" height="100" alt="프로필 사진" src="https://cdn.pixabay.com/photo/2015/03/30/12/37/jellyfish-698521_960_720.jpg">
							<input id="profileImageInput" class="form-control form-control-sm mt-2" type="file">
							<button id="imageDelete" type="reset" class="btn btn-sm btn-outline-secoundary text-secondary text-end mt-1" style="float: right">이미지 삭제</button>
						</div>
						
					</div>
					
					<div class="mt-5">
						<h5>닉네임</h5>
						<input id="nicknameInput" class="form-control form-control-sm mt-2" value="${user.nickname }">
						<label class="text-secondary">1자 이상 32자 이내로 입력해주세요.</label>
					</div>
					
					<div class="mt-5 mb-3">
						<div class="d-flex justify-content-between">
							<a class="btn btn-outline-secondary text-dark" href="/individual/profile/view">취소</a>
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
			
		
			
			$("#saveBtn").on("click", function(e) {
				let file = $("#profileImageInput").val();
				let nickname = $("#nicknameInput").val();
				
				
				if(nickname == ""){
					alert("닉네임을 입력하세요");
					return;
				}
				
				var formData = new FormData();
				formData.append("file", $("#profileImageInput")[0].files[0]);
				formData.append("nickname", nickname);
				
				$.ajax({
					type:"get"
					, url:"/individual/profile/individual"
					, data: formData
					, enctype:"multipart/form-data"
					, processData:false
					, contentType:false
					, success:function(data) {
						
						if(data.result == "success"){
							alert("프로필 변경 성공");
						} else {
							alert("프로필 변경 실패");
						}
						
					}
					, error:function() {
						alert("프로필 변경 에러");
					}
				});
				
				
			});
			
			
			
			
		});
	
	</script>

</body>
</html>