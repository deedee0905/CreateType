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
	
	      <div class="border border-primary rounded p-3">
	
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
			    <label class="text-primary small d-none " id="availableNicknameText">사용 가능한 닉네임입니다.</label>
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
    	<label><a href="http://localhost:8080/post/main/view" style="color:deepskyblue">메인페이지로 돌아가기</a></label>
    </div>

<script>
	
	$(document).ready(function() {
		// isDuplicateCheck가 false면 중복검사 하기 전 상태
		// isDuplicateCheck가 true면 중복검사 한 상태
		var isDuplicateCheck1 = false;
		var isDuplicateCheck2 = false;
		var isDuplicateCheck3 = false;
		
		// true면 중복, false면 중복 아님
		var isDuplicateId = true;
		var isDuplicateNickname = true;
		var isDuplicateEmail = true;
		
		// 아이디 입력 인풋을 건드리는 순간 기본값 초기화
		$("#IdInput").on("input", function() {
		
			isDuplicateCheck1 = false;
			isDuplicateId = true;
			
			$("#duplicateIdText").addClass("d-none");
			$("#availableIdText").addClass("d-none");
		});
		
		// 닉네임 입력 인풋을 건드리는 순간 기본값 초기화
		$("#nicknameInput").on("input", function() {
			isDuplicateCheck2 = false;
			isDuplicateNickname = true;
			
			$("#duplicateNicknameText").addClass("d-none");
			$("#availableNicknameText").addClass("d-none");
		});
		
		// 이메일 입력 인풋을 건드리는 순간 기본값 초기화
		$("#emailInput").on("input", function() {
			isDuplicateCheck3 = false;
			isDuplicateEmail = true;
			
			$("#duplicateEmailText").addClass("d-none");
			$("#availableEmailText").addClass("d-none");
		});
		
		
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
					
					isDuplicateCheck1 = true;
					
					if(data.is_duplicate){ // 중복일시
						
						isDuplicateId = true;
						$("#duplicateIdText").removeClass("d-none");
						$("#availableIdText").addClass("d-none");
						
						
					} else { // 중복이 아닐시
						$("#duplicateIdText").addClass("d-none");
						$("#availableIdText").removeClass("d-none");
						isDuplicateId = false;
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
				type: "get"
				, url: "/user/signin/duplicateNickname"
				, data: {"nickname":nickname}
				,success: function(data){
					
					isDuplicateCheck2 = true;
					
					if(data.is_duplicateNickname){ // 중복일시
						isDuplicateNickname = true;
						$("#duplicateNicknameText").removeClass("d-none");
						$("#availableNicknameText").addClass("d-none");
						
					} else { // 중복이 아닐시
						$("#duplicateNicknameText").addClass("d-none");
						$("#availableNicknameText").removeClass("d-none");
						isDuplicateNickname = false;
						
					}
					
				}
				,error: function(){
					alert("닉네임 중복검사 에러");
				}
			});
				
					
			});
		
		
		$("#emailCheckBtn").on("click", function() {
			let email = $("#emailInput").val();
			
			//유효성 검사
			if(email == ""){
				alert("이메일을 입력하세요.");
				return;
			}
			
			$.ajax({
				type: "get"
				, url: "/user/signin/duplicateEmail"
				, data: {"email":email}
				, success: function(data){
					
					isDuplicateCheck3 = true;
					
					if(data.is_duplicateEmail){ // 중복일시
						isDuplicateEmail = true;
						$("#duplicateEmailText").removeClass("d-none");
						$("#availableEmailText").addClass("d-none");
						
					} else { // 중복이 아닐시
						$("#duplicateEmailText").addClass("d-none");
						$("#availableEmailText").removeClass("d-none");
						isDuplicateEmail = false;
					}
					
				}
				, error: function(){
					alert("이메일 중복검사 에러");
				}
			});
			
		});
		
			
		
		
		$("#singupBtn").on("click", function(){
		
			let loginId = $("#IdInput").val();
			let nickname = $("#nicknameInput").val();
			let email = $("#emailInput").val();
			let password = $("#passwordInput").val();
			let passwordConfirm = $("#passwordConfirmInput").val();
			
			
			
			// 중복체크 여부 확인(중복체크가 진행되지 않으면 return)
			if(isDuplicateCheck1 == false || isDuplicateCheck2 == false || isDuplicateCheck3 == false){
				alert("중복체크를 진행해주세요");
				return
			}
			
			// 아이디 중복확인(중복된 상태면 return)
			if(isDuplicateId) {
				alert("아이디가 중복되었습니다");
				return;
			}
			
			// 닉네임 중복확인(중복된 상태면 return)
			if(isDuplicateNickname) {
				alert("닉네임이 중복되었습니다");
				return;
			}
			
			// 이메일 중복확인(중복된 상태면 return)
			if(isDuplicateEmail) {
				alert("이메일이 중복되었습니다");
				return;
			}
			
		
			
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
			
			if(password != passwordConfirm){
				alert("비밀번호가 일치하지 않습니다.");
				return;
			}
			
			$.ajax({
				type:"post"
				, url: "/user/signup"
				, data: {"loginId":loginId, "nickname":nickname, "email":email, "password":password}
				, success: function(data) {
					
					if(data.result == "success"
							&& isDuplicateCheck1
							&& isDuplicateCheck2
							&& isDuplicateCheck3
							&& !isDuplicateId
							&& !isDuplicateNickname
							&& !isDuplicateEmail
							){
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