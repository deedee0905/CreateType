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
<title>CreateType Signup</title>
</head>
<body>

	<div class="container">

	    <div class="mt-5 d-flex justify-content-center">
	
	      <div class="box1 border border-primary rounded p-3">
	
	        <h1 class="text-center" style="color:deepskyblue">회원가입</h1>
			<div class="d-flex mt-4">
		        <input type="text" placeholder="login ID" class="form-control" id="IdInput">
		        <button type="button" class="btn btn-secondary ml-2" id="idCheckBtn">중복확인</button>
			</div>
			
			<div class="mb-2">
				<label class="text-danger small d-none" id="duplicateIdText">중복된 ID입니다.</label>
			    <label class="text-primary small d-none" id="availableIdText">사용 가능한 ID입니다.</label>
			</div>
			
			
			<div class="d-flex mt-4">
		        <input type="text" class="form-control" placeholder="닉네임" id="nicknameInput">
		        <button type="button" class="btn btn-secondary ml-2" id="nicknameCheckBtn">중복확인</button>
			</div>
			
			<div class="mb-2">
				<label class="text-danger small d-none" id="duplicateNicknameText">중복된 닉네임입니다.</label>
			    <label class="text-primary small d-none" id="availableNicknameText">사용 가능한 닉네임입니다.</label>
			</div>
			
			<div class="d-flex mt-4">
		        <input type="text" class="form-control" placeholder="이메일" id="emailInput">
		        <button type="button" class="btn btn-secondary ml-2" id="emailCheckBtn">중복확인</button>
			</div>
			
			<div class="mb-2">
				<label class="text-danger small d-none" id="duplicateEmailText">중복된 이메일입니다.</label>
			    <label class="text-primary small d-none" id="availableEmailText">사용 가능한 이메일입니다.</label>
			</div>
			
	        <input type="password" placeholder="비밀번호" class=" form-control" id="passwordInput"> <br>
	
	        <input type="password" placeholder="비밀번호 확인" class="form-control" id="passwordConfirmInput"> <br>
	
	        <button type="button" style="background-color:deepskyblue" class="btn btn-block text-white" id="singupBtn">가입하기</button>
	
	      </div>
	
	    </div>
    </div>
    
    <div class="text-center mt-3">
    	<label><a href="http://localhost:8080/user/signin/view" style="color:deepskyblue">로그인 하기</a></label>
    </div>
    
    <div class="text-center">
    	<label><a href="http://localhost:8080/user/signin/view" style="color:deepskyblue">메인페이지로 돌아가기</a></label>
    </div>

<script>
	
	$(document).ready(function() {
		
		$("#idCheckBtn").on("click", function() {
			let loginId = $("#IdInput").val();
			
			//유효성 검사
			if(loginId == ""){
				alert("아이디를 입력하세요");
				return;
			}
			
			$.ajax({
				type:"get"
				, url: "/user/signin/duplicateId"
				, data: {"loginId":loginId}
				, success: function(data) {
					
					if(data.is_duplicate){ // 중복시
						$("#duplicateIdText").addClass("d-none");
						$("#availableIdText").removeClass("d-none");
						
					} else { // 중복이 아닐시
						$("#duplicateIdText").removeClass("d-none");
						$("#availableIdText").addClass("d-none");
					}
					
				}
				, error: function() {
					alert("아이디 중복확인 에러");
				}
				
			});
			
		});
		
		$("#nicknameCheckBtn").on("click", function() {
			let nickname = $("#nicknameInput").val();
			// 유효성 검사
			if(nickname == ""){
				alert("닉네임을 입력하세요");
				return;
			}
				
			$.ajax({
				type:"get"
				, url:"/user/signin/duplicateNickname"
				, data:{"nickname":nickname}
				,success:function(data){
					
					if(data.is_duplicateNickname){ // 중복시
						$("duplicateNicknameText").addClass("d-none");
						$("availableNicknameText").removeClass("d-none")
					} else {
						$("duplicateNicknameText").removeClass("d-none");
						$("availableNicknameText").addClass("d-none")
					}
					
				}
				,error:function(){
					alert("닉네임 중복검사 에러");
				}
			});
				
					
			});
			
		
		
		$("#singupBtn").on("click", function(){
		
			let loginId = $("#IdInput").val();
			let nickname = $("#nicknameInput").val();
			let email = $("#emailInput").val();
			let password = $("#passwordInput").val();
			let passwordConfirm = $("#passwordConfirmInput").val();
			
			// 유효성 검사
			
			if(loginId == ""){
				alert("아이디를 입력하세요");
				return;
			}
			
			if(nickname == ""){
				alert("닉네임을 입력하세요");
				return;
			}
			
			if(email == ""){
				alert("이메일을 입력하세요");
				return;
			}
			
			if(password == ""){
				alert("비밀번호를 입력하세요");
				return;
			}
			
			if(passwordConfirm == ""){
				alert("비밀번호를 확인하세요");
				return;
			}
			
			$.ajax({
				type:"post"
				, url: "/user/signup"
				, data: {"loginId":loginId, "nickname":nickname, "email":email, "password":password}
				, success: function(data) {
					
					if(data.result == "success"){
						location.href="/user/signin/view";
					} else {
						alert("회원가입 실패");
					}
				}
				, error: function() {
					alert("회원가입 에러");
				}
				
			});
			
		});
		
		
		
		
		
		
		
		
	});


</script>



</body>
</html>